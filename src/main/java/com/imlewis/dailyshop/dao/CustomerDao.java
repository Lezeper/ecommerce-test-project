package com.imlewis.dailyshop.dao;

import com.imlewis.dailyshop.model.Customer;
import com.imlewis.dailyshop.model.CustomerAddress;
import com.imlewis.dailyshop.model.CustomerOrder;

import java.util.List;

public interface CustomerDao {

    void addCustomer(Customer customer);

    Customer getCustomerById(int customerId);

    List<Customer> getAllCustomers();

    Customer getCustomerByUsername(String username);
}
