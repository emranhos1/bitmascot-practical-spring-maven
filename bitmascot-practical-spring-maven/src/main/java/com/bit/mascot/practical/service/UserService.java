package com.bit.mascot.practical.service;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.bit.mascot.practical.entity.Role;
import com.bit.mascot.practical.entity.User;
import com.bit.mascot.practical.pojo.UserPojo;
import com.bit.mascot.practical.repository.RoleRepository;
import com.bit.mascot.practical.repository.UserRepository;
/**
* @author    Md. Emran Hossain<emranhos1@gmail.com>
* @version   1.0.00
* @since     1.0.00
*/
@Service("userService")
public class UserService {

    private UserRepository userRepository;
    private RoleRepository roleRepository;
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    @Autowired
    public UserService(UserRepository userRepository, RoleRepository roleRepository,
            BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    public List<UserPojo> findAllUsers() {
        List<User> users = userRepository.findAll();
        if (users != null) {
            List<UserPojo> userPojos = new ArrayList<>();
            for (User user : users) {
                UserPojo userPojo = new UserPojo();
                BeanUtils.copyProperties(user, userPojo);
                userPojo.setFirstName(user.getFirstName() + " " + user.getLastName());
                userPojo.setBirthDate(provideCurrentAge(user.getBirthDate()));
                userPojos.add(userPojo);
            }
            return userPojos;
        } else {
            return new ArrayList<>();
        }
    }
    /**
     * lasdjfklasdjfklas
     * 
     * */
    public String provideCurrentAge(String date) {
        Period period = providePerodDate(date);
        String age = null;
        String year = null;
        String day = null;
        String month = null;
        if (period.getYears() != 0) {
            year = string(period.getYears()) + " years ";
        }
        if (period.getMonths() != 0) {
            month = string(period.getMonths()) + " months ";
        }
        if (period.getDays() != 0) {
            day = string(period.getDays()) + " days ";
        }
        age = year + month + day;
        age = age.replaceAll("null", "");
        return age;
    }

    public static Period providePerodDate(String date) {
        LocalDate today = LocalDate.now();
        LocalDate birthday = LocalDate.parse(date);
        Period period = Period.between(birthday, today);
        return period;
    }

    public static String string(Integer integer) {
        return Integer.toString(integer);
    }

    public User findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public Optional<Role> findById(int id) {
        return roleRepository.findById(id);
    }

    public void changePassword(User user, UserPojo userPojo) {
        user.setPassword(bCryptPasswordEncoder.encode(userPojo.getNewPass()));
        userRepository.save(user);
    }

    public boolean isPasswordValid(String databasedPass, String givenPassword) {
        if (BCrypt.checkpw(databasedPass, givenPassword)) {
            return true;
        } else {
            return false;
        }
    }

    public void signUp(UserPojo userPojo) {

    }

    public User saveUser(UserPojo userPojo) {
        User user = new User();
        user.setEmail(userPojo.getEmail());
        user.setFirstName(userPojo.getFirstName());
        user.setLastName(userPojo.getLastName());
        user.setAddress(userPojo.getAddress());
        user.setPhone(userPojo.getPhone());
        user.setBirthDate(userPojo.getBirthDate());
        user.setPassword(bCryptPasswordEncoder.encode(userPojo.getPassword()));
        user.setActive(1);

        Role role = new Role();
        role.setRole("USER");
        role.setUser(user);
        user.setRoles(new HashSet<>(Arrays.asList(role)));
        return userRepository.save(user);
    }
}
