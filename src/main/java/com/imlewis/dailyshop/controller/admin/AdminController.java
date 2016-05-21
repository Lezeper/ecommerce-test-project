package com.imlewis.dailyshop.controller.admin;

import com.imlewis.dailyshop.dao.CategoryDao;
import com.imlewis.dailyshop.model.Category;
import com.imlewis.dailyshop.model.Customer;
import com.imlewis.dailyshop.model.Product;
import com.imlewis.dailyshop.service.CustomerService;
import com.imlewis.dailyshop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private CategoryDao categoryDao;

    @RequestMapping("/")
    public String admin(){
        return "admin/admin";
    }

    @RequestMapping("/productInventory")
    public  String productInventory(Model model){
        List<Product> products = productService.getProductList();
        model.addAttribute("products", products);

        return "admin/productInventory";
    }

    @RequestMapping("/customer")
    public String customerManagement(Model model){
        List<Customer> customerList = customerService.getAllCustomers();
        model.addAttribute("customerList", customerList);

        return "admin/customerManagement";
    }

    @RequestMapping("/category")
    public String categoryManagement(Model model){
        List<Category> categoryList = categoryDao.getAllCategory();
        model.addAttribute("categoryList", categoryList);

        return "admin/categoryManagement";
    }
}
