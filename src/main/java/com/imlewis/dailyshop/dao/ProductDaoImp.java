package com.imlewis.dailyshop.dao;

import com.imlewis.dailyshop.model.Product;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
@Transactional
public class ProductDaoImp implements ProductDao {

    @Autowired
    private SessionFactory sessionFactory;

    public Product getProductById(int id){
        Session session = sessionFactory.getCurrentSession();
        Product product = session.get(Product.class, id);
        session.flush();

        return product;
    }

    public List<Product> getProductList(){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Product");
        List<Product> productList = query.list();
        session.flush();

        return productList;
    }

    public List<Product> getProductListSort(String sortBy, String order, int numbers){

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Product ORDER BY "+sortBy+" " + order);
        if(numbers != 0){
            query.setMaxResults(numbers);
        }
        List<Product> productList = query.list();
        session.flush();

        return productList;
    }

    public void getVisited(int productId){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT productViews FROM Product WHERE productId=?");
        query.setInteger(0, productId);
        Long visitedRecord = (Long) query.uniqueResult();
        visitedRecord+=1;

        query = session.createQuery("UPDATE Product set productViews =:param1 WHERE productId=:param2");
        query.setParameter("param1", visitedRecord);
        query.setParameter("param2", productId);
        query.executeUpdate();
        session.flush();
    }

    public List<Product> getEachCategoryProductListNumbers(int numbers, String category){
        Session session = sessionFactory.getCurrentSession();
        Query query;
        List<Product> productList = new ArrayList<Product>();
        if (category.equals("all")){
            query = session.createQuery("SELECT DISTINCT productCategory FROM Product");
            List<String> categories = query.list();
            for (String categoryTemp: categories){
                query = session.createQuery("FROM Product WHERE productCategory=?");
                query.setString(0, categoryTemp);
                query.setMaxResults(numbers);
                List<Product> tempList = query.list();
                productList.addAll(tempList);
            }
        }else{
            query = session.createQuery("FROM Product WHERE productCategory=?");
            query.setString(0, category);
            query.setMaxResults(numbers);
            productList = query.list();
        }
        session.flush();

        return productList;
    }

    public List<Product> getEachSubCategoryProductListNumbers(int numbers, String subCategory){
        Session session = sessionFactory.getCurrentSession();
        Query query;
        List<Product> productList = new ArrayList<Product>();
        if (subCategory.equals("all")){
            query = session.createQuery("SELECT DISTINCT productSubCategory FROM Product");
            List<String> categories = query.list();
            for (String categoryTemp: categories){
                query = session.createQuery("FROM Product WHERE productSubCategory=?");
                query.setString(0, categoryTemp);
                query.setMaxResults(numbers);
                List<Product> tempList = query.list();
                productList.addAll(tempList);
            }
        }else{
            query = session.createQuery("FROM Product WHERE productSubCategory=?");
            query.setString(0, subCategory);
            query.setMaxResults(numbers);
            productList = query.list();
        }
        session.flush();

        return productList;
    }

    public void addProduct(Product product){
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(product);
        session.flush();
    }

    public void editProduct(Product product){
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(product);
        session.flush();
    }

    public void deleteProduct(Product product){
        Session session = sessionFactory.getCurrentSession();
        session.delete(product);
        session.flush();
    }
}
