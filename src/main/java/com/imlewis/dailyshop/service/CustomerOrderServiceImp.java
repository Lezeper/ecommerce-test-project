package com.imlewis.dailyshop.service;

import com.imlewis.dailyshop.dao.CustomerOrderDao;
import com.imlewis.dailyshop.dao.OrderItemDao;
import com.imlewis.dailyshop.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
import java.util.List;

@Service
public class CustomerOrderServiceImp implements CustomerOrderService {

    @Autowired
    private CustomerOrderDao customerOrderDao;
    @Autowired
    private CartService cartService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private OrderItemDao orderItemDao;

    public void addCustomerOrder(CustomerOrder customerOrder) {
        customerOrderDao.addCustomerOrder(customerOrder);
    }

    public double getCustomerOrderGrandTotal(int cartId) {
        double grandTotal = 0;
        Cart cart = cartService.getCartById(cartId);
        List<CartItem> cartItems = cart.getCartItems();

        for (CartItem item : cartItems) {
            grandTotal += item.getTotalPriceDouble();
        }

        return grandTotal;
    }

    public List<CustomerOrder> getAllCustomerOrderByCustomerId(int customerId) {
        return customerOrderDao.getAllCustomerOrderByCustomerId(customerId);
    }

    public void deleteCustomerOrderById(int orderId){
        customerOrderDao.deleteCustomerOrderById(orderId);
    }

    public void addOrderDumpCart(CustomerOrder customerOrder, Cart cart){
        Customer customer = customerService.getCustomerById(cart.getCustomer().getCustomerId());
        customerOrder.setOrderDate(new java.sql.Date(Calendar.getInstance().getTime().getTime()));
        customerOrder.setCustomer(customer);
        customerOrder.setOrderTotalPrice(cart.getGrandTotal());
        customerOrderDao.addCustomerOrder(customerOrder);

        for(CartItem cartItem : cart.getCartItems()){
            CustomerOrderItem customerOrderItem = new CustomerOrderItem();
            customerOrderItem.setCustomerOrder(customerOrder);
            customerOrderItem.setProductId(cartItem.getProduct().getProductId());
            customerOrderItem.setProductName(cartItem.getProduct().getProductName());
            customerOrderItem.setProductQuantity(cartItem.getQuantity());
            customerOrderItem.setTotalProductPrice(cartItem.getTotalPriceDouble());
            orderItemDao.addOrderItem(customerOrderItem);
        }
    }
}
