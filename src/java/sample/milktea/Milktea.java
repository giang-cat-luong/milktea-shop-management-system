/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.milktea;

/**
 *
 * @author Truong Giang
 */
public class Milktea {

    private String productID;
    private String proName;
    private double price;
    private int quantity;
    private String images;
    private int categoryID;

    public Milktea() {
        this.productID = "";
        this.proName = "";
        this.price = 0;
        this.quantity = 0;
        this.images = "";
        this.categoryID = 0;
    }

    public Milktea(String productID, String proName, double price, int quantity, String images, int categoryID) {
        this.productID = productID;
        this.proName = proName;
        this.price = price;
        this.quantity = quantity;
        this.images = images;
        this.categoryID = categoryID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }
}
