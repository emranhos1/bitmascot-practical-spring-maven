package com.bit.mascot.practical.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bit.mascot.practical.entity.User;
/**
* @author    Md. Emran Hossain<emranhos1@gmail.com>
* @version   1.0.00
* @since     1.0.00
*/
@Repository("userRepository")
public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}
