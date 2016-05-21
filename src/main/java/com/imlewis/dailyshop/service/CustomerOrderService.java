package com.imlewis.dailyshop.service;

import com.imlewis.dailyshop.model.Cart;
import com.imlewis.dailyshop.model.CustomerOrder;

import java.util.List;

public interface CustomerOrderService {

    void addOrderDumpCart(CustomerOrder customerOrder, Cart cart);

    double getCustomerOrderGrandTotal(int cartId);

    List<CustomerOrder> getAllCustomerOrderByCustomerId(int customerId);

    void deleteCustomerOrderById(int orderId);
}
