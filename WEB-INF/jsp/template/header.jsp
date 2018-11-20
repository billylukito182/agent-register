<%-- 
    Document   : header
    Created on : Sep 16, 2018, 6:52:32 PM
    Author     : Billy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Item Page</title>
    <spring:url value="/resources/css/bootstrap.css" var="bootstrapCSS"/>
    <spring:url value="/resources/css/font-awesome.css" var="fontawesomeCSS"/>
    <spring:url value="/resources/js/jquery.min.js" var="jqueryJS"/>
    <spring:url value="/resources/js/bootstrap.js" var="bootstrapJS"/>
    <spring:url value="/resources/js/angular.min.js" var="angularJS"/>
    <spring:url value="/resources/js/my_app.js" var="myAppJS"/>
    <link rel="stylesheet" type="text/css" href="${bootstrapCSS}"/>
    <link rel="stylesheet" type="text/css" href="${fontawesomeCSS}"/>
    <script src="${jqueryJS}"></script>
    <script src="${bootstrapJS}"></script>
    <script src="${angularJS}"></script>
    <script src="${myAppJS}"></script>
    <style type="text/css">
        .header, .message{
            margin-bottom: 20px;
        }
        th, td{
            text-align: center;
        }
    </style>
</head>
