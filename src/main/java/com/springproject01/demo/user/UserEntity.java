package com.springproject01.demo.user;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserEntity {
    private int user_id;
    private String login_id;
    private String user_name;
    private String password;
    private String email;
    private String profile;
    private String profile_img;
    private String created_at;
    private String updated_at;
}
