<%-- 
    Document   : Item Type
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
                        <h3 align="center"><i class="fa fa-product-hunt"></i> Insert Item Type</h3>
                    </div>
                    <div class="panel-body">
                        <c:if test="${itemType.itemTypeId != null}">
                            <form action="<%= request.getContextPath()%>/updateItemType" method="post">
                        </c:if>
                        <c:if test="${itemType.itemTypeId == null}">
                            <form action="<%= request.getContextPath()%>/addItemType" method="post">
                        </c:if>
                                <div class="form-group">
                                    <label for="itemTypeId">Item Type ID: </label>
                                    <input value="${itemType.itemTypeId}" name="itemTypeId" type="text" class="form-control" id="itemTypeId" <c:if test="${itemType.itemTypeId == null}">disabled="1"</c:if>" readonly="1">
                                </div>

                                <div class="form-group">
                                    <label for="itemTypeCode">Item Type Code:</label>
                                    <input value="${itemType.itemTypeCode}" name="itemTypeCode" type="text" class="form-control" id="itemTypeCode">
                                </div>

                                <div class="form-group">
                                    <label for="itemTypeName">Item Type Name:</label>
                                    <input value="${itemType.itemTypeName}" name="itemTypeName" type="text" class="form-control" id="itemTypeName">
                                </div>

                                <c:if test="${itemType.itemTypeId != null}">
                                    <button type="submit" class="btn btn-warning"><i class="fa fa-edit"></i> Update</button>
                                    <a href="<%= request.getContextPath()%>/user" class="btn btn-primary pull-right"><i class="fa fa-user-plus"></i> New</a>
                                </c:if>

                                <c:if test="${itemType.itemTypeId == null}">
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
                            <th colspan="6" style="text-align: center;"><h2><i class="fa fa-product-hunt"></i> Item Type List</h2></th>
                        </tr>
                        <tr>
                            <th>Id</th>
                            <th>Item Type Code</th>
                            <th>Item Type Name</th>
                            <th colspan="2">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="row" items="${itemTypes}">
                            <tr>
                                <td>${row.itemTypeId}</td>
                                <td>${row.itemTypeCode}</td>
                                <td>${row.itemTypeName}</td>
                                <td>
                                    <a href="<%= request.getContextPath()%>/editItemType/${row.itemTypeId}" class="btn btn-warning"><i class="fa fa-edit"></i> Edit</a>
                                </td>
                                <td>
                                    <a onclick="return confirm('Are you want to delete this item?')" href="<%= request.getContextPath()%>/deleteItemType/${row.itemTypeId}" class="btn btn-danger"><i class="fa fa-trash"></i> Delete</a>
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
