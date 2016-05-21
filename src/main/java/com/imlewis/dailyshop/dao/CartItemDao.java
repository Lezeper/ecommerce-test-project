package com.imlewis.dailyshop.dao;

import com.imlewis.dailyshop.model.Cart;
import com.imlewis.dailyshop.model.CartItem;

public interface CartItemDao {
    void addCartItem(CartItem cartItem);

    void editCartItemQuantity(CartItem cartItem, int quantity);

    void removeCartItem(CartItem cartItem);

    void removeAllCartItems(Cart cart);

    CartItem getCartItemByProductId(int productId);
}
