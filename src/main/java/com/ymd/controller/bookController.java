package com.ymd.controller;

import com.ymd.pojo.Books;
import com.ymd.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.awt.print.Book;
import java.util.List;

@Controller
@RequestMapping("/book")
public class bookController {
    //调service
    @Autowired
    @Qualifier("bookServiceImpl")
    private BookService bookService;

    //查询全部数据并且返回到书籍展示页面
    @RequestMapping("/allBook")
    public  String list(Model model){
        List<Books> books=bookService.queryAllBooks();
        model.addAttribute("list",books);
        return "AllBooks";
    }

    //跳转到添加书籍页面
    @RequestMapping("/toAddBook")
    public String toAddBook(){
        return "addBook";
    }

    @RequestMapping("/addBook")
    public String addBook(Books books) {
        bookService.addBook(books);
        return "redirect:/book/allBook";
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(int id,Model model){
        Books books = bookService.queryBookById(id);
        //显示默认值
        model.addAttribute("QuBooks",books);
        return "updateBook";
    }


    @RequestMapping("/updateBook")
    public String updateBook(Books books){
        bookService.updateBook(books);
        return "redirect:/book/allBook";
    }

}


