package com.cqcet.service;

import com.cqcet.entity.Admin;
import com.cqcet.entity.User;

public interface UserService {
    public int adminlogin(Admin admin);
    public int login(User user);
    public int register(User user);
}
