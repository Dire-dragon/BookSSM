package com.maktub.test;

import com.maktub.bean.Book;
import com.maktub.controller.BookController;
import com.maktub.dao.BookMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;

/**
 * @author Ddr
 * @create 2021-06-22 8:43
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class BookTest {

    @Autowired
    BookController bookController;

    @Autowired
    BookMapper bookMapper;


    @Test
    public void test(){
        Book book = new Book(null,"1","1",new BigDecimal(1),1,1, "1");
        System.out.println(bookController.addBook(book));
        // bookMapper.insert(book);
    }

    @Test
    public void test1(){
        System.out.println(bookController.SearchBook(1));
        // bookMapper.insert(book);
    }

}
