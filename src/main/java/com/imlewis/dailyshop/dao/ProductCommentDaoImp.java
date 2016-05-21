package com.imlewis.dailyshop.dao;

import com.imlewis.dailyshop.model.ProductComment;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class ProductCommentDaoImp implements  ProductCommentDao{

    @Autowired
    private SessionFactory sessionFactory;

    public List<ProductComment> getAllProductComment(){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM ProductComment");
        session.flush();
        return query.list();
    }

    public List<ProductComment> getProductCommentByProductId(int productId){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM ProductComment WHERE productId=?");
        query.setInteger(0, productId);
        session.flush();
        return query.list();
    }

    public void addProductComment(ProductComment productComment){
        Session session = sessionFactory.getCurrentSession();
        session.save(productComment);
        session.flush();
    }

    public void deleteProductComment(ProductComment productComment){
        Session session = sessionFactory.getCurrentSession();
        session.delete(productComment);
        session.flush();
    }

    public void editProductComment(ProductComment productComment){
        Session session = sessionFactory.getCurrentSession();
        session.update(productComment);
        session.flush();
    }
}
