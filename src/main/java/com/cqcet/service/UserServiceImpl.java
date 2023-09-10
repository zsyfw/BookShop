package com.cqcet.service;

import com.cqcet.dao.UserDao;
import com.cqcet.entity.Admin;
import com.cqcet.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
@Repository
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDao userDao;

    @Override
    public int adminlogin(Admin admin) {
        Admin adminByName =userDao.getAdminByName(admin.getAd_name());
        if (adminByName!=null){
            if (adminByName.getAd_pwd().equals(admin.getAd_pwd())){
                return 1;
            }else {
                return -1;
            }
        }else {
            return 0;
        }
    }
    @Override
    public int login(User user) {
        User userByName = userDao.getUserByName(user.getName());
        if (userByName!=null){
            if (userByName.getPwd().equals(user.getPwd())){
                return 1;
            }else {
                return -1;
            }
        }else {
            return 0;
        }
    }

    @Override
    public int register(User user) {
        int userByName = userDao.setUserByName(user.getName(),user.getPwd(),user.getSex());
        if (userByName>0){
                return 1;
            }else if (userByName<0){
                return -1;
        }else {
            return 0;
        }
    }
}

