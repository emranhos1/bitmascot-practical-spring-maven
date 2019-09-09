package com.bit.mascot.practical.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
@RequestMapping("/")
public class LoginController {

    @Autowired
    private UserService userService;

    /**
     * This Method Stands For Startup Login Page
     * */
    @RequestMapping(value = {"/", "login"}, method = RequestMethod.GET)
    public ModelAndView home(ModelMap model) {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("userPojo", new UserPojo());
        modelAndView.setViewName("login");

        return modelAndView;
    }

    /**
     * This Method Stands For Startup Registration Page
     * */
    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public ModelAndView registration() {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("userPojo", new UserPojo());
        modelAndView.setViewName("registration");

        return modelAndView;
    }

    /**
     * This Method Stands For Registration user's
     * */
    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public ModelAndView createNewUser(@Valid UserPojo userPojo) {
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.findUserByEmail(userPojo.getEmail());

        if (user == null) {
            userService.saveUser(userPojo);
            modelAndView.addObject("user", new UserPojo());
            modelAndView.addObject("message", "User registered Successfully!");
            modelAndView.setViewName("login");
        } else {
            modelAndView.addObject("message", "This User Already registered!");
            modelAndView.setViewName("registration");
        }

        return modelAndView;
    }
}