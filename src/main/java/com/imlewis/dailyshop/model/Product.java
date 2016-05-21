package com.imlewis.dailyshop.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.type.TextType;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.constraints.Min;
import java.io.Serializable;
import java.sql.Date;
import java.util.List;


@Entity
public class Product implements Serializable{

    private static final long serialVersionUID = -6989243970039135205L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int productId; // MySQL only accept Long or integer ID, can't be String type

    @NotEmpty(message = "The message name must not be null")
    @Length(max = 255, message = "The field must be less than 255 characters")
    private String productName;
    @NotEmpty(message = "Category must not be null")
    private String productCategory;
    @NotEmpty(message = "SubCategory must not be null")
    private String productSubCategory;
    @Length(max = 255, message = "The field must be less than 255 characters")
    private String productTag;
    @Length(max = 255, message = "The field must be less than 255 characters")
    private String productSummary;
    @Column(columnDefinition = "TEXT")
    private String productDescription;
    private Date productDate;
    private long productViews;

    @Min(value = 0, message = "Product price must no be less then zero.")
    private double productPrice;
    @NotEmpty(message = "Condition must not be null")
    private String productCondition;

    @Min(value = 0, message = "Product unit must no be less then zero.")
    private int unitInStock;

    @Transient
    private MultipartFile productImage;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JsonIgnore
    private List<CartItem> cartItemList;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JsonIgnore
    private List<ProductComment> productCommentList;

    public List<CartItem> getCartItemList() {
        return cartItemList;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public String getProductSubCategory() {
        return productSubCategory;
    }

    public void setProductSubCategory(String productSubCategory) {
        this.productSubCategory = productSubCategory;
    }

    public String getProductTag() {
        return productTag;
    }

    public void setProductTag(String productTag) {
        this.productTag = productTag;
    }

    public String getProductSummary() {
        return productSummary;
    }

    public void setProductSummary(String productSummary) {
        this.productSummary = productSummary;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public Date getProductDate() {
        return productDate;
    }

    public void setProductDate(Date productDate) {
        this.productDate = productDate;
    }

    public long getProductViews() {
        return productViews;
    }

    public void setProductViews(long productViews) {
        this.productViews = productViews;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductCondition() {
        return productCondition;
    }

    public void setProductCondition(String productCondition) {
        this.productCondition = productCondition;
    }

    public int getUnitInStock() {
        return unitInStock;
    }

    public void setUnitInStock(int unitInStock) {
        this.unitInStock = unitInStock;
    }

    public MultipartFile getProductImage() {
        return productImage;
    }

    public void setProductImage(MultipartFile productImage) {
        this.productImage = productImage;
    }

    public void setCartItemList(List<CartItem> cartItemList) {
        this.cartItemList = cartItemList;
    }

    public List<ProductComment> getProductCommentList() {
        return productCommentList;
    }

    public void setProductCommentList(List<ProductComment> productCommentList) {
        this.productCommentList = productCommentList;
    }
}
