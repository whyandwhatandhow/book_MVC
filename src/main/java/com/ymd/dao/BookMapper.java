package com.ymd.dao;

import com.ymd.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface BookMapper {
    //add
    int addBook(Books books);
    //delete
    int deleteBookById(@Param("book_id") int id);
    //update
    int updateBook(Books books);
    //select
    Books queryBookById(@Param("book_id") int id);
    //selectAll
    List<Books> queryAllBooks();
}
