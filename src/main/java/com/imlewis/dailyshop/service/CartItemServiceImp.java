package com.imlewis.dailyshop.service;

import com.imlewis.dailyshop.dao.CartItemDao;
import com.imlewis.dailyshop.model.Cart;
import com.imlewis.dailyshop.model.CartItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartItemServiceImp implements CartItemService {

    @Autowired
    private CartItemDao cartItemDao;

    public void addCartItem(CartItem cartItem){
        cartItemDao.addCartItem(cartItem);
    }

    public void editCartItemQuantity(CartItem cartItem, int quantity){ cartItemDao.editCartItemQuantity(cartItem, quantity);}

    public void removeCartItem(CartItem cartItem){
        cartItemDao.removeCartItem(cartItem);
    }

    public void removeAllCartItems(Cart cart){
        cartItemDao.removeAllCartItems(cart);
    }

    public CartItem getCartItemByProductId(int productId){
        return cartItemDao.getCartItemByProductId(productId);
    }
}
