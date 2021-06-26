package com.maktub.dao;

import com.maktub.bean.Book;

import java.util.List;

public interface BookMapper {

    List<Book> selectAll();

    long selectCount();

    int deleteByPrimaryKey(Integer id);

    int insert(Book record);

    int insertSelective(Book record);

    List<Book> selectByBookSelective(Book book);

    Book selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);


}