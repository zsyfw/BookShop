package com.cqcet.dao;

import com.cqcet.entity.Admin;
import com.cqcet.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Override
    public Admin getAdminByName(String ad_name) {
        RowMapper<Admin> rowMapper = new BeanPropertyRowMapper<>(Admin.class);
        try {
            Admin admin = jdbcTemplate.queryForObject("select * from bs_admin where ad_name=?", rowMapper, ad_name);
            return admin;
        }catch (EmptyResultDataAccessException e){
            return null;
        }
    }
    @Override
    public User getUserByName(String name) {
        RowMapper<User> rowMapper = new BeanPropertyRowMapper<>(User.class);
        try {
            User user = jdbcTemplate.queryForObject("select * from bs_user where name=?", rowMapper, name);
            return user;
        }catch (EmptyResultDataAccessException e){
            return null;
        }
    }
    @Override
    public int setUserByName(String name, String pwd,String sex) {
        RowMapper<User> rowMapper = new BeanPropertyRowMapper<>(User.class);

        try {
           User user = jdbcTemplate.queryForObject("select * from bs_user where name=?", rowMapper, name);
            return 0;
        } catch (EmptyResultDataAccessException e) {
        int user1 = jdbcTemplate.update("insert into bs_user(name,pwd,sex) values (?,?,?);", name, pwd,sex);
        //System.out.println("注册成功");
            return user1;
        }
    }
}