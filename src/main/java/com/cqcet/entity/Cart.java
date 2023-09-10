package com.cqcet.entity;

public class Cart {
    private int book_id;
    private int num;

    public Cart() {
    }

    public Cart(int book_id, int num) {
        this.book_id = book_id;
        this.num = num;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "book_id=" + book_id +
                ", num=" + num +
                '}';
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
}
