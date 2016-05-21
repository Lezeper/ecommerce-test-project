package com.imlewis.dailyshop.dao;

import com.imlewis.dailyshop.model.Cart;
import com.imlewis.dailyshop.service.CustomerOrderService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;

@Repository
@Transactional
public class CartDaoImp implements CartDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private CustomerOrderService customerOrderService;

    public Cart getCartById(int cartId){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Cart WHERE cartId=?");
        query.setInteger(0, cartId);
        Cart cart = (Cart) query.uniqueResult();
        return (Cart) query.uniqueResult();
    }

    public void update(Cart cart){
        int cartId = cart.getCartId();
        double grandTotal = customerOrderService.getCustomerOrderGrandTotal(cartId);
        Double truncatedDouble = new BigDecimal(grandTotal)
                .setScale(3, BigDecimal.ROUND_HALF_UP)
                .doubleValue();
        cart.setGrandTotal(truncatedDouble);

        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(cart);
    }

    public Cart validate(int cartId) throws IOException{
        Cart cart = getCartById(cartId);
        if (cart == null || cart.getCartItems().size() == 0){
            throw new IOException(cartId+"");
        }
        update(cart);
        return cart;
    }

}
