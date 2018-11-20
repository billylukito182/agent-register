<%-- 
    Document   : index
    Created on : Sep 13, 2017, 11:08:17 AM
    Author     : cyclingbd007
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
                        <h3 align="center"><i class="fa fa-user-plus"></i> Register Customer</h3>
                    </div>
                    <div class="panel-body">
                        <c:if test="${customer.cid != null}">
                            <form action="<%= request.getContextPath()%>/updateCustomer" method="post">
                            </c:if>
                            <c:if test="${customer.cid == null}">
                                <form action="<%= request.getContextPath()%>/addCustomer" method="post">
                                </c:if>
                                <div class="form-group">
                                    <label for="cid">Customer ID: </label>
                                    <input value="${customer.cid}" name="cid" type="text" class="form-control" id="cid" <c:if test="${customer.cid == null}">disabled="1"</c:if>" readonly="1">
                                    </div>

                                    <div class="form-group">
                                        <label for="cname">Name:</label>
                                        <input value="${customer.cname}" name="cname" type="text" class="form-control" id="cname">
                                </div>

                                <div class="form-group">
                                    <label for="phone">Phone:</label>
                                    <input value="${customer.phone}" name="phone" type="text" class="form-control" id="phone">
                                </div>

                                <c:if test="${customer.cid != null}">
                                    <button type="submit" class="btn btn-warning"><i class="fa fa-edit"></i> Update</button>
                                    <a href="<%= request.getContextPath()%>/customer" class="btn btn-primary pull-right"><i class="fa fa-user-plus"></i> New</a>
                                </c:if>

                                <c:if test="${customer.cid == null}">
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
                            <th colspan="5" style="text-align: center;"><h2><i class="fa fa-users"></i> Customer List</h2></th>
                        </tr>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th colspan="2">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="row" items="${customers}">
                            <tr>
                                <td>${row.cid}</td>
                                <td>${row.cname}</td>
                                <td>${row.phone}</td>
                                <td>
                                    <a href="<%= request.getContextPath()%>/editCustomer/${row.cid}" class="btn btn-warning"><i class="fa fa-edit"></i> Edit</a>
                                </td>
                                <td>
                                    <a onclick="return confirm('Are you want to delete this item?')" href="<%= request.getContextPath()%>/deleteCustomer/${row.cid}" class="btn btn-danger"><i class="fa fa-trash"></i> Delete</a>
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
