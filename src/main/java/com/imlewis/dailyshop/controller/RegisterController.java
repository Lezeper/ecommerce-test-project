package com.imlewis.dailyshop.controller;

import com.imlewis.dailyshop.model.Customer;
import com.imlewis.dailyshop.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

@Controller
public class RegisterController{

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/register")
    public String register(Model model){
        Customer user = new Customer();

        model.addAttribute("user", user);

        return "registerCustomer";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerCustomerPost(@Valid @ModelAttribute("user") Customer user, BindingResult result) {

        if(result.hasErrors()){
            return "registerCustomer";
        }

        user.setEnabled(true);
        user.setAuthority("ROLE_USER");
        customerService.addCustomer(user);

        return "registerCustomerSuccess";
    }
}
