package com.ymd.controller;

import com.ymd.pojo.Books;
import com.ymd.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
