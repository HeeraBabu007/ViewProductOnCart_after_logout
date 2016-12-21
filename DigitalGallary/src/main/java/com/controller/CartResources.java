package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.model.Cart;
import com.model.CartItem;
import com.model.Customer;
import com.model.Product;
import com.service.CartItemService;
import com.service.CartService;
import com.service.CustomerService;
import com.service.ProductService;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/rest/cart")
public class CartResources 
{

    @Autowired
    private CartService cartService;

    @Autowired
    private CartItemService cartItemService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private ProductService productService;

    @RequestMapping("/{cartId}")
    public @ResponseBody Cart getCartById(@PathVariable(value = "cartId") int cartId)
    {
        return cartService.getCartById(cartId);
    }
    
    @RequestMapping("viewCart/{cartId}")
    public String getCartById1(@PathVariable int cartId, Model model)
    {
        Cart cart= cartService.getCartById(cartId);
        model.addAttribute("cart", cart);
        return "cart";
    }
    
//    @RequestMapping("/viewCart/{cartId}")
//    public String viewProduct(@PathVariable int cartId, Model model) throws IOException
//    {
//        CartItem cart = cartItemService.getCartItemByProductId(cartId);
//        model.addAttribute("cart", cart);
//        return "cart";
//    }


    @RequestMapping(value = "/add/{productId}", method = RequestMethod.GET)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void addItem (@PathVariable(value = "productId") int productId, @AuthenticationPrincipal User activeUser)
    {
        Customer customer = customerService.getCustomerByUsername(activeUser.getUsername());
        Cart cart = customer.getCart();
        Product product = productService.getProductById(productId);
        List<CartItem> cartItems = cart.getCartItems();

        for (int i=0; i < cartItems.size(); i++)
        {
            if(product.getProductId() == cartItems.get(i).getProduct().getProductId())
            {
                CartItem cartItem = cartItems.get(i);
                cartItem.setQuantity(cartItem.getQuantity() + 1);
                cartItem.setTotalPrice(product.getProductPrice()*cartItem.getQuantity());
                cartItemService.addCartItem(cartItem);
                return;
            }
        }
        CartItem cartItem = new CartItem();
        cartItem.setProduct(product);
        cartItem.setQuantity(1);
        cartItem.setTotalPrice(product.getProductPrice()*cartItem.getQuantity());
        cartItem.setCart(cart);
        cartItemService.addCartItem(cartItem);
    }

    @RequestMapping(value = "/remove/{productId}", method = RequestMethod.PUT)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void removeItem(@PathVariable(value = "productId") int productId)
    {
        CartItem cartItem = cartItemService.getCartItemByProductId(productId);
        cartItemService.removeCartItem(cartItem);
    }

    @RequestMapping(value = "/{cartId}", method = RequestMethod.DELETE)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void clearCart(@PathVariable(value = "cartId") int cartId)
    {
        Cart cart = cartService.getCartById(cartId);
        cartItemService.removeAllCartItems(cart);
    }

    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseStatus(value = HttpStatus.BAD_REQUEST, reason = "Illegal request, please verify your payload")
    public void handleClientErrors (Exception ex)
    {

    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR, reason = "Internal Server Error")
    public void handleServerErrors (Exception ex)
    {

    }


} // The End of Class;