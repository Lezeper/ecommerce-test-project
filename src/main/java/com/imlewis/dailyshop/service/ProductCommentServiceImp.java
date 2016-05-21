package com.imlewis.dailyshop.service;

import com.imlewis.dailyshop.dao.ProductCommentDao;
import com.imlewis.dailyshop.model.ProductComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductCommentServiceImp implements ProductCommentService {

    @Autowired
    private ProductCommentDao productCommentDao;

    public List<ProductComment> getAllProductComment() {
        return productCommentDao.getAllProductComment();
    }

    public List<ProductComment> getProductCommentByProductId(int productId) {
        return productCommentDao.getProductCommentByProductId(productId);
    }

    public void addProductComment(ProductComment productComment) {
        productCommentDao.addProductComment(productComment);
    }

    public void deleteProductComment(ProductComment productComment) {
        productCommentDao.deleteProductComment(productComment);
    }

    public void editProductComment(ProductComment productComment) {
        productCommentDao.editProductComment(productComment);
    }
}
