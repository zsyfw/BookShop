package com.cqcet.service;

import com.cqcet.entity.Books;
import com.cqcet.entity.Cart;

import java.util.List;

public interface BookService {
    public List<Books> getBookName(Books books);
    public List<Books> getBookAuthor(Books books);
    public int  addBook(Books books);
    public int  updateBook(Books books);
    public int deleteBook(Books books);
    public int addImage(Books books);
    public int addCart(Cart cart);
    public int updateCart(Cart cart);
    public int deleteCart(Cart cart);
    public int addsail(Cart cart);
}
