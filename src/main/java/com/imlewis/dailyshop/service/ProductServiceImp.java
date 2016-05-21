package com.imlewis.dailyshop.service;

import com.imlewis.dailyshop.dao.ProductDao;
import com.imlewis.dailyshop.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImp implements ProductService {

    @Autowired
    private ProductDao productDao;

    public Product getProductById(int productId) {
        return productDao.getProductById(productId);
    }

    public List<Product> getProductListSort(String sortBy, String order, int numbers) {
        return productDao.getProductListSort(sortBy, order, numbers);
    }

    public List<Product> getEachCategoryProductListNumbers(int numbers, String category) {
        return productDao.getEachCategoryProductListNumbers(numbers, category);
    }

    public List<Product> getEachSubCategoryProductListNumbers(int numbers, String subCategory) {
        return productDao.getEachSubCategoryProductListNumbers(numbers, subCategory);
    }

    public List<Product> getProductList() {
        return productDao.getProductList();
    }

    public void addProduct(Product product) {
        productDao.addProduct(product);
    }

    public void editProduct(Product product) {
        productDao.editProduct(product);
    }

    public void deleteProduct(Product product) {
        productDao.deleteProduct(product);
    }

    public void getVisited(int productId) {
        productDao.getVisited(productId);
    }

}
