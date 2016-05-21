package com.imlewis.dailyshop.controller;

import com.imlewis.dailyshop.model.Cart;
import com.imlewis.dailyshop.model.Customer;
import com.imlewis.dailyshop.model.CustomerOrder;
import com.imlewis.dailyshop.service.CartService;
import com.imlewis.dailyshop.service.CustomerOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private CartService cartService;
    @Autowired
    private CustomerOrderService customerOrderService;

    @RequestMapping("/{cartId}")
    public String createOrder(@PathVariable ("cartId") int cartId){

        return "redirect:/checkout?cartId="+cartId;
    }
}
