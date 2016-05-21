package com.imlewis.dailyshop.controller;

import com.imlewis.dailyshop.dao.CategoryDao;
import com.imlewis.dailyshop.model.Product;
import com.imlewis.dailyshop.model.ProductComment;
import com.imlewis.dailyshop.service.ProductCommentService;
import com.imlewis.dailyshop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryDao categoryDao;
    @Autowired
    private ProductCommentService productCommentService;

    @RequestMapping
    public String getProducts(Model model){
        return "products";
    }

    @RequestMapping("/{keyword}")
    public String getProductsByKeyword(@RequestParam(value = "sort", required = false) String sort,
                                       @RequestParam(value = "sc", required = false) String subCategory,
                                       @RequestParam(value = "t", required = false) String tag,
                                       @RequestParam(value = "lp", required = false) String lowerPrice,
                                       @RequestParam(value = "hp", required = false) String higherPrice,
                                       @PathVariable String keyword, Model model) throws IOException{
        // check param available
        boolean priceFilter = false;
        boolean tagFilter = false;
        boolean needSort = false;
        boolean categoryFilter = false;
        boolean nameFilter = true;

        int lowerPrice_i = 0;
        int higherPrice_i = 0;

        if (keyword.equals("all")){
            nameFilter = false;
        }
        if (subCategory != null) {categoryFilter = true;}
        if(sort != null) {needSort = true;}
        if (lowerPrice != null) {
            lowerPrice_i = Integer.parseInt(lowerPrice);
            higherPrice_i = Integer.parseInt(higherPrice);
            priceFilter= true;
        }
        if (tag != null){tagFilter = true;}

        List<String> categoryList;
        if(categoryDao.getSubCategoryByMainCategoryName(keyword) != null){
            if (!keyword.equals("all")){
                categoryList = categoryDao.getSubCategoryByMainCategoryName(keyword);
            }else{
                categoryList = categoryDao.getAllSubCategory();
            }
            model.addAttribute("categoryList", categoryList);
            model.addAttribute("keyword",keyword);
        }
        List<Product> products;
        if(needSort){
            if(sort.equals("default")){
                products = productService.getProductList();
            }else{
                String[] split = sort.split("-");
                String sortBy = split[0];
                String order = split[1];
                products = productService.getProductListSort(sortBy, order, 0);
            }
        }else{
            products = productService.getProductList();
        }

        // initial product list
        ArrayList<Product> filterProducts = new ArrayList<Product>();
        for(Product product : products){
            filterProducts.add(product);
        }
        // Filter by product name and category
        Iterator<Product> iter = filterProducts.iterator();
        if (nameFilter){
            while(iter.hasNext()){
                Product product = iter.next();
                if(!product.getProductCategory().equalsIgnoreCase(keyword)){
                    iter.remove();
                }
            }
        }
        // Filter by product tags
        iter = filterProducts.iterator();
        if(tagFilter){
            while(iter.hasNext()){
                Product product = iter.next();
                if(!product.getProductTag().equalsIgnoreCase(tag)){
                    iter.remove();
                }
            }
        }
        // Filter by product subCategory
        iter = filterProducts.listIterator();
        if(categoryFilter){
            while(iter.hasNext()){
                Product product = iter.next();
                if(!product.getProductSubCategory().equalsIgnoreCase(subCategory)){
                    iter.remove();
                }
            }
        }
        // Filter by product price
        iter = filterProducts.listIterator();
        if(priceFilter){
            while(iter.hasNext()){
                Product product = iter.next();
                if(product.getProductPrice() <= lowerPrice_i || product.getProductPrice() >= higherPrice_i){
                    iter.remove();
                }
            }
        }

        HashSet<String> tagList = new HashSet<String>();
        for (Product product : filterProducts){
            if(product.getProductTag() != null && !product.getProductTag().isEmpty()){
                tagList.add(product.getProductTag());
            }
        }

        model.addAttribute("products", filterProducts);
        model.addAttribute("category", keyword);
        model.addAttribute("tagList", tagList);

        return "products";
    }

    @RequestMapping("/viewProduct/{productId}")
    public String viewProduct(@PathVariable int productId, Model model) throws IOException {
        Product product = productService.getProductById(productId);
        model.addAttribute("product", product);
        productService.getVisited(productId);
        List<ProductComment> productCommentList = productCommentService.getProductCommentByProductId(productId);
        model.addAttribute("productCommentList", productCommentList);
        ProductComment productComment = new ProductComment();
        model.addAttribute("productComment", productComment);

        List<Product> productRelated = productService.getEachSubCategoryProductListNumbers(8, product.getProductSubCategory());
        model.addAttribute("productRelated", productRelated);

        return "viewProduct";
    }

    @RequestMapping(value = "/viewProduct/{productId}", method = RequestMethod.POST)
    public String addProductComment(@PathVariable int productId,
                                    @Valid @ModelAttribute("productComment") ProductComment productComment){
        productComment.setCommentDate(new java.sql.Date(Calendar.getInstance().getTime().getTime()));

        Product product = productService.getProductById(productId);

        productComment.setProduct(product);
        productCommentService.addProductComment(productComment);
        return "redirect:/products/viewProduct/"+productId;
    }
}
