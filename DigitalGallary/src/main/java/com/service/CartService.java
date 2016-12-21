package com.service;

import com.model.Cart;

public interface CartService {

    Cart getCartById(int cartId);

    void update(Cart cart);
}
