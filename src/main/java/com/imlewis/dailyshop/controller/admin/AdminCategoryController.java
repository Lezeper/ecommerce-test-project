package com.imlewis.dailyshop.controller.admin;

import com.imlewis.dailyshop.dao.CategoryDao;
import com.imlewis.dailyshop.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin/category")
public class AdminCategoryController {

    @Autowired
    private CategoryDao categoryDao;

    @RequestMapping("/addCategory")
    public String addCategory(Model model) {
        Category category = new Category();

        model.addAttribute("category", category);

        return "admin/addCategory";
    }

    @RequestMapping(value = "/addCategory", method = RequestMethod.POST)
    public String addCategoryPost(@Valid @ModelAttribute("category") Category category, BindingResult result){
        if (result.hasErrors()) {
            return "admin/addCategory";
        }
        categoryDao.addCategory(category);
        return "redirect:/admin/category";
    }

    @RequestMapping("/editCategory/{id}")
    public String editProduct(@PathVariable("id") int id, Model model) {
        Category category = categoryDao.getCategoryById(id);

        model.addAttribute("category", category);

        return "admin/editCategory";
    }

    @RequestMapping(value = "/editCategory/{id}", method = RequestMethod.POST)
    public String editCategoryPost(@Valid @ModelAttribute("category") Category category) {

        categoryDao.editCategory(category);

        return "redirect:/admin/category";
    }

    @RequestMapping("/deleteCategory/{id}")
    public String deleteProductById(@PathVariable("id") int id) {
        Category category = categoryDao.getCategoryById(id);

        categoryDao.deleteCategory(category);

        return "redirect:/admin/category";
    }
}
