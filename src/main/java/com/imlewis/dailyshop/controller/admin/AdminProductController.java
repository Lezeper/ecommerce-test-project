package com.imlewis.dailyshop.controller.admin;

import com.imlewis.dailyshop.dao.CategoryDao;
import com.imlewis.dailyshop.model.Category;
import com.imlewis.dailyshop.model.Product;
import com.imlewis.dailyshop.service.ProductService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {

    private Path path;

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryDao categoryDao;

    @RequestMapping("/addProduct")
    public String addProduct(Model model) {
        Product product = new Product();
        product.setProductCategory("jackets");
        product.setProductCondition("new");

        model.addAttribute("mainCategoryList", categoryDao.getAllMainCategory());
        model.addAttribute("subCategoryList", categoryDao.getAllSubCategory());
        model.addAttribute("product", product);

        return "admin/addProduct";
    }

    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
    public String addProductPost(@Valid @ModelAttribute("product") Product product, BindingResult result,
                                 HttpServletRequest request) throws IOException {
        if (result.hasErrors()) {
            return "admin/addProduct";
        }

        productService.addProduct(product);

        MultipartFile productImage = product.getProductImage();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");

        File theDir = new File(rootDirectory + "\\WEB-INF\\resources\\images\\" + String.valueOf(product.getProductId()));
        FileUtils.forceMkdir(theDir);

        path = Paths.get(rootDirectory + "\\WEB-INF\\resources\\images\\" + product.getProductId() + "\\" + "0.png");

        if (productImage != null && !productImage.isEmpty()) {
            try {
                productImage.transferTo(new File(path.toString()));
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("Product image saving failed", e);
            }
        }

        return "redirect:/admin/productInventory";
    }

    @RequestMapping("/editProduct/{id}")
    public String editProduct(@PathVariable("id") int id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("mainCategoryList", categoryDao.getAllMainCategory());
        model.addAttribute("subCategoryList", categoryDao.getAllSubCategory());
        model.addAttribute("product", product);

        return "admin/editProduct";
    }

    @RequestMapping(value = "/editProduct", method = RequestMethod.POST)
    public String editProductPost(@Valid @ModelAttribute("product") Product product, BindingResult result,
                                  HttpServletRequest request) {
        if (result.hasErrors()) {
            return "admin/editProduct";
        }

        MultipartFile productImage = product.getProductImage();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");

        path = Paths.get(rootDirectory + "\\WEB-INF\\resources\\images\\" + product.getProductId() + "\\" + "0.png");

        if (productImage != null && !productImage.isEmpty()) {
            try {
                productImage.transferTo(new File(path.toString()));
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("Product image saving failed", e);
            }
        }

        productService.editProduct(product);

        return "redirect:/admin/productInventory";
    }

    @RequestMapping("/deleteProduct/{id}")
    public String deleteProduct(@PathVariable int id, Model model, HttpServletRequest request){
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        File theDir = new File(rootDirectory + "\\WEB-INF\\resources\\images\\" + id);

        if(theDir.exists()){
            try {
                FileUtils.deleteDirectory(theDir);
            }catch (IOException e){
                e.printStackTrace();
            }
        }

        Product product = productService.getProductById(id);
        productService.deleteProduct(product);

        return "redirect:/admin/productInventory";
    }
}
