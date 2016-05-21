package com.imlewis.dailyshop.controller;

import com.imlewis.dailyshop.model.*;
import com.imlewis.dailyshop.service.CustomerAddressService;
import com.imlewis.dailyshop.service.CustomerOrderService;
import com.imlewis.dailyshop.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/customer/account")
public class AccountController {

    @Autowired
    CustomerService customerService;
    @Autowired
    CustomerOrderService customerOrderService;
    @Autowired
    CustomerAddressService customerAddressService;

    @RequestMapping
    public String account(HttpServletRequest request, Model model) {

        String customerName = (String) request.getSession().getAttribute("customer_email");
        Customer customer = customerService.getCustomerByUsername(customerName);
        int customerId = customer.getCustomerId();
        model.addAttribute("customer",customer);

        CustomerAddress customerBillingAddress = customerAddressService.getDefaultBillingAddressByCustomerId(customerId);
        CustomerAddress customerShippingAddress = customerAddressService.getDefaultShippingAddressByCustomerId(customerId);

        CustomerAddress customerAddress = new CustomerAddress();
        model.addAttribute("customerAddress", customerAddress);

        model.addAttribute("billingAddress",customerBillingAddress);
        model.addAttribute("shippingAddress",customerShippingAddress);

        // Get Customer Orders
        List<CustomerOrder> customerOrders = customerOrderService.getAllCustomerOrderByCustomerId(customerId);
        model.addAttribute("customerOrders", customerOrders);


        return "myAccount";
    }

    @RequestMapping(value = "/address", method = RequestMethod.GET)
    public String address(Model model, HttpServletRequest request){
        String customerName = (String) request.getSession().getAttribute("customer_name");
        int customerId = customerService.getCustomerByUsername(customerName).getCustomerId();

        List<CustomerAddress> customerBillingAddresses = customerAddressService.getAllBillingAddressByCustomerId(customerId);
        List<CustomerAddress> customerShippingAddresses = customerAddressService.getAllShippingAddressByCustomerId(customerId);
        model.addAttribute("customerBillingAddresses", customerBillingAddresses);
        model.addAttribute("customerShippingAddresses", customerShippingAddresses);

        return "addressManagement";
    }

    @RequestMapping(value = "/address", method = RequestMethod.POST)
    public String addAddress(@Valid @ModelAttribute("customerAddress") CustomerAddress customerAddress,
                             @RequestParam("customerId") int customerId, BindingResult result){
        if(result.hasErrors()){
            return "myAccount";
        }
        Customer customer = customerService.getCustomerById(customerId);
        customerAddress.setCustomer(customer);
        if (customerAddress.getAddressType() == 0){
            customerAddressService.addShippingAddress(customerAddress);
        }
        if (customerAddress.getAddressType() == 1){
            customerAddressService.addBillingAddress(customerAddress);
        }

        return "redirect:/customer/account";
    }

    @RequestMapping("/order")
    public String orderOperation(@RequestParam("d") int orderId, Model model){

        if(orderId !=  0){
            customerOrderService.deleteCustomerOrderById(orderId);
        }

        return "redirect:/customer/account";
    }
}
