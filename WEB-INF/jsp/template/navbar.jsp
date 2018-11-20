<%-- 
    Document   : navbar
    Created on : Sep 16, 2018, 7:00:40 PM
    Author     : Billy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<c:if test="${user_id == null}">
    <% response.sendRedirect("http://localhost:8080/agent-registration/home");%>
</c:if>
<div class="col-md-12 header">
    <h1 align="center"><a href="<%= request.getContextPath()%>/">Agent Registration</a></h1>
</div>

<div class="col-md-12 menu">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span> 
                </button>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li><a href="<%= request.getContextPath()%>/"><i class="fa fa-home"></i> Home</a></li>
                    <li><a href="<%= request.getContextPath()%>/agent"><i class="fa fa-home"></i> Agent</a></li>
                    <c:if test="${user_role == 'Admin'}">
                        <li><a href="<%= request.getContextPath()%>/user"><i class="fa fa-area-chart"></i> User</a></li> 
                    </c:if>
<!--                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-paypal"></i> Master Data <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%= request.getContextPath()%>/user"><i class="fa fa-area-chart"></i> User</a></li> 
                            <li><a href="<%= request.getContextPath()%>/item"><i class="fa fa-area-chart"></i> Item</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-paypal"></i> Transactions <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%= request.getContextPath()%>/itemIn"><i class="fa fa-paypal"></i> Item In</a></li>
                            <li><a href="<%= request.getContextPath()%>/itemOut"><i class="fa fa-area-chart"></i> Item Out</a></li>  
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-paypal"></i> Settings <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%= request.getContextPath()%>/color"><i class="fa fa-area-chart"></i> Color</a></li> 
                            <li><a href="<%= request.getContextPath()%>/itemType"><i class="fa fa-area-chart"></i> Item Type</a></li> 
                            <li><a href="<%= request.getContextPath()%>/supplier"><i class="fa fa-area-chart"></i> Supplier</a></li>
                            <li><a href="<%= request.getContextPath()%>/uom"><i class="fa fa-area-chart"></i> Uom</a></li> 
                            <li><a href="<%= request.getContextPath()%>/area"><i class="fa fa-area-chart"></i> Area</a></li>   
                        </ul>
                    </li>-->
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <c:if test="${user_id == null}">
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </c:if>
                    <c:if test="${user_id != null}">
                        <li><a href="">Hi, ${user_name}</a></li>
                        <li><a href="<%= request.getContextPath()%>/logout"><span class="glyphicon glyphicon-log-out"></span> LogOut</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>
</div>

<div class="col-md-12 message">
    <c:if test="${sm != null}">
        <div class="alert alert-success alert-dismissable fade in">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Success!</strong> ${sm}
        </div>

    </c:if>
    <c:if test="${em != null}">
        <div class="alert alert-danger alert-dismissable fade in">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Error!</strong> ${em}
        </div>
    </c:if>


</div>
