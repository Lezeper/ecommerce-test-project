package com.imlewis.dailyshop.service;

import com.imlewis.dailyshop.model.Cart;

public interface CartService {

    Cart getCartById(int cartId);

    void update(Cart cart);
}
