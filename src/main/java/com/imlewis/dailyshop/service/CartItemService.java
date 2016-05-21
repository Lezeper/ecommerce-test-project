package com.imlewis.dailyshop.service;

import com.imlewis.dailyshop.model.Cart;
import com.imlewis.dailyshop.model.CartItem;
import com.imlewis.dailyshop.model.Product;

public interface CartItemService {

    void addCartItem(CartItem cartItem);

    void editCartItemQuantity(CartItem cartItem, int quantity);

    void removeCartItem(CartItem cartItem);

    void removeAllCartItems(Cart cart);

    CartItem getCartItemByProductId(int productId);
}
