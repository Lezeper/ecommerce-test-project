package com.imlewis.dailyshop.dao;

import com.imlewis.dailyshop.model.Product;

import java.util.List;


public interface ProductDao {

    List<Product> getProductList();

    List<Product> getEachCategoryProductListNumbers(int numbers, String category);

    List<Product> getEachSubCategoryProductListNumbers(int numbers, String subCategory);

    List<Product> getProductListSort(String sortBy, String order, int numbers);

    Product getProductById(int id);

    void addProduct(Product product);

    void editProduct(Product product);

    void deleteProduct(Product product);

    void getVisited(int productId);
}
