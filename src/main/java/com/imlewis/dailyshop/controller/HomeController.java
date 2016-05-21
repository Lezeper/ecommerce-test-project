package com.imlewis.dailyshop.controller;

import com.imlewis.dailyshop.dao.CategoryDao;
import com.imlewis.dailyshop.model.Category;
import com.imlewis.dailyshop.model.Product;
import com.imlewis.dailyshop.model.Slider;
import com.imlewis.dailyshop.service.ProductService;
import com.imlewis.dailyshop.service.SliderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private SliderService sliderService;
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryDao categoryDao;

    @RequestMapping("/")
    public String home(Model model) {
        List<Slider> sliderList = sliderService.getAllSlider();
        List<Product> productList = productService.getEachCategoryProductListNumbers(8,"all");
        List<String> categoryList = categoryDao.getAllMainCategory();
        List<Product> productPopularList = productService.getProductListSort("productViews", "DESC", 8);
        List<Product> productLatest = productService.getProductListSort("productDate", "DESC", 8);

        model.addAttribute("productPopular", productPopularList);
        model.addAttribute("productLatest", productLatest);
        model.addAttribute("sliders", sliderList);
        model.addAttribute("products", productList);
        model.addAttribute("categories", categoryList);
        return "home";
    }

    @RequestMapping("/version")
    public String version() {
        return "version";
    }

    @RequestMapping("/404")
    public String notFound() {
        return "404";
    }

    @RequestMapping("/contact")
    public String contact() {
        return "contact";
    }
}
