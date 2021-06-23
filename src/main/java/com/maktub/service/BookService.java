package com.maktub.service;

import com.maktub.bean.Book;
import com.maktub.dao.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Ddr
 * @create 2021-06-20 9:00
 */
@Service
public class BookService {

    @Autowired
    BookMapper bookMapper;

    public List<Book> getAll() {
        return bookMapper.selectByExample(null);
    }

    public long count() {
        return bookMapper.countByExample(null);
    }

    public void addBook(Book book) {
        bookMapper.insert(book);
    }

    public Book SearchBook(Integer id) {
        Book book = bookMapper.selectByPrimaryKey(id);
        return book;
    }
}