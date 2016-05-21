package com.imlewis.dailyshop.dao;

import com.imlewis.dailyshop.model.CustomerOrder;

import java.util.List;


public interface CustomerOrderDao {

    void addCustomerOrder(CustomerOrder customerOrder);

    List<CustomerOrder> getAllCustomerOrderByCustomerId(int customerId);

    void deleteCustomerOrderById(int orderId);
}
