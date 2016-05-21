package com.imlewis.dailyshop.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

@Entity
public class ProductComment implements Serializable {

    private static final long serialVersionUID = 2586167050875661578L;

    @Id
    @GeneratedValue
    private int commentId;

    @Column(columnDefinition = "TEXT")
    private String commentCotents;

    private int commentStarts;

    @ManyToOne
    @JoinColumn(name = "productId")
    private Product product;

    private String commentCustomerName;

    private String commentCustomerEmail;

    private Date commentDate;

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getCommentCotents() {
        return commentCotents;
    }

    public void setCommentCotents(String commentCotents) {
        this.commentCotents = commentCotents;
    }

    public int getCommentStarts() {
        return commentStarts;
    }

    public void setCommentStarts(int commentStarts) {
        this.commentStarts = commentStarts;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public String getCommentCustomerName() {
        return commentCustomerName;
    }

    public void setCommentCustomerName(String commentCustomerName) {
        this.commentCustomerName = commentCustomerName;
    }

    public String getCommentCustomerEmail() {
        return commentCustomerEmail;
    }

    public void setCommentCustomerEmail(String commentCustomerEmail) {
        this.commentCustomerEmail = commentCustomerEmail;
    }
}
