<%-- 
    Document   : addProduct
    Created on : Jul 8, 2022, 4:04:51 PM
    Author     : Truong Giang
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add product page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">      
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="AddProController" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Product ID</label>
                                <input name="productID" type="text" class="form-control" required>
                                ${requestScope.PRODUCT_ERROR.productID}
                            </div>
                            <div class="form-group">
                                <label>Product Name</label>
                                <input name="proName" type="text" class="form-control" required>
                                ${requestScope.PRODUCT_ERROR.proName}
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                                ${requestScope.PRODUCT_ERROR.price}
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input name="quantity" type="text" class="form-control" required>
                                ${requestScope.PRODUCT_ERROR.quantity}
                            </div>
                            <div class="form-group">
                                <label>Images</label>
                                <textarea name="images" class="form-control" required></textarea>
                                ${requestScope.PRODUCT_ERROR.images}
                            </div>
                            <div class="form-group">
                                <label>Category Id</label>
                                <textarea name="categoryID" class="form-control" required></textarea>
                                ${requestScope.PRODUCT_ERROR.categoryID}
                            </div> 
                        </div>
                        <div class="modal-footer">
                            <input type ="submit" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="AddPro">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        ${requestScope.PRODUCT_ERROR.error}
    </body>
</html>
