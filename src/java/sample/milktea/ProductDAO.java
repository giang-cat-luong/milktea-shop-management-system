/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.milktea;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.utils.DBUtils;

/**
 *
 * @author Truong Giang
 */
public class ProductDAO {

    private static final String GET_ALL = "SELECT productID, proName, price, quantity, images, categoryID FROM tblProduct";
    private static final String GET_CATEGORY = "SELECT categoryID, name FROM tblCategory";
    private static final String GET_PRODUCT_BYID = "SELECT productID, proName, price, quantity, images, categoryID FROM tblProduct WHERE productID=?";
    private static final String SEARCH = "SELECT productID, proName, price, quantity, images, categoryID FROM tblProduct WHERE proName like ?";
    private static final String DELETE = "DELETE tblProduct WHERE productID=?";
    private static final String UPDATE = "UPDATE tblProduct SET  proName=?, price=?, quantity=?, images=?, categoryID=? WHERE productID=?";
    private static final String CHECK_DUPLICATE = "SELECT productID  FROM tblProduct WHERE productID=?";
    private static final String ADD = "INSERT INTO tblProduct(productID, proName, price, quantity, images, categoryID) VALUES(?,?,?,?,?,?)";

    public List<Milktea> getALLProduct() throws SQLException {
        List<Milktea> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String proName = rs.getString("proName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String images = rs.getString("images");
                    int categoryID = rs.getInt("categoryID");
                    listProduct.add(new Milktea(productID, proName, price, quantity, images, categoryID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listProduct;
    }

    public List<Category> getALLCategory() throws SQLException {
        List<Category> listCategory = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_CATEGORY);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int cID = rs.getInt("categoryID");
                    String cName = rs.getString("name");
                    listCategory.add(new Category(cID, cName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listCategory;
    }

    public Milktea getProductByID(String proID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Milktea milktea = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_BYID);
                ptm.setString(1, proID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String proName = rs.getString("proName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String images = rs.getString("images");
                    int categoryID = rs.getInt("categoryID");
                    milktea = new Milktea(productID, proName, price, quantity, images, categoryID);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return milktea;
    }

    public List<Milktea> getProductBySearch(String txtSearch) throws SQLException {
        List<Milktea> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + txtSearch + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String proName = rs.getString("proName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String images = rs.getString("images");
                    int categoryID = rs.getInt("categoryID");
                    listProduct.add(new Milktea(productID, proName, price, quantity, images, categoryID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listProduct;
    }

    public boolean deleteProduct(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateProduct(Milktea milktea) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, milktea.getProName());
                ptm.setDouble(2, milktea.getPrice());
                ptm.setInt(3, milktea.getQuantity());
                ptm.setString(4, milktea.getImages());
                ptm.setInt(5, milktea.getCategoryID());
                ptm.setString(6, milktea.getProductID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicate(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean addProduct(Milktea milktea) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD);
                ptm.setString(1, milktea.getProductID());
                ptm.setString(2, milktea.getProName());
                ptm.setDouble(3, milktea.getPrice());
                ptm.setInt(4, milktea.getQuantity());
                ptm.setString(5, milktea.getImages());
                ptm.setInt(6, milktea.getCategoryID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

}
