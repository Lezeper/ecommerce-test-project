package com.imlewis.dailyshop.service;

import com.imlewis.dailyshop.dao.CustomerAddressDao;
import com.imlewis.dailyshop.model.CustomerAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerAddressServiceImp implements CustomerAddressService {

    @Autowired
    private CustomerAddressDao customerAddressDao;

    public List<CustomerAddress> getAllShippingAddressByCustomerId(int customerId){
        return customerAddressDao.getAllShippingAddressByCustomerId(customerId);
    }

    public List<CustomerAddress> getAllBillingAddressByCustomerId(int customerId){
        return customerAddressDao.getAllBillingAddressByCustomerId(customerId);
    }

    public CustomerAddress getAddressById(int id){
        return customerAddressDao.getAddressById(id);
    }

    public void addShippingAddress(CustomerAddress customerAddress){
        customerAddressDao.addShippingAddress(customerAddress);
    }

    public void addBillingAddress(CustomerAddress customerAddress){
        customerAddressDao.addBillingAddress(customerAddress);
    }

    public void editShippingAddress(CustomerAddress customerAddress){
        customerAddressDao.editShippingAddress(customerAddress);
    }

    public void editBillingAddress(CustomerAddress customerAddress){
        customerAddressDao.editBillingAddress(customerAddress);
    }

    public CustomerAddress getDefaultBillingAddressByCustomerId(int customerId){
        return customerAddressDao.getDefaultBillingAddressByCustomerId(customerId);
    }

    public CustomerAddress getDefaultShippingAddressByCustomerId(int customerId){
        return customerAddressDao.getDefaultShippingAddressByCustomerId(customerId);
    }
}
