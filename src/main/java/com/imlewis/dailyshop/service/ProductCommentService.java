package com.imlewis.dailyshop.service;

import com.imlewis.dailyshop.model.ProductComment;

import java.util.List;

/**
 * Created by lewis on 5/6/2016.
 */
public interface ProductCommentService {

    List<ProductComment> getAllProductComment();

    List<ProductComment> getProductCommentByProductId(int productId);

    void addProductComment(ProductComment productComment);

    void deleteProductComment(ProductComment productComment);

    void editProductComment(ProductComment productComment);
}
