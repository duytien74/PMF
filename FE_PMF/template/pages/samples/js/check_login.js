//Check login
function checkLogin() {
    if (sessionStorage.getItem("user") == null) {
        alert("Plese login with your account!");
        window.location.href = "/template/pages/samples/login.html";
    }
}
checkLogin();
//Logout
function logout() {
    sessionStorage.clear();
    alert("Logout successful!");
    window.location.href = "/template/pages/samples/login.html";
}
//Check session when user unactive
var waiting = 0;
var checkTime = setInterval(function() {
    if (document.hasFocus()) {
        waiting = 0;
    } else {
        waiting++;
        //Xu ly sau khi nguoi dung khong su dung
        if (waiting == 1800) {
            //Remove data in database
            clearInterval(checkTime);
            sessionStorage.clear();
            window.location.href = "/template/pages/samples/login.html";
        }
    }
}, 1000);