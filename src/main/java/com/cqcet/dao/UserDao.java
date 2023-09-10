package com.cqcet.dao;

import com.cqcet.entity.Admin;
import com.cqcet.entity.User;

public interface UserDao {
    public Admin getAdminByName(String name);
    public User getUserByName(String name);
    public int  setUserByName(String name,String pwd,String sex);
}
