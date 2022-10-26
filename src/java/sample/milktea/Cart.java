/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.milktea;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Truong Giang
 */
public class Cart {

    private Map<String, Milktea> cart;

    public Cart() {
    }

    public Cart(Map<String, Milktea> cart) {
        this.cart = cart;
    }

    public Map<String, Milktea> getCart() {
        return cart;
    }

    public void setCart(Map<String, Milktea> cart) {
        this.cart = cart;
    }

    public boolean add(Milktea tea) {
        boolean check = false;
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(tea.getProductID())) {
            int currentQuantity = this.cart.get(tea.getProductID()).getQuantity();
            tea.setQuantity(currentQuantity + tea.getQuantity());

        }
        this.cart.put(tea.getProductID(), tea);
        check = true;
        return check;
    }

    public boolean remove(String id) {
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.remove(id);
                check = true;
            }
        }
        return check;
    }

    public boolean update(String id, Milktea tea) {
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.replace(id, tea);
                check = true;
            }
        }
        return check;
    }
}
