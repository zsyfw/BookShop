package com.cqcet.dao;

import com.cqcet.entity.Books;
import com.cqcet.entity.Cart;

import java.util.List;

public interface BookDao {
    public List<Books> getBookByName(String name);
    public List<Books> getBookAuthor(String name);
    public int addBook(int id,String name,String author,int num,double price,String detail);
    public int updateBook(int id,String name,String author,int num,double price,String detail);
    public int deleteBook(int id);
    public int addImage(String pic,int id);
    public int addCart(int num,int id);
    public int updateCart(int num,int id);
    public List<Cart> getCart(int id);
    public int updateSail(int num,int id);
    public int deleteCart(int id);
}
