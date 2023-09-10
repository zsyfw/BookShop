package com.cqcet.service;

import com.cqcet.dao.BookDao;
import com.cqcet.entity.Books;
import com.cqcet.entity.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookDao bookDao;

    @Override
    public List<Books> getBookName(Books books) {
        List<Books> bookName = bookDao.getBookByName(books.getBook_name());
        if (bookName!=null){
            return bookName;
        }else {
            return null;
        }
    }

    @Override
    public List<Books> getBookAuthor(Books books) {
        if (bookDao.getBookAuthor(books.getBook_author())!=null){
            return bookDao.getBookAuthor(books.getBook_author());
        }else {
            return null;
        }
    }

    @Override
    public int addBook(Books books) {
        int addbook=bookDao.addBook(books.getBook_id(),books.getBook_name(),books.getBook_author(),books.getBook_num(),books.getBook_price(),books.getBook_detail());
        if (addbook>0){
            return 1;
        }else if (addbook<0){
            return -1;
        }else {
            return 0;
        }
    }

    @Override
    public int updateBook(Books books) {
        int updateBook=bookDao.updateBook(books.getBook_id(),books.getBook_name(),books.getBook_author(),books.getBook_num(),books.getBook_price(),books.getBook_detail());
        if (updateBook>0){
            return 1;
        }else if (updateBook<0){
            return -1;
        }else {
            return 0;
        }
    }

    @Override
    public int deleteBook(Books books) {
        int bookid=bookDao.deleteBook(books.getBook_id());
        if (bookid>0){
            return 1;
        }else if (bookid<0){
            return -1;
        }else {
            return 0;
        }
    }

    @Override
    public int addImage(Books books) {
        int bookpic=bookDao.addImage(books.getBook_pic(),books.getBook_id());
        if (bookpic>0){
            return 1;
        }else {
            return 0;
        }
    }

    @Override
    public int addCart(Cart cart) {
        int addcart=bookDao.addCart(cart.getNum(),cart.getBook_id());
        if (addcart>0){
            return 1;
        }else if (addcart<0){
            return -1;
        }else {
            return 0;
        }
    }

    @Override
    public int updateCart(Cart cart) {
        int updateCart=bookDao.updateCart(cart.getNum(),cart.getBook_id());
        if (updateCart>0){
            return 1;
        }else if (updateCart<0){
            return -1;
        }else {
            return 0;
        }
    }

    @Override
    public int deleteCart(Cart cart) {
        int delcart=bookDao.deleteCart(cart.getBook_id());
        if (delcart>0){
            return 1;
        }else if (delcart<0){
            return -1;
        }else {
            return 0;
        }
    }

    @Override
    public int addsail(Cart cart) {
        int addsail=bookDao.updateSail(cart.getNum(),cart.getBook_id());
        if (addsail>0){
            return 1;
        }else if (addsail<0){
            return -1;
        }else {
            return 0;
        }
    }
}
