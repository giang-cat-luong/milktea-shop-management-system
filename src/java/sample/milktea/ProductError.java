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
public class ProductError {

    private String productID;
    private String proName;
    private String price;
    private String quantity;
    private String images;
    private String categoryID;
    private String error;

    public ProductError() {
        this.productID = "";
        this.proName = "";
        this.price = "";
        this.quantity = "";
        this.images = "";
        this.categoryID = "";
        this.error = "";
    }

    public ProductError(String productID, String proName, String price, String quantity, String images, String categoryID, String error) {
        this.productID = productID;
        this.proName = proName;
        this.price = price;
        this.quantity = quantity;
        this.images = images;
        this.categoryID = categoryID;
        this.error = error;
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

}
