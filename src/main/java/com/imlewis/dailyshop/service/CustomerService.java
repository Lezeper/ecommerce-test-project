package com.imlewis.dailyshop.service;

import com.imlewis.dailyshop.model.Customer;
import com.imlewis.dailyshop.model.CustomerOrder;

import java.util.List;

public interface CustomerService {

    void addCustomer(Customer customer);

    Customer getCustomerById(int customerId);

    List<Customer> getAllCustomers();

    Customer getCustomerByUsername(String username);

}
