package com.cqcet.controller;

import com.alibaba.fastjson.JSON;
import com.cqcet.dao.BookDao;
import com.cqcet.entity.Books;
import com.cqcet.entity.Cart;
import com.cqcet.service.BookService;
import com.cqcet.service.BookServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.swing.*;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@Controller
@RestController
@RequestMapping(value = "books")
public class BookController {
    @Autowired
    private BookService bookService;
    @Autowired
    private BookDao bookDao;

    //字符串
    @RequestMapping(value = "getBookName",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String getBookName(@RequestParam("searchtype") String searchtype, @RequestParam("searchvalue") String searchvalue){
        Books books = new Books();
        if (searchtype.equals("searchName")){
            books.setBook_name(searchvalue);
            if (bookService.getBookName(books).size()>0){
                return JSON.toJSONString(bookService.getBookName(books));
            }else {
                return null;
            }
        }else {
            books.setBook_author(searchvalue);
            if (bookService.getBookAuthor(books).size()>0){
                return JSON.toJSONString(bookService.getBookAuthor(books));
            }else {
                return null;
            }
        }
    }

    @RequestMapping(value = "addBook",produces = {"application/json;charset=utf-8"},method = RequestMethod.POST)
    @ResponseBody
    public String addBook(@RequestParam("book_id")String bid ,@RequestParam("book_name") String book_name, @RequestParam("book_author") String book_author, @RequestParam("book_num")String bnum, @RequestParam("book_price")String bprice,@RequestParam("book_detail")String book_detail){
        Books books=new Books();
        int id=Integer.parseInt(bid);
        int book_num=Integer.parseInt(bnum);
        double book_price=Double.parseDouble(bprice);
        books.setBook_id(id);
        books.setBook_author(book_author);
        books.setBook_name(book_name);
        books.setBook_num(book_num);
        books.setBook_price(book_price);
        books.setBook_detail(book_detail);
        if (bookService.addBook(books)>0){
            return "添加成功!!";
        }else if (bookService.addBook(books)<0){
            return "添加失败!!!";
        }else {
            return "图书已存在!!";
        }
    }


    @RequestMapping(value = "updateBook",produces = {"application/json;charset=utf-8"},method = RequestMethod.POST)
    @ResponseBody
    public String updateBook(@RequestParam("book_id")String bid ,@RequestParam("book_name") String book_name, @RequestParam("book_author") String book_author, @RequestParam("book_num")String bnum, @RequestParam("book_price")String bprice,@RequestParam("book_detail")String book_detail){
        Books books=new Books();
        int id=Integer.parseInt(bid);
        int book_num=Integer.parseInt(bnum);
        double book_price=Double.parseDouble(bprice);
        books.setBook_id(id);
        books.setBook_author(book_author);
        books.setBook_name(book_name);
        books.setBook_num(book_num);
        books.setBook_price(book_price);
        books.setBook_detail(book_detail);
        if (bookService.updateBook(books)>0){
            return "修改成功!!";
        }else if (bookService.addBook(books)<0){
            return "修改失败!!!";
        }else {
            return "修改失败!!";
        }
    }


    @RequestMapping(value = "deleteBook",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String deleteBook(@RequestParam("book_id") int book_id){
        Books books=new Books();
        books.setBook_id(book_id);
        if (bookService.deleteBook(books)>0){
            return "删除成功!!";
        }else if (bookService.deleteBook(books)<0){
            return "删除失败!!!";
        }else {
            return "删除失败!!";
        }
    }

    @RequestMapping(value = "addImage",produces = {"application/json;charset=utf-8"},method = RequestMethod.POST)
    @ResponseBody
    public String addImage(@RequestParam("bid") int id, @RequestParam("book_pic")MultipartFile file,HttpServletRequest request) throws IOException {
         String book_pic="bookimg_"+id+".jpg";
         String path="D:/IntelliJ IDEA 2022.2.3/Project/BookShop/src/main/webapp/Image/";
        File file1=new File(path+book_pic);
        file.transferTo(file1);
        request.setAttribute("book_pic",path);
        Books books=new Books();
        books.setBook_pic(book_pic);
        books.setBook_id(id);
        if (bookService.addImage(books)>0){
            return "图片上传成功!!";
        }else {
            return "图片上传失败!!";
        }
    }

    @RequestMapping(value = "addCart",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String addCart(@RequestParam("book_id")String bid,@RequestParam("num")String bnum){
        Cart cart=new Cart();
        int id=Integer.parseInt(bid);
        int num=Integer.parseInt(bnum);
        if (num<=0){
            return "商品数量不可以小于等于0";
        }else{
            cart.setBook_id(id);
            cart.setNum(num);
            if (bookService.addCart(cart)>0){
                return "成功添加到购物车!!";
            }else {
                return "添加失败！";
            }
        }
    }

    @RequestMapping(value = "updateCart",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String updateCart(@RequestParam("book_id")String bid,@RequestParam("num")String bnum){
        Cart cart=new Cart();
        int id=Integer.parseInt(bid);
        int num=Integer.parseInt(bnum);
        if (num<=0){
            return "商品数量不可以小于等于0";
        }else{
            cart.setBook_id(id);
            cart.setNum(num);
            if (bookService.updateCart(cart)>0){
                return "成功添加到购物车!!";
            }else {
                return "添加失败！";
            }
        }
    }


    @RequestMapping(value = "deleteCart",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String deleteCart(@RequestParam("book_id")String bid){
        Cart cart=new Cart();
        int id=Integer.parseInt(bid);
        cart.setBook_id(id);
        if (bookService.deleteCart(cart)>0){
            return "删除成功!!";
        }else {
            return "删除失败";
        }
    }

    @RequestMapping(value = "addsail",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String addsail(@RequestParam("book_id")String bid,@RequestParam("num")String bnum){
        Cart cart=new Cart();
        int id=Integer.parseInt(bid);
        int num=Integer.parseInt(bnum);
        cart.setBook_id(id);
        cart.setNum(num);
        if (bookService.addsail(cart)>0){
            return "购买成功！";
        }else if (bookService.addsail(cart)<0){
            return "该书卖完了！";
        }else {
            return "购买失败";
        }
    }

}
