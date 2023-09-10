package com.cqcet.dao;

import com.cqcet.entity.Books;
import com.cqcet.entity.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class BookDaoImpl implements BookDao{

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Books> getBookByName(String book_name) {
        try {
            List<Books> booksList=new ArrayList<>();
            SqlRowSet rowSet= jdbcTemplate.queryForRowSet("select * from bs_books where book_name like CONCAT('%',?,'%')",  book_name);
            while (rowSet.next()){
                Books books=new Books();
                books.setBook_id(rowSet.getInt("book_id"));
                books.setBook_name(rowSet.getString("book_name"));
                books.setBook_author(rowSet.getString("book_author"));
                books.setBook_num(rowSet.getInt("book_num"));
                books.setBook_price(rowSet.getDouble("book_price"));
                books.setBook_detail(rowSet.getString("book_detail"));
                booksList.add(books);
            }
            return booksList;
        }catch (EmptyResultDataAccessException e){
            return null;
        }
    }

    @Override
    public List<Books> getBookAuthor(String book_author) {
        try {
            List<Books> booksList=new ArrayList<>();
            SqlRowSet rowSet = jdbcTemplate.queryForRowSet("select * from bs_books where book_author like CONCAT('%',?,'%')", book_author);
            while (rowSet.next()){
                Books books=new Books();
                books.setBook_id(rowSet.getInt("book_id"));
                books.setBook_name(rowSet.getString("book_name"));
                books.setBook_author(rowSet.getString("book_author"));
                books.setBook_num(rowSet.getInt("book_num"));
                books.setBook_price(rowSet.getDouble("book_price"));
                books.setBook_detail(rowSet.getString("book_detail"));
                booksList.add(books);
            }
            return booksList;
        }catch (EmptyResultDataAccessException e){
            return null;
        }
    }

    @Override
    public int addBook(int id,String name, String author, int num, double price,String detail) {
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet("select * from bs_books where book_id =?", id);
        if (rowSet.next()) {
            return 0;
        }else{
            int add=jdbcTemplate.update("INSERT INTO bs_books(book_id,book_name,book_author,book_num,book_price,book_detail) VALUES (?,?,?,?,?,?);",id,name,author,num,price,detail);
            return add;
        }
    }

    @Override
    public int updateBook(int id,String name, String author, int num, double price,String detail) {
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet("select * from bs_books where book_id =?", id);
        if (rowSet.next()) {
            int update=jdbcTemplate.update("UPDATE bs_books SET book_name=?, book_author=?, book_num = ?, book_price = ? ,book_detail = ? where book_id=?",name,author,num,price,detail,id);
            return update;
        }else{
            return -1;
        }
    }

    @Override
    public int deleteBook(int id) {
        try {
            SqlRowSet rowSet = jdbcTemplate.queryForRowSet("select * from bs_books where book_id =?", id);
            if (rowSet.next()) {
                int update=jdbcTemplate.update("delete from bs_books where book_id=?",id);
                return update;
            }else{
                return -1;
            }
        }catch (EmptyResultDataAccessException e){
            return 0;
        }
    }

    @Override
    public int addImage(String pic,int id) {
        String sql="UPDATE bs_books SET book_pic = ? where book_id=?";
//        String sql="INSERT INTO bs_books(book_pic) VALUES (?)";
        int update=jdbcTemplate.update(sql,pic,id);
        if (update>0){
            return 1;
        }else {
            return 0;
        }
    }

    @Override
    public int updateCart(int num,int id) {
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet("select * from bs_cart where book_id =?", id);
        if (rowSet.next()) {
            int update=jdbcTemplate.update("UPDATE bs_cart SET num = ? where book_id=?",num,id);
            return update;
        }else{
            int update=jdbcTemplate.update("INSERT INTO bs_cart(book_id,num) VALUES (?,?)",id,num);
            return update;
        }
    }

    @Override
    public int addCart(int num, int id) {
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet("select num from bs_cart where book_id =?", id);
        if (rowSet.next()) {
            int old_num=rowSet.getInt("num");
            num=num+old_num;
            int update=jdbcTemplate.update("UPDATE bs_cart SET num = ? where book_id=?",num,id);
            return update;
        }else{
            int update=jdbcTemplate.update("INSERT INTO bs_cart(book_id,num) VALUES (?,?)",id,num);
            return update;
        }
    }

    @Override
    public List<Cart> getCart(int id) {
        try {
        List<Cart> cartList=new ArrayList<>();
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet("select * from bs_books where book_id=",id);
        SqlRowSet rowSet1=jdbcTemplate.queryForRowSet("select * from bs_cart where book_id=",id);
        while (rowSet.next()){
            Books books=new Books();
            Cart cart=new Cart();
            books.setBook_id(rowSet.getInt("book_id"));
            books.setBook_name(rowSet.getString("book_name"));
            books.setBook_author(rowSet.getString("book_author"));
            books.setBook_price(rowSet.getDouble("book_price"));
            books.setBook_detail(rowSet.getString("book_detail"));
            books.setBook_sail(rowSet1.getInt("num"));
            cartList.add(cart);
        }
        return cartList;
    }catch (EmptyResultDataAccessException e){
        return null;
    }
    }

    @Override
    public int deleteCart(int id) {
        int update=jdbcTemplate.update("delete from bs_cart where book_id=?",id);
        return update;
    }

    @Override
    public int updateSail(int num,int id) {
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet("select * from bs_books where book_id =?", id);
        if (rowSet.next()){
            int num1=num+rowSet.getInt("book_sail");
            if (num1<=rowSet.getInt("book_num")){
                int update=jdbcTemplate.update("UPDATE bs_books SET book_sail = ? where book_id=?",num1,id);
                return update;
            }else {
                return -1;
            }
        }else {
            return 0;
        }
    }
}
