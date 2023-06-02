package com.rajkumar.sample.repository;

import com.rajkumar.sample.model.User;
import org.springframework.stereotype.Repository;

import java.util.Arrays;
import java.util.List;

@Repository
public class UserRepository {

    private List<User> users = Arrays.asList(
            new User(1,"Raj", 33, "India"),
            new User(2,"Shyam", 55, "India"),
            new User(3,"Ajay", 34, "India")
    );

    public User getUser(Integer id) {
      return users.stream()
              .filter(user -> user.getId() == 1)
              .findFirst()
              .orElseThrow(() -> new IllegalArgumentException());
    }

    public List<User> getUsers() {
        return users;
    }

}
