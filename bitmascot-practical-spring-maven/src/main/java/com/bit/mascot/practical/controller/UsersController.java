package com.bit.mascot.practical.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.mascot.practical.entity.User;
import com.bit.mascot.practical.pojo.UserPojo;
import com.bit.mascot.practical.service.UserService;
/**
* @author    Md. Emran Hossain<emranhos1@gmail.com>
* @version   1.0.00
* @since     1.0.00
*/
@Controller
@RequestMapping("/dashboard")
public class UsersController {

    @Autowired
    private UserService userService;

    /**
     * This Method Stands For userList
     * */
    @RequestMapping(path = "/userList")
    public ModelAndView userList() {
        ModelAndView modelAndView = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());

        modelAndView.addObject("userPojo", new UserPojo());
        modelAndView.addObject("users", userService.findAllUsers());
        modelAndView.addObject("userName", user.getFirstName());
        modelAndView.setViewName("admin/userList");

        return modelAndView;
    }

    /**
     * This Method Stands For Check Which Role
     * And Which Dashboard Going To Show
     * */
    @RequestMapping(value = {"/dashboard"}, method = RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView modelAndView = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());
        int userId = user.getId();

        //System.out.println("userId : "+userId);
        switch (userId) {
            case 1 :
                modelAndView.setViewName("redirect:/dashboard/userList");
                break;
            default:
                modelAndView.setViewName("redirect:/dashboard/profile");
                break;
        }

          //FIXME
//        switch (roleName) {
//        case "ADMIN" :
//            modelAndView.addObject("user", new User());
//            modelAndView.setViewName("admin/userList");
//            break;
//        case "USER" :
//            modelAndView.setViewName("dashboard/dashboard");
//            break;
//        default:
//            break;
//        }
        return modelAndView;
    }

    /**
     * This Method Stands For Showing User Profile
     * */
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ModelAndView userProfile() {
        ModelAndView modelAndView = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        User user = userService.findUserByEmail(auth.getName());
        modelAndView.addObject("user", user);
        modelAndView.addObject("userName", user.getFirstName());
        modelAndView.setViewName("dashboard/profile");

        return modelAndView;
    }

    /**
     * This Method Stands For Startup Change Password Page
     * */
    @RequestMapping(value = "/change/password", method = RequestMethod.GET)
    public ModelAndView changePassword() {
        ModelAndView modelAndView = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());

        modelAndView.addObject("userPojo", new UserPojo());
        modelAndView.addObject("userName", user.getFirstName());
        modelAndView.setViewName("dashboard/changePassword");

        return modelAndView;
    }

    /**
     * This Method Stands For Reset New Password
     * */
    @RequestMapping(value = "/new/password", method = RequestMethod.POST)
    public ModelAndView newPassword(UserPojo userPojo) {
        ModelAndView modelAndView = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        User user = userService.findUserByEmail(auth.getName());
        modelAndView.addObject("userName", user.getFirstName());

        if (userPojo.getNewPass().equals(userPojo.getConfirmPass())) {
            Boolean status = userService.isPasswordValid(userPojo.getPassword(), user.getPassword());
            if (status) {
                userService.changePassword(user, userPojo);
                modelAndView.addObject("message", "Password change Successfully!");
                modelAndView.setViewName("dashboard/changePassword");
            } else {
                modelAndView.addObject("message", "Current Password is Wrong!");
                modelAndView.setViewName("dashboard/changePassword");
            }
        } else {
            modelAndView.addObject("message", "Password doesn't matched!");
            modelAndView.setViewName("dashboard/changePassword");
        }

        return modelAndView;
    }
}