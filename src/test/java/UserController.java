import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "login")
    public String login(@RequestParam("username") String name, @RequestParam("userpwd") String pwd){
        User user = new User();
        user.setName(name);
        user.setPwd(pwd);
        if (userService.login(user) > 0) {
           return "userweb";
        } else if (userService.login(user) < 0) {
            return "login";
        } else {
            return "login";
        }
    }


    @RequestMapping(value = "register")
    public String register(@RequestParam("name") String name, @RequestParam("pwd") String pwd, @RequestParam("sex") String sex){
        User user = new User();
        user.setName(name);
        user.setPwd(pwd);
        user.setSex(sex);
        if(userService.register(user)>0){
            return "login";
        }
        else if (userService.register(user)<0){
            return "register";
        }else {
            return "register";
        }
    }


}
