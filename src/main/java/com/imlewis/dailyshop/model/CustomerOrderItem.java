package com.imlewis.dailyshop.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class CustomerOrderItem implements Serializable{

    private static final long serialVersionUID = 8892553931694642183L;

    @Id
    @GeneratedValue
    private int customerOrderItemId;

    private int productId;
    private int productQuantity;
    private double totalProductPrice;
    private String productName;

    @ManyToOne
    @JoinColumn(name = "customerOrderId")
    private CustomerOrder customerOrder;

    public int getCustomerOrderItemId() {
        return customerOrderItemId;
    }

    public void setCustomerOrderItemId(int customerOrderItemId) {
        this.customerOrderItemId = customerOrderItemId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public double getTotalProductPrice() {
        return totalProductPrice;
    }

    public void setTotalProductPrice(double totalProductPrice) {
        this.totalProductPrice = totalProductPrice;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public CustomerOrder getCustomerOrder() {
        return customerOrder;
    }

    public void setCustomerOrder(CustomerOrder customerOrder) {
        this.customerOrder = customerOrder;
    }
}
