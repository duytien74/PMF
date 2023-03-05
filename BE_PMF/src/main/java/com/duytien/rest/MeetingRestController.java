package com.duytien.rest;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.duytien.Dao.AccountDAO;
import com.duytien.Dao.ProjectDAO;
import com.duytien.Dao.ScheduleCategoryDAO;
import com.duytien.Dao.TaskDefinitionDAO;
import com.duytien.Dao.Team_MembersDAO;
import com.duytien.Model.Account;
import com.duytien.Model.Activity;
import com.duytien.Model.Project;
import com.duytien.Model.ScheduleCategory;
import com.duytien.Model.TaskDefinition;
import com.duytien.service.TaskDefinitionBean;
import com.duytien.service.TaskSchedulingService;
import com.nhathanh.bean.MailInfo;
import com.nhathanh.until.Utilities;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
public class MeetingRestController {
	@Autowired
	ProjectDAO prDAO;
	@Autowired
	Team_MembersDAO memDAO;
	@Autowired
	TaskDefinitionDAO meetDAO;
	@Autowired
	ScheduleCategoryDAO scheduleDAO;
	@Autowired
	AccountDAO accDAO;
	@Autowired
	TaskSchedulingService taskSchedulingService;
	@Autowired
	Team_MembersDAO tmsDAO;

	// Get all projetc of user
	@GetMapping("/pmf/nhathanh/get/projectOfUser/{username}")
	public List<Project> getAllProjectOfUser(@PathVariable("username") String username) {
		List<Project> listProject = prDAO.getAllProjectsRelevantToAccount(username);
		List<Project> list = new ArrayList<>();
		for (Project pj : listProject) {
			String acc = prDAO.checkIfOwner(pj.getTeam().getTeamID()).getAccount().getUsername();
			if (acc.equals(username)) {
				list.add(pj);
			}
		}
		return list;
	}

	// Get all member of project
	@GetMapping("/pmf/nhathanh/member/all/{prId}")
	public List<Account> getAllMember(@PathVariable("prId") Integer idProject) {
		return memDAO.getListTeamMember(idProject);
	}

	// Get all value SCHEDULE
	@GetMapping("/pmf/all/schedule")
	public List<TaskDefinition> getAllSchedule() {
		return meetDAO.findAll();
	}

	// Get SCHEDULE BY USERNAME
	@GetMapping("/pmf/username/schedule/{username}")
	public List<Object> ScheduleOfUser(@PathVariable("username") String username) {
		List<TaskDefinition> ds = meetDAO.findDataByUsername(username);

		List<Object> dsReturn = new ArrayList<>();
		HashMap<Integer, String> meetHost = new HashMap<Integer, String>();

		for (int i = 0; i < ds.size(); i++) {
			if (ds.get(i).getDecision() == 3 || ds.get(i).getDecision() == 2) {
				ds.remove(i);
			}
		}
		for (TaskDefinition ts : ds) {
			String hostProject = prDAO.getOwnerProject(ts.getProject().getProjectID());
			meetHost.put(ts.getProject().getProjectID(), hostProject);
		}
		dsReturn.add(0, ds);
		dsReturn.add(1, meetHost);
		return dsReturn;
	}

	// Load meeting waiting accpet
	@GetMapping("/pmf/username/schedule/waiting/{username}")
	public List<TaskDefinition> ScheduleOfUserWating(@PathVariable("username") String username) {
		List<TaskDefinition> ds = meetDAO.getScheduleByUsername(username);
		return ds;
	}

	// Save new meeting
	@PostMapping("/pmf/create/meeting")
	public void create(@RequestBody Activity data) throws ParseException {
		// Get members in project
		Project pro = prDAO.findById(data.getProjectID()).get();
		List<Account> dsAc = memDAO.getListTeamMember(data.getProjectID());
		String title = data.getActivityName();
		String link = data.getUsername();
		String des = data.getDiscription();
		ScheduleCategory sc = scheduleDAO.findById(2).get();

		for (Account ac : dsAc) {
			SimpleDateFormat DateFor = new SimpleDateFormat("dd-M-yyyy HH:mm:ss");
			String jobID = UUID.randomUUID().toString().toUpperCase();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-M-yyyy HH:mm:ss");
			// CronExpress
			LocalDateTime datetime = LocalDateTime.parse(DateFor.format(data.getStartDate()).toString(), formatter);
			datetime = datetime.minusMinutes(60);
			String cronExpression = "0 " + datetime.getMinute() + " " + datetime.getHour() + " "
					+ datetime.getDayOfMonth() + " " + datetime.getMonthValue() + " ? ";
			TaskDefinition taskDefinition = new TaskDefinition(jobID, cronExpression, title, link, des, pro, null, ac,
					sc, 1, data.getStartDate(), 3);
			TaskDefinitionBean bean = new TaskDefinitionBean();
			bean.setTaskDefinition(taskDefinition);
			taskSchedulingService.scheduleATask(jobID, bean, taskDefinition.getCronExpress());
			meetDAO.save(taskDefinition);
			String hostProject = prDAO.getOwnerProject(pro.getProjectID());
			if (ac.getUsername().equals(hostProject)) {
				taskDefinition.setDecision(1);
				meetDAO.save(taskDefinition);
			}else {
				//Send mail reminding user about the meeting
				// Send notification remind user by email
				remindByEmailMeeting(taskDefinition,accDAO.findById(hostProject).get().getFullname());
			}
		}
	}
	public void remindByEmailMeeting(TaskDefinition ts,String creator) {
		String urlSendMail = "http://localhost:8080/pmf/sendMail/notification";
		// Set body email
		Utilities unti = new Utilities();
		SimpleDateFormat DateFor = new SimpleDateFormat("hh:mm, MMMMM dd yyyy");
		String body =unti.sendMaillAlertMeeting(ts.getAccount().getFullname(),ts.getProject().getProjectName(), 
				creator, DateFor.format(ts.getStartDate()).toString());
		// Set properties for MailInfor (user information)
		MailInfo info = new MailInfo();
		info.setBody(body);
		info.setTo(ts.getAccount().getEmail()); 
		info.setSubject("Reminding your meeting");
		// Send maill notification to user by email
		sendPostApi(urlSendMail, info);
	}
	private void sendPostApi(String url, MailInfo content) {
		RestTemplate restTemplate = new RestTemplate();
		String urlSendMail = url;
		HttpEntity<MailInfo> request = new HttpEntity<>(content);
		restTemplate.postForObject(urlSendMail, request, MailInfo.class);
	}

	// Find meeting host
	@GetMapping("/pmf/nhathanh/check/meetingHost/{jobID}")
	public Account meetingHost(@PathVariable("jobID") String jobID) {
		// Get meeting by JobID
		TaskDefinition ds = meetDAO.getMeetingById(jobID);
		String username = prDAO.getOwnerProject(ds.getProject().getProjectID());
		return accDAO.findById(username).get();
	}

	// Get member meeting
	@GetMapping("/pmf/nhaThanh/members/meeting/{jobID}/{idProject}")
	public ArrayList<Object> membersInMeeting(@PathVariable("jobID") String jobID,
			@PathVariable("idProject") int idPro) {
		ArrayList<Object> returnObject = new ArrayList<>();
		List<Account> listAc = tmsDAO.getListTeamMember(idPro);

		// Get quantity members not invite yet
		int notInvite = 0;
		TaskDefinition getLink = meetDAO.findById(jobID).get();
		List<TaskDefinition> dsSchedule = meetDAO.getMembersInMeeting(getLink.getProject().getProjectID(),
				getLink.getLink());
		//// Create a HashMap object called capitalCities
		HashMap<String, Integer> descision = new HashMap<String, Integer>();
		HashMap<String, String> jobIdMeeting = new HashMap<String, String>();

		for (int i = 0; i < dsSchedule.size(); i++) {
			for (int j = 0; j < listAc.size(); j++) {
				if (dsSchedule.get(i).getAccount().getUsername().equals(listAc.get(j).getUsername())) {
					listAc.remove(j);
				}
			}
		}
		notInvite = listAc.size();
		// Set desicion for user not invite yet
		for (Account ac : listAc) {
			descision.put(ac.getUsername(), 4);
			jobIdMeeting.put(ac.getUsername(), "EMPTY");
		}
		for (TaskDefinition ts : dsSchedule) {
			Account newAccount = accDAO.findById(ts.getAccount().getUsername()).get();
			listAc.add(newAccount);
			descision.put(newAccount.getUsername(), ts.getDecision());
			jobIdMeeting.put(ts.getAccount().getUsername(), ts.getJobID());
		}
		returnObject.add(0, listAc);
		returnObject.add(1, calculatePercent(dsSchedule, notInvite));
		returnObject.add(2, descision);
		returnObject.add(3, jobIdMeeting);

		return returnObject;
	}

	// Calculate percent
	public ArrayList<Integer> calculatePercent(List<TaskDefinition> ds, int notInvite) {
		ArrayList<Integer> list = new ArrayList<Integer>();
		int watingMembers = 0;
		int joinMembers = 0;
		int refushMembers = 0;
		int notInviteMembers = notInvite;
		for (int i = 0; i < ds.size(); i++) {
			if (ds.get(i).getDecision() == 1) {
				joinMembers += 1;
			}
			if (ds.get(i).getDecision() == 2) {
				refushMembers += 1;
			}
			if (ds.get(i).getDecision() == 3) {
				watingMembers += 1;
			}
		}
		list.add(0, joinMembers);
		list.add(1, refushMembers);
		list.add(2, watingMembers);
		list.add(3, notInviteMembers);
		return list;
	}

	// Get meeting by JobID
	@GetMapping("/pmf/nhathanh/meeting/find/{jobID}")
	public TaskDefinition getOne(@PathVariable("jobID") String jobID) {
		return meetDAO.findById(jobID).get();
	}

	// Get people in meeting by decision
	@GetMapping("/pmf/nhathanh/invite/other/{jobID}/{decision}")
	public List<Object> otherPeople(@PathVariable("jobID") String jobID, @PathVariable("decision") int decision) {
		ArrayList<Object> returnObject = new ArrayList<>();
		List<Account> listAc = new ArrayList<>();
		TaskDefinition tk = meetDAO.findById(jobID).get();
		HashMap<String, String> jobIdMeeting = new HashMap<String, String>();
		// decision =5 is user not invite yet!
		if (decision == 5) {
			List<Account> listMemberInProject = tmsDAO.getListTeamMember(tk.getProject().getProjectID());
			List<TaskDefinition> dsSchedule = meetDAO.getMembersInMeeting(tk.getProject().getProjectID(), tk.getLink());
			for (int i = 0; i < dsSchedule.size(); i++) {
				for (int j = 0; j < listMemberInProject.size(); j++) {
					if (dsSchedule.get(i).getAccount().getUsername().equals(listMemberInProject.get(j).getUsername())) {
						listMemberInProject.remove(j);
					}
				}
			}
			for (int i = 0; i < listMemberInProject.size(); i++) {
				listAc.add(listMemberInProject.get(i));
				jobIdMeeting.put(listMemberInProject.get(i).getUsername(), "Empty");
			}

		} else {
			List<TaskDefinition> dsTask = meetDAO.getMembersInMeetingCondition(tk.getProject().getProjectID(),
					decision);
			for (int i = 0; i < dsTask.size(); i++) {
				if (tk.getLink().equals(dsTask.get(i).getLink())) {
					listAc.add(accDAO.findById(dsTask.get(i).getAccount().getUsername()).get());
					jobIdMeeting.put(dsTask.get(i).getAccount().getUsername(), dsTask.get(i).getJobID());
				}
			}
		}
		returnObject.add(0, listAc);
		returnObject.add(1, jobIdMeeting);
		return returnObject;
	}

	// Invite people when they refuse or they not invite yet!
	@GetMapping("/pmf/invite/people/inmeeting/{idPro}/{idMeet}")
	public List<Object> inviteNewPeopleInMeeting(@PathVariable("idPro") int idPro,
			@PathVariable("idMeet") String idMeet) {
		ArrayList<Object> returnObject = new ArrayList<>();
		List<Account> dsAcReturn = new ArrayList<>();
		List<Account> listMembersInProject = tmsDAO.getListTeamMember(idPro);
		HashMap<String, String> jobIdMeeting = new HashMap<String, String>();
		TaskDefinition tk = meetDAO.findById(idMeet).get();
		List<TaskDefinition> dsSchedule = meetDAO.getMembersInMeeting(tk.getProject().getProjectID(), tk.getLink());
		// Remove user not invite yet
		for (int i = 0; i < dsSchedule.size(); i++) {
			for (int j = 0; j < listMembersInProject.size(); j++) {
				if (dsSchedule.get(i).getAccount().getUsername().equals(listMembersInProject.get(j).getUsername())) {
					listMembersInProject.remove(j);
				}
			}
		}
		for (TaskDefinition ts : dsSchedule) {
			// Value 2 User refuses this meeting before
			if (ts.getDecision() == 2) {
				dsAcReturn.add(accDAO.findById(ts.getAccount().getUsername()).get());
				jobIdMeeting.put(ts.getAccount().getUsername(), ts.getJobID());
			}
		}

		// Add user to list return
		for (Account ac : listMembersInProject) {
			dsAcReturn.add(ac);
			jobIdMeeting.put(ac.getUsername(), "Empty");
		}
		returnObject.add(0, dsAcReturn);
		returnObject.add(1, jobIdMeeting);
		return returnObject;

	}

	// Add new people when they refuse in the meeting
	@GetMapping("/pmf/nhathanh/invite/new/people/{idMeet}")
	public TaskDefinition inviteNewPeople(@PathVariable("idMeet") String idMeet) {
		TaskDefinition newTs = meetDAO.findById(idMeet).get();
		// User wating
		newTs.setDecision(3);
		// Update decision of user is wating
		return meetDAO.save(newTs);
	}

	// Add new people when they not invite in the meeting
	@GetMapping("/pmf/nhathanh/invite-not-yet/new/people/{idMeet}/{username}")
	public TaskDefinition inviteNewPeopleNotInviteYet(@PathVariable("idMeet") String idMeet,
			@PathVariable("username") String username) {
		TaskDefinition newTs = meetDAO.findById(idMeet).get();

		ScheduleCategory sc = scheduleDAO.findById(2).get();
		SimpleDateFormat DateFor = new SimpleDateFormat("dd-M-yyyy HH:mm:ss");
		String jobID = UUID.randomUUID().toString().toUpperCase();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-M-yyyy HH:mm:ss");
		// CronExpress
		LocalDateTime datetime = LocalDateTime.parse(DateFor.format(newTs.getStartDate()).toString(), formatter);
		datetime = datetime.minusMinutes(60);
		String cronExpression = "0 " + datetime.getMinute() + " " + datetime.getHour() + " " + datetime.getDayOfMonth()
				+ " " + datetime.getMonthValue() + " ? ";
		TaskDefinition taskDefinition = new TaskDefinition(jobID, cronExpression, newTs.getTitle(), newTs.getLink(),
				newTs.getDescription(), newTs.getProject(), null, accDAO.findById(username).get(), sc, 1,
				newTs.getStartDate(), 3);
		TaskDefinitionBean bean = new TaskDefinitionBean();
		bean.setTaskDefinition(taskDefinition);
		taskSchedulingService.scheduleATask(jobID, bean, taskDefinition.getCronExpress());
		return meetDAO.save(taskDefinition);
	}

	// Accept or refush meeting
	@GetMapping("/pmf/nhathanh/accept/refuse/{idMeet}/{decision}")
	public TaskDefinition acceptOrRefush(@PathVariable("idMeet") String idMeet,
			@PathVariable("decision") int dicision) {
		TaskDefinition newTs = meetDAO.findById(idMeet).get();
		newTs.setDecision(dicision);
		return meetDAO.save(newTs);
	}

	@DeleteMapping("/pmf/remove/meeting/{jobID}")
	public void stopMeeting(@PathVariable("jobID") String jobID) {
		TaskDefinition meet = meetDAO.findById(jobID).get();
		List<TaskDefinition> ds = meetDAO.findAll();
		for (TaskDefinition ts : ds) {
			if (meet.getLink().equals(ts.getLink())) {
				meetDAO.deleteById(ts.getJobID());
			}
		}
	}

}
