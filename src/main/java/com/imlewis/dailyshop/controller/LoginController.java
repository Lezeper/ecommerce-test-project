package com.imlewis.dailyshop.controller;

import com.imlewis.dailyshop.model.Customer;
import com.imlewis.dailyshop.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/login")
    public String login(@RequestParam(value = "error", required = false) String error,
                        @RequestParam(value = "logout", required = false) String logout,
                        @RequestParam(value = "success", required = false) String success, HttpServletRequest request,
                        Model model) {

        if (error != null) {
            model.addAttribute("error", "Invalid username and password");
        }

        if (logout != null) {
            model.addAttribute("msg", "You have been logout");
        }

        if (success != null){
            // Set to session
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            UserDetails userDetails = (UserDetails)auth.getPrincipal();
            if(userDetails.getUsername() != null){
                // Customer name
                Customer customer = customerService.getCustomerByUsername(userDetails.getUsername());
                request.getSession().setAttribute("customer_email", userDetails.getUsername());
                request.getSession().setAttribute("customer_name", customer.getCustomerName());
                request.getSession().setAttribute("customer_id", customer.getCustomerId());
                // Cart Id
                request.getSession().setAttribute("cart_id", customer.getCart().getCartId());
                return "redirect:/";
            }
        }
        return "login";
    }
}
