package com.imlewis.dailyshop.dao;

import com.imlewis.dailyshop.model.CustomerAddress;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CustomerAddressDaoImp implements CustomerAddressDao {

    @Autowired
    SessionFactory sessionFactory;

    public List<CustomerAddress> getAllShippingAddressByCustomerId(int customerId){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM CustomerAddress WHERE customerId=? AND addressType=0");
        query.setInteger(0, customerId);
        return query.list();
    }

    public List<CustomerAddress> getAllBillingAddressByCustomerId(int customerId){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM CustomerAddress WHERE customerId=? AND addressType=1");
        query.setInteger(0, customerId);
        return query.list();
    }

    public CustomerAddress getAddressById(int id){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM CustomerAddress WHERE addressId=?");
        query.setInteger(0, id);
        return (CustomerAddress) query.uniqueResult();
    }

    public void addShippingAddress(CustomerAddress customerAddress){
        Session session = sessionFactory.getCurrentSession();
        session.save(customerAddress);
        session.flush();
    }

    public void addBillingAddress(CustomerAddress customerAddress){
        Session session = sessionFactory.getCurrentSession();
        session.save(customerAddress);
        session.flush();
    }

    public void editShippingAddress(CustomerAddress customerAddress){
        Session session = sessionFactory.getCurrentSession();
        session.update(customerAddress);
        session.flush();
    }

    public void editBillingAddress(CustomerAddress customerAddress){
        Session session = sessionFactory.getCurrentSession();
        session.update(customerAddress);
        session.flush();
    }

    public CustomerAddress getDefaultBillingAddressByCustomerId(int customerId){
        Session session =sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM CustomerAddress WHERE customerId=? AND isDefault=0 AND addressType=1");
        query.setInteger(0, customerId);
        return (CustomerAddress) query.uniqueResult();
    }

    public CustomerAddress getDefaultShippingAddressByCustomerId(int customerId){
        Session session =sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM CustomerAddress WHERE customerId=? AND isDefault=0 AND addressType=0");
        query.setInteger(0, customerId);
        return (CustomerAddress) query.uniqueResult();
    }
}
