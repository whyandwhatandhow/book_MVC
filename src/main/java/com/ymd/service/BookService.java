package com.ymd.service;

import com.ymd.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookService {
    int addBook(Books books);
    //delete
    int deleteBookById(int id);
    //update
    int updateBook(Books books);
    //select
    Books queryBookById(int id);
    //selectAll
    List<Books> queryAllBooks();
}
