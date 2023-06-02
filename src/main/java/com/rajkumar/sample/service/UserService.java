package com.rajkumar.sample.service;

import com.rajkumar.sample.model.User;
import com.rajkumar.sample.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;


@Slf4j
@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    public User getUserById(Integer id) {
        log.info("Getting user by id : {}", id);
        return this.userRepository.getUser(id);
    }

    public List<User> getUsers() {
        log.info("Getting all users");
        return this.userRepository.getUsers();
    }
}
