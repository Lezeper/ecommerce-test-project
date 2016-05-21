package com.imlewis.dailyshop.dao;

import com.imlewis.dailyshop.model.ProductComment;

import java.util.List;

public interface ProductCommentDao {

    List<ProductComment> getAllProductComment();

    List<ProductComment> getProductCommentByProductId(int productId);

    void addProductComment(ProductComment productComment);

    void deleteProductComment(ProductComment productComment);

    void editProductComment(ProductComment productComment);

}
