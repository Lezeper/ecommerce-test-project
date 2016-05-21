package com.imlewis.dailyshop.dao;

import com.imlewis.dailyshop.model.CartItem;
import com.imlewis.dailyshop.model.Category;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CategoryDaoImp implements CategoryDao{

    @Autowired
    private SessionFactory sessionFactory;

    public List<String> getSubCategoryByMainCategoryName(String mainCategory){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT subCategoryName from Category where mainCategoryName = ?");
        query.setString(0, mainCategory);

        return query.list();
    }

    public void addCategory(Category category){
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(category);
        session.flush();
    }

    public void deleteCategory(Category category){
        Session session = sessionFactory.getCurrentSession();
        session.delete(category);
        session.flush();
    }

    public void editCategory(Category category){
        Session session = sessionFactory.getCurrentSession();
        session.update(category);
        session.flush();
    }

    public List<String> getAllMainCategory(){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT distinct mainCategoryName from Category");
        List<String> mainCategoryList = query.list();

        return mainCategoryList;
    }

    public List<String> getAllSubCategory(){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT distinct subCategoryName from Category");
        List<String> subCategoryList = query.list();

        return subCategoryList;
    }

    public List<Category> getAllCategory(){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Category");
        List<Category> categoryList = query.list();
        session.flush();

        return categoryList;
    }

    public Category getCategoryById(int id){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Category where categoryId = ?");
        query.setInteger(0, id);
        session.flush();

        return (Category) query.uniqueResult();
    }
}
