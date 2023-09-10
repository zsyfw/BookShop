import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;
    @RequestMapping(value = "admin")
    public String admin(@RequestParam("username") String name, @RequestParam("userpwd") String pwd){
        Admin admin = new Admin();
        admin.setName(name);
        admin.setPwd(pwd);
        if (adminService.adminlogin(admin)>0){
            return "main";
        }else if (adminService.adminlogin(admin)<0){
            return "admin";
        }else {
            return "admin";
        }
    }
    @RequestMapping(value = "adminregister")
    public String adminregister(@RequestParam("username") String name,@RequestParam("userpwd1") String pwd){
        Admin admin = new Admin();
        admin.setName(name);
        admin.setPwd(pwd);
        if (adminService.adminregister(admin)>0){
            return "admin";
        }else if (adminService.adminregister(admin)<0){
            return "adminregister";
        }else {
            return "adminregister";
        }

    }
}
