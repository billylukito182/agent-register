<%-- 
    Document   : item
    Created on : Sep 13, 2017, 11:08:17 AM
    Author     : billy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="template/header.jsp" />
    <body>
        <div class="container">
            <jsp:include page="template/navbar.jsp" />
            <div class="student_form col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 align="center"><i class="fa fa-product-hunt"></i> Insert Item</h3>
                    </div>
                    <div class="panel-body">
                        <c:if test="${item.itemId != null}">
                            <form action="<%= request.getContextPath()%>/updateItem" method="post" enctype="multipart/form-data" >
                        </c:if>
                        <c:if test="${item.itemId == null}">
                            <form action="<%= request.getContextPath()%>/addItem" method="post" enctype="multipart/form-data" >
                        </c:if>
                                <div class="form-group">
                                    <label for="itemId">Item ID: </label>
                                    <input value="${item.itemId}" name="itemId" type="text" class="form-control" id="itemId" <c:if test="${item.itemId == null}">disabled="1"</c:if>" readonly="1">
                                </div>
                                
                                <div class="form-group">
                                    <label for="srcImage">Image:</label>
                                    <img 
                                        <c:choose>
                                            <c:when test='${not empty item.srcImage}'>
                                                src="${contextPath}/ayodya/img/${item.srcImage}" 
                                            </c:when>
                                            <c:otherwise>
                                                src="${contextPath}/resources/img/not-available.png" 
                                            </c:otherwise>
                                        </c:choose>
                                    alt="No Image" class="img-responsive">
                                    <input type="file" accept="image/*" name="srcImage" id="srcImage"/>
                                    <!--<input value="${item.srcImage}" name="srcImage" type="text" class="form-control" id="srcImage">-->
                                </div>

                                <div class="form-group">
                                    <label for="itemCode">Item Code:</label>
                                    <input value="${item.itemCode}" name="itemCode" type="text" class="form-control" id="itemCode">
                                </div>

                                <div class="form-group">
                                    <label for="itemName">Item Name:</label>
                                    <input value="${item.itemName}" name="itemName" type="text" class="form-control" id="itemName">
                                </div>

                                <div class="form-group">
                                    <label for="itemTypeId">Item Type:</label>
                                    <select class="form-control" name="itemTypeId" id="itemTypeId">
                                        <option value=""> - SELECT TYPE - </option>
                                        <c:forEach var="row" items="${itemTypes}">
                                            <option value="${row.itemTypeId}" 
                                                <c:if test = "${row.itemTypeId == item.itemTypeId}">
                                                    selected="true"
                                                </c:if>
                                            >${row.itemTypeName}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="colorId">Item Color:</label>
                                    <select class="form-control" name="colorId" id="colorId">
                                        <option value=""> - SELECT COLOR - </option>
                                        <c:forEach var="row" items="${colors}">
                                            <option value="${row.colorId}" 
                                                <c:if test = "${row.colorId == item.colorId}">
                                                    selected="true"
                                                </c:if>
                                            >${row.colorName}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="supplierId">Supplier:</label>
                                    <select class="form-control" name="supplierId" id="supplierId">
                                        <option value=""> - SELECT SUPPLIER - </option>
                                        <c:forEach var="row" items="${suppliers}">
                                            <option value="${row.supplierId}" 
                                                <c:if test = "${row.supplierId == item.supplierId}">
                                                    selected="true"
                                                </c:if>
                                            >${row.supplierName}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="buyingPrice">Buying Price:</label>
                                    <input value="${item.buyingPrice}" name="buyingPrice" type="text" class="form-control" id="buyingPrice">
                                </div>

                                <div class="form-group">
                                    <label for="uom1">UNIT OF MEASUREMENTS:</label>
                                    <select class="form-control" name="uom1" id="uom1">
                                        <option value=""> - SELECT UOM - </option>
                                        <c:forEach var="row" items="${uoms}">
                                            <option value="${row.uomId}" 
                                                <c:if test = "${row.uomId == item.uom1}">
                                                    selected="true"
                                                </c:if>
                                            >${row.uomName}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="size">Item Size:</label>
                                    <input value="${item.size}" name="size" type="text" class="form-control" id="size">
                                </div>

                                <c:if test="${item.itemId == null}">
                                    <div class="form-group">
                                        <label for="stock">Initial Stock:</label>
                                        <input name="stock" type="text" class="form-control" id="stock">
                                    </div>
                                </c:if>

                                <c:if test="${item.itemId != null}">
                                    <div class="form-group">
                                        <label for="stock">Current Stock:</label>
                                        <input value="${itemStock.stock}" name="stock" type="text" class="form-control" id="stock" readonly="true">
                                    </div>
                                </c:if>

                                <c:if test="${item.itemId != null}">
                                    <button type="submit" class="btn btn-warning"><i class="fa fa-edit"></i> Update</button>
                                    <a href="<%= request.getContextPath()%>/item" class="btn btn-primary pull-right"><i class="fa fa-user-plus"></i> New</a>
                                </c:if>

                                <c:if test="${item.itemId == null}">
                                    <button type="submit" class="btn btn-success"><i class="fa fa-send"></i> Submit</button>
                                </c:if>
                            </form>

                    </div>
                    <div class="panel-footer">

                    </div>
                </div>
            </div>

            <div class="header col-md-8">
                <table class="table table-bordered table-responsive table-striped">
                    <thead>
                        <tr>
                            <th colspan="6" style="text-align: center;"><h2><i class="fa fa-product-hunt"></i> Item List</h2></th>
                        </tr>
                        <tr>
                            <th>Image</th>
                            <th>Item Code</th>
                            <th>Item Name</th>
                            <th colspan="2">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="row" items="${items}">
                            <tr>
                                <td>
                                    <img 
                                        <c:choose>
                                            <c:when test='${not empty row.srcImage}'>
                                                src="${contextPath}/ayodya/img/${row.srcImage}" 
                                            </c:when>
                                            <c:otherwise>
                                                src="${contextPath}/resources/img/not-available.png" 
                                            </c:otherwise>
                                        </c:choose>
                                    alt="No Image" class="img-responsive">
                                </td>
                                <td>${row.itemCode}</td>
                                <td>${row.itemName}</td>
                                <td>
                                    <a href="<%= request.getContextPath()%>/editItem/${row.itemId}" class="btn btn-warning"><i class="fa fa-edit"></i> Edit</a>
                                </td>
                                <td>
                                    <a onclick="return confirm('Are you want to delete this item?')" href="<%= request.getContextPath()%>/deleteItem/${row.itemId}" class="btn btn-danger"><i class="fa fa-trash"></i> Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

<!--            <div class="col-md-12" style="text-align: center;">
                &copy; Zubayer Ahamed
                || <a href="https://www.youtube.com/channel/UC4vVj7lKO7H4FohB3lv9dzA" target="_blank">Youtube</a>  || <a href="http://www.facebook.com/zubayerahamed" target="_blank">Facebook</a>
            </div>-->

        </div>

<!--        <div class="floating_div" style="text-align: center;width: 120px; height: 190px; border: 1px solid #DDD; box-shadow: 0px 0px 5px #DDD; position: fixed; right: 0px; bottom: 0px;">
            <a href="http://www.facebook.com/zubayerahamed" target="_blank"><img src="<c:url value="/resources/img/zubayer.png"></c:url>" width="100%"/></a>
            <br/>

            Zubayer Ahamed <br/>
            <a href="https://www.facebook.com/coderslabbd/" target="_blank"><i class="fa fa-facebook"></i> Facebook</a> <br/>
            <a href="https://www.youtube.com/channel/UC4vVj7lKO7H4FohB3lv9dzA" target="_blank"><i class="fa fa-youtube"></i> Youtube</a>

        </div>-->


    </body>
</html>
