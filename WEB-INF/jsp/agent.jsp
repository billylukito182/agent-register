<%-- 
    Document   : agent
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
            <div class="student_form col-md-3">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 align="center"><i class="fa fa-product-hunt"></i> Insert Agent</h3>
                    </div>
                    <div class="panel-body">
                        <c:if test="${agent.id != null}">
                            <form action="<%= request.getContextPath()%>/updateAgent" method="post" enctype="multipart/form-data" >
                            </c:if>
                            <c:if test="${agent.id == null}">
                                <form action="<%= request.getContextPath()%>/addAgent" method="post" enctype="multipart/form-data" >
                                </c:if>
                                <div class="form-group">
                                    <label for="id">Agent ID: </label>
                                    <input value="${agent.id}" name="id" type="text" class="form-control" id="id" <c:if test="${agent.id == null}">disabled="1"</c:if>" readonly="1">
                                </div>
                                <div class="form-group">
                                    <label for="id">Kode: </label>
                                    <input value="${agent.kode}" name="kode" type="text" class="form-control" id="kode" <c:if test="${agent.kode == null}">disabled="1"</c:if>" readonly="1">
                                </div>

                                <c:if test="${user_role == 'Admin'}">
                                    <div class="form-group">
                                        <label for="id_sales">Sales:</label>
                                        <select class="form-control" name="id_sales" id="id_sales">
                                            <c:forEach var="row" items="${users}">
                                                <option value="${row.id}" 
                                                    <c:if test = "${row.id == agent.id_sales}">
                                                        selected="true"
                                                    </c:if>
                                                >${row.nama}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </c:if>
                                <c:if test="${user_role != 'Admin'}">
                                    <div class="form-group">
                                        <label for="id_sales">Sales: </label>
                                        <input value="${user_name}" type="text" class="form-control" <c:if test="${user_id == null}">disabled="1"</c:if>" readonly="1">
                                        <input value="${user_id}" name="id_sales" type="hidden" class="form-control" id="id_sales">
                                    </div>
                                </c:if>
                                
                                <div class="form-group">
                                    <label for="nama">Nama:</label>
                                    <input value="${agent.nama}" name="nama" type="text" class="form-control" id="nama">
                                </div>
                                
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input value="${agent.email}" name="email" type="text" class="form-control" id="email">
                                </div>

                                <div class="form-group">
                                    <label for="kantor">Kantor:</label>
                                    <input value="${agent.kantor}" name="kantor" type="text" class="form-control" id="kantor">
                                </div>
                                
                                <div class="form-group">
                                    <label for="paket">Paket:</label>
                                    <select name="paket" type="text" class="form-control" id="paket">
                                        <option value="Ticket" 
                                                <c:if test = "${'Ticket' == agent.paket}">
                                                    selected="true"
                                                </c:if>
                                        >Ticket</option>
                                        <option value="Credit" 
                                                <c:if test = "${'Credit' == agent.paket}">
                                                    selected="true"
                                                </c:if>
                                        >Credit</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="upload_bt">Upload BT:</label>
                                    <input type="file" accept="image/*" name="upload_bt" id="upload_bt"/>
                                    <!--<input value="${agent.upload_bt}" name="upload_bt" type="text" class="form-control" id="upload_bt">-->
                                </div>

                                <div class="form-group">
                                    <label for="catatan">Catatan:</label>
                                    <input value="${agent.catatan}" name="catatan" type="text" class="form-control" id="catatan">
                                </div>
                                
<!--                                <div class="form-group">
                                    <label for="status">Status:</label>
                                    <select name="status" type="text" class="form-control" id="status">
                                        <option value="Unpaid" 
                                                <c:if test = "${'Unpaid' == agent.status}">
                                                    selected="true"
                                                </c:if>
                                        >Unpaid</option>
                                        <option value="Paid" 
                                                <c:if test = "${'Paid' == agent.status}">
                                                    selected="true"
                                                </c:if>
                                        >Paid</option>
                                    </select>
                                </div>-->

                                <c:if test="${agent.id != null}">
                                    <button type="submit" class="btn btn-warning"><i class="fa fa-edit"></i> Update</button>
                                    <a href="<%= request.getContextPath()%>/agent" class="btn btn-primary pull-right"><i class="fa fa-user-plus"></i> New</a>
                                </c:if>

                                <c:if test="${agent.id == null}">
                                    <button type="submit" class="btn btn-success"><i class="fa fa-send"></i> Submit</button>
                                </c:if>


                            </form>

                    </div>
                    <div class="panel-footer">

                    </div>
                </div>
            </div>

            <div class="header col-md-9">
                <table class="table table-bordered table-responsive table-striped">
                    <thead>
                        <tr>
                            <th colspan="10" style="text-align: center;"><h2><i class="fa fa-product-hunt"></i> Agent List</h2></th>
                        </tr>
                        <tr>
                            <th>Kode</th>
                            <th>Sales</th>
                            <th>Agent</th>
                            <th>Paket</th>
                            <th>Catatan</th>
                            <th>Lihat</th>
                            <c:if test="${user_role == 'Admin'}">
                                <th>Status</th>
                            </c:if>
                            <th colspan="3">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="row" items="${agents}">
                            <tr>
                                <td>${row.kode}</td>
                                <c:forEach var="sales" items="${users}">
                                    <c:if test="${row.id_sales == sales.id}">
                                        <td>${sales.nama}</td>
                                    </c:if>
                                </c:forEach>
                                <td>${row.nama}</td>
                                <td>${row.paket}</td>
                                <td>${row.catatan}</td>
                                <td>${contextPath}/uploaded_files/${row.upload_bt}</td>
                                <c:if test="${user_role == 'Admin'}">
                                    <td>${row.status}</td>
                                    <td>
                                        <c:if test="${row.status == 'Unpaid'}">
                                                <a href="<%= request.getContextPath()%>/confirmAgent/${row.id}" class="btn btn-warning"><i class="fa fa-check-circle"></i> Confirm</a>
                                        </c:if>
                                    </td>
                                </c:if>
                                <td>
                                    <a href="<%= request.getContextPath()%>/editAgent/${row.id}" class="btn btn-warning"><i class="fa fa-edit"></i> Edit</a>
                                </td>
                                <td>
                                    <a onclick="return confirm('Are you want to delete this item?')" href="<%= request.getContextPath()%>/deleteAgent/${row.id}" class="btn btn-danger"><i class="fa fa-trash"></i> Delete</a>
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
