<%-- 
    Document   : itemOut
    Created on : Sep 16, 2018, 9:38:36 PM
    Author     : Billy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="itemOut">
    <jsp:include page="template/header.jsp" />
    <body ng-controller="itemOutCtrl">
        <div class="container">
            <jsp:include page="template/navbar.jsp" />
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">

                    </div>
                    <div class="panel-body">
                        <div class="col-md-4">
                            Transaction Date: <input ng-model="itemOutDate" name="itemOutDate" type="date" class="form-control"/>
                        </div>
                        <div class="col-md-8">
                            Reason: 
                            <div class="radio">
                                <label>
                                    <input type="radio" name="reason" ng-model="reason" value="EVENT">Event
                                </label> &nbsp; &nbsp; &nbsp;
                                <label>
                                    <input type="radio" name="reason" ng-model="reason" value="SOLD">Sold
                                </label> &nbsp; &nbsp; &nbsp;
                                <label>
                                    <input type="radio" name="reason" ng-model="reason" value="LOST">Lost
                                </label> &nbsp; &nbsp; &nbsp;
                                <label>
                                    <input type="radio" name="reason" ng-model="reason" value="BROKE">Broke
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-4" style="height: auto">
                        <div class="panel panel-primary" style="height: 100%">
                            <div class="panel-heading">
                                <i class="fa fa-product-hunt"></i> Select Item
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="Item Name">Item Name:</label>
                                    <select name="itemName" class="form-control" ng-model="clickedItem" ng-options="item.itemName for item in items">
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="itemId">Item ID: </label>
                                    <input readonly="1" name="itemId" type="text" class="form-control" id="itemId" value="{{clickedItem.itemId}}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4" style="height: auto;">
                        <div class="panel panel-primary" style="height: 100%">
                            <div class="panel-heading">
                                <i class="fa fa-user-circle"></i> Information
                            </div>
                            <div class="panel-body">
                                <div class="form-group" ng-show="reason == 'EVENT'">
                                    <label for="event">Event:</label>
                                    <input name="event" type="text" class="form-control" id="event">
                                </div>
                                <div class="form-group">
                                    <label for="note">Note:</label>
                                    <input name="note" type="text" class="form-control" id="note">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4" style="height: auto">
                        <div class="panel panel-primary" style="height: 100%">
                            <div class="panel-heading">
                                <i class="fa fa-sellsy"></i> Information Details
                            </div>
                            <div class="panel-body">
                                <div class="form-group" ng-show="clickedItem.itemId != null">
                                    <label for="qty">Quantity:</label>
                                    <input readonly="1" name="qty" ng-model="qty = 1" type="text" class="form-control" id="qty" placeholder="Enter Quantity">
                                    <div class="form-group">
                                        <label for="Area Name">Area Name:</label>
                                        <select name="areaName" class="form-control" ng-model="clickedArea" ng-options="area.areaName for area in areas">
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="areaId">Area ID: </label>
                                        <input readonly="1" name="areaId" type="text" class="form-control" id="areaId" value="{{clickedArea.areaId}}">
                                    </div>
                                    <div class="form-group">
                                        <label for="detailNote">Note:</label>
                                        <input name="detailNote" type="text" class="form-control" id="detailNote">
                                    </div>
                                    <button ng-click="addToCart()" type="submit" class="btn btn-success"><i class="fa fa-cart-plus"></i> Add To Cart</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-12" style="text-align: center; margin-top: 20px;">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3><i class="fa fa-cart-plus"></i> Cart <button class="btn btn-sm btn-success"> {{cartItem.length}} </button></h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-striped table-responsive">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Item Code</th>
                                    <th>Item Name</th>
                                    <th>Quantity</th>
                                    <th>Action</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="item in cartItem">
                                    <td>{{$index + 1}}</td>
                                    <td>{{item.itemCode}}</td>
                                    <td>{{item.itemName}}</td>
                                    <td>
                                        <button type="button" ng-click="decreaseQty(item)" class="btn btn-danger"><i class="fa fa-minus"></i></button>
                                        &nbsp; &nbsp; {{item.cartQty}} &nbsp; &nbsp;
                                        <button type="button" ng-click="increaseQty(item)" class="btn btn-success"><i class="fa fa-plus"></i></button>
                                    </td>
                                    <td><button ng-click="removeItem(item)" class="btn btn-danger"><i class="fa fa-remove"></i> Remove</button></td>
                                    <td>{{item.subTotal}}</td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr ng-show="cartItem.length != 0">
                                    <td colspan="5" style="text-align: right">Final Total:</td>
                                    <td>{{finalTotal}}</td>
                                </tr>
                                <tr ng-show="cartItem.length != 0">
                                    <td colspan="6" style="text-align: right">
                                        <button data-toggle="modal" data-target="#checkoutModal" type="button" ng-show="cartItem.length != 0" class="btn btn-success"><i class="fa fa-check"></i> Check Out</button>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
            
        </div>
    </body>
</html>
