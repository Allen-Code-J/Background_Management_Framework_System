package com.example.springboot.controller.dto;

import lombok.Data;

/**
 * 接受前段登录请求参数
 */
@Data
public class UserDTO {
    private String username;
    private String password;
    private String nickname;
    private String avatarUrl;

}
