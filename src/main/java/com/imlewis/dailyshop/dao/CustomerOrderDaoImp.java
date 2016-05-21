package com.imlewis.dailyshop.dao;

import com.imlewis.dailyshop.model.CustomerOrder;
import com.imlewis.dailyshop.service.CustomerOrderService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CustomerOrderDaoImp implements CustomerOrderDao{

    @Autowired
    private SessionFactory sessionFactory;

    public void addCustomerOrder(CustomerOrder customerOrder){
        Session session = sessionFactory.getCurrentSession();
        session.save(customerOrder);
        session.flush();
    }

    public List<CustomerOrder> getAllCustomerOrderByCustomerId(int customerId){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM CustomerOrder WHERE customerId=?");
        query.setInteger(0, customerId);
        List<CustomerOrder> customerOrders = query.list();
        session.flush();
        return customerOrders;
    }

    public void deleteCustomerOrderById(int orderId){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("DELETE CustomerOrder WHERE customerOrderId=?");
        query.setInteger(0, orderId);
        query.executeUpdate();
        session.flush();
    }
}
