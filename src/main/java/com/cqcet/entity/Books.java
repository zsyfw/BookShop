package com.cqcet.entity;

public class Books {
    private int book_id;
    private String book_name;
    private String book_author;
    private int book_num;
    private double book_price;
    private String book_pic;
    private String book_detail;
    private int book_sail;

    public Books() {
    }

    @Override
    public String toString() {
        return "Books{" +
                "book_id=" + book_id +
                ", book_name='" + book_name + '\'' +
                ", book_author='" + book_author + '\'' +
                ", book_num=" + book_num +
                ", book_price=" + book_price +
                ", book_pic='" + book_pic + '\'' +
                ", book_detail='" + book_detail + '\'' +
                ", book_sail=" + book_sail +
                '}';
    }

    public Books(int book_id, String book_name, String book_author, int book_num, double book_price, String book_pic, String book_detail, int book_sail) {
        this.book_id = book_id;
        this.book_name = book_name;
        this.book_author = book_author;
        this.book_num = book_num;
        this.book_price = book_price;
        this.book_pic = book_pic;
        this.book_detail = book_detail;
        this.book_sail = book_sail;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getBook_author() {
        return book_author;
    }

    public void setBook_author(String book_author) {
        this.book_author = book_author;
    }

    public int getBook_num() {
        return book_num;
    }

    public void setBook_num(int book_num) {
        this.book_num = book_num;
    }

    public double getBook_price() {
        return book_price;
    }

    public void setBook_price(double book_price) {
        this.book_price = book_price;
    }

    public String getBook_pic() {
        return book_pic;
    }

    public void setBook_pic(String book_pic) {
        this.book_pic = book_pic;
    }

    public String getBook_detail() {
        return book_detail;
    }

    public void setBook_detail(String book_detail) {
        this.book_detail = book_detail;
    }

    public int getBook_sail() {
        return book_sail;
    }

    public void setBook_sail(int book_sail) {
        this.book_sail = book_sail;
    }
}
