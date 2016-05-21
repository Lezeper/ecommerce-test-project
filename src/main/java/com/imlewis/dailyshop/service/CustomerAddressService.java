package com.imlewis.dailyshop.service;

import com.imlewis.dailyshop.model.CustomerAddress;

import java.util.List;

/**
 * Created by lewis on 5/6/2016.
 */
public interface CustomerAddressService {
    List<CustomerAddress> getAllShippingAddressByCustomerId(int customerId);

    List<CustomerAddress> getAllBillingAddressByCustomerId(int customerId);

    CustomerAddress getAddressById(int id);

    CustomerAddress getDefaultBillingAddressByCustomerId(int customerId);

    CustomerAddress getDefaultShippingAddressByCustomerId(int customerId);

    void addShippingAddress(CustomerAddress customerAddress);

    void addBillingAddress(CustomerAddress customerAddress);

    void editShippingAddress(CustomerAddress customerAddress);

    void editBillingAddress(CustomerAddress customerAddress);
}
