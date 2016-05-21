package com.imlewis.dailyshop.dao;

import com.imlewis.dailyshop.model.CustomerOrderItem;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class OrderItemDaoImp implements OrderItemDao {

    @Autowired
    SessionFactory sessionFactory;

    public void addOrderItem(CustomerOrderItem customerOrderItem){
        Session session = sessionFactory.getCurrentSession();
        session.save(customerOrderItem);
        session.flush();
    }

    public void deleteOrderItem(CustomerOrderItem customerOrderItem){
        Session session = sessionFactory.getCurrentSession();
        session.delete(customerOrderItem);
        session.flush();
    }

    public List<CustomerOrderItem> getAllOrderItemByOrderId(int orderId){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM CustomerOrderItem WHERE customerOrderId=?");
        query.setInteger(0, orderId);
        return query.list();
    }
}
