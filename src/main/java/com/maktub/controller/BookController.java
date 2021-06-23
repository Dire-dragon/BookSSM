package com.maktub.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.maktub.bean.Book;
import com.maktub.bean.Msg;
import com.maktub.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author Ddr
 * @create 2021-06-20 9:01
 */
@Controller
public class BookController {

    @Autowired
    BookService bookService;


    @RequestMapping(value = "book",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteBook(@RequestParam("id") Integer id){
        bookService.deleteBook(id);
        return Msg.success();
    }

    @RequestMapping(value = "book",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateBook(Book book){
        System.out.println(book);
        bookService.updateBook(book);
        return Msg.success();
    }


    @RequestMapping(value = "book",method = RequestMethod.GET)
    @ResponseBody
    public Msg searchBook(@RequestParam(value = "id")Integer id){
        Book book = bookService.SearchBook(id);

        return Msg.success().add("book",book);
    }

    /**
     * 添加书图
     * @param book
     * @return
     */
    @RequestMapping(value = "book",method = RequestMethod.POST)
    @ResponseBody
    public Msg addBook(Book book){
        bookService.addBook(book);
        return Msg.success();
    }

    /**
     * 查询所有书图
     * @param pn
     * @return
     */
    @RequestMapping("books")
    @ResponseBody//Ajax调用返回Json
    public Msg getWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){

        PageHelper.startPage(pn,5);//设置起始页码和分页大小

        List<Book> books = bookService.getAll();

        PageInfo pageInfo = new PageInfo(books, 5);//通过PageInfo获取分页数据
        return Msg.success().add("Books",pageInfo);
    }

    /**
     * 查询所有书图数
     * @return
     */
    public long count(){
        return bookService.count();
    }
}
