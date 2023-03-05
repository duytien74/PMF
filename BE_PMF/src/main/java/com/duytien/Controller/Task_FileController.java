package com.duytien.Controller;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.duytien.Dao.*;
import com.duytien.Model.*;
import com.duytien.service.DriveFileManager;
import com.duytien.service.GoogleDriveManager;
//import com.google.api.client.googleapis.media.MediaHttpDownloader;
//import com.google.api.client.http.InputStreamContent;
//import com.google.api.services.drive.Drive.Files.Get;
//import com.google.api.services.drive.model.File;

@CrossOrigin("*")
@RestController
public class Task_FileController {
    @Autowired
    Task_FileDAO task_FileDao;

    @Autowired
    AccountDAO accountDao;
    
    @Autowired
    TaskDAO taskDao;
    
    @Autowired
    ProjectDAO projectDao;
    
    
    @GetMapping("/pmf/Task_File/getAll")
    public List<Task_File> getAll() {
        List<Task_File> Task_File = task_FileDao.findAll();
        return Task_File;
    }
    
    @GetMapping("/xoa/{id}")
    public String xoa(@PathVariable("id") Integer id) {
    	task_FileDao.deleteById(id);
    	return "ok";
    }
    
    @GetMapping("/pmf/Task_File/getByUser/{username}")
    public List<Task_File> getByUser(@PathVariable("username")String username) {
        List<Task_File> Task_File = task_FileDao.findByUsername(username);
        return Task_File;
    }
    
    @GetMapping("/pmf/Task_File/getByTask/{id}")
    public List<Task_File> getByTask(@PathVariable("id") Integer id) {
        List<Task_File> Task_File = task_FileDao.findByTaskID(id);
        return Task_File;
    }
    
    @GetMapping("/pmf/Task_File/getByProject/{id}")
    public List<Task_File> getByProject(@PathVariable("id") Integer id) {
        List<Task_File> Task_File = task_FileDao.findByProjectID(id);
        return Task_File;
    }
    
    @GetMapping("/pmf/Task_File/getListInTask/{projectid}/{taskid}")
    public List<Task_File> getByProject(@PathVariable("projectid") Integer projectid, @PathVariable("taskid") Integer taskid) {
        List<Task_File> Task_File = task_FileDao.findListInTask(projectid, taskid);
        return Task_File;
    }
    
    //Luu thong tin nguoi dung upload vao task_file
    @PostMapping("/pmf/Task_File/saveFile")
	public Task_File saveTaskFile(@RequestBody Task_File file) {
    	
    	file.setAccount(accountDao.findById(file.getAccount().getUsername()).get());
		file.setTask(taskDao.findById(file.getTask().getTaskID()).get());
		file.setProject(projectDao.findById(file.getProject().getProjectID()).get());
		
		Date date = new Date();
		file.setCreateDate(date);
		task_FileDao.save(file);
     	return file;
	}
    
    //Upload file da chon len Google Drive
    @PostMapping("/pmf/Task_File/upload") 
    public Task_File uploadSingleFileExample4(@RequestBody MultipartFile file) {
      String path = "/FileUpload";
   	  System.out.println("Request contains, File: " + file.getOriginalFilename());
   	  DriveFileManager driveFileManager = new DriveFileManager();
   	  String fileId = driveFileManager.uploadFile(file, path);
   	  Task_File tf = new Task_File();
   	  tf.setCode(fileId);
   	  return tf;
   	}
    
// 	@RequestMapping("/pmf/getFile/{image}")
// 	@ResponseBody
// 	public ResponseEntity<?> getImage(@PathVariable("image") String image) {
//// 		if (!image.equals(null) || image != null) {
//// 			try {
//// 				Path filename = Paths.get("D:\\Hung_DATN\\GitHub_Code\\PMF\\File Upload", image);
//// 				byte[] buffer = Files.readAllBytes(filename);
//// 				ByteArrayResource bar = new ByteArrayResource(buffer);
//// 				return ResponseEntity.ok().contentLength(buffer.length)
//// 						.contentType(MediaType
//// 								.parseMediaType("*"))
//// 						.body(bar);
//// 			} catch (Exception e) {
////
//// 			}
//// 		}
////
//// 		return ResponseEntity.badRequest().build();
// 		
// 		Resource resource = null;
// 		try {
// 			resource = getFileAsResource(image);
// 		} catch (IOException e) {
// 			return ResponseEntity.internalServerError().build();
// 		}
// 		if (resource == null) {
//	 		return new ResponseEntity<>("File not found", HttpStatus. NOT_FOUND);
// 		}
//	 		String contentType="application/octet-stream";
//	 		String headerValue = "attachment; filename=\"" + resource.getFilename() + "\"";
//	 		
//	 		return ResponseEntity.ok()
//		 		.contentType(MediaType.parseMediaType (contentType))
//		 		.header (HttpHeaders.CONTENT_DISPOSITION, headerValue)
//		 		.body (resource);
// 	}
    
    //Upload file da chon vao thu muc File Upload
//    @PostMapping("/pmf/Task_File/upload") 
//    public Task_File uploadSingleFileExample4(@RequestBody MultipartFile file) {
//    	String uploadRootPath = "D:\\Hung_DATN\\GitHub_Code\\PMF\\File Upload";
//    	Task_File tf = new Task_File();
//    	File uploadRootDir = new java.io.File(uploadRootPath);
//    	if(!uploadRootDir.exists()) {
//    		uploadRootDir.mkdirs();
//    	}
//    	try {
//    		String uniquePassword = UUID.randomUUID().toString();
//    		String filename = uniquePassword+"_"+file.getOriginalFilename();
//    		File serverFile = new File(uploadRootDir.getAbsoluteFile() + File.separator +filename);
//    		BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
//    		stream.write(file.getBytes());
//    		stream.close();
//    		tf.setName(filename);
//    		tf.setCode(uniquePassword);
//    	}catch(Exception e) {
//    	}
//   	  return tf;
//   	}
//
//    private Path foundFile;
//    
//    public Resource getFileAsResource (String fileCode) throws IOException {
//	    Path uploadDirectory = Paths.get("D:\\Hung_DATN\\GitHub_Code\\PMF\\File Upload");
//	    Files.list(uploadDirectory).forEach(file -> {
//		    if (file.getFileName().toString().startsWith(fileCode)) {
//			    foundFile = file;
//			    return;
//		    }
//	    });
//	    if (foundFile != null) {
//	    	return new UrlResource (foundFile.toUri());
//	    }
//	    return null;
//    }
  	
}
