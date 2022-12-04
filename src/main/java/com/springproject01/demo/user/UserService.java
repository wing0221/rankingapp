package com.springproject01.demo.user;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository UserRepository;

    public List<UserEntity> findAll() {
        return UserRepository.findAll();
    }

    public UserEntity findById(int user_id) {
        return UserRepository.findById(user_id);
    }
}
