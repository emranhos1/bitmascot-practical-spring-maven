<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp"%>
    </head>
    
    <body>
        <div id="throbber" style="display:none; min-height:120px;"></div>
        <div id="noty-holder"></div>
        <div id="wrapper">
            <!-- Navigation -->
            <%@include file="navbar.jsp"%>

            <div id="page-wrapper">
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="row" id="main" >
                        <div class="col-sm-12 col-md-12 well" id="content">
                            <%-- <table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th scope="col">Name</th>
                                        <th scope="col">Age</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Phone No</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${users}" var="userList">
                                        <tr>      
                                            <td>${userList.firstName} ${userList.lastName}</td>
                                            <td>${userList.birthDate}</td> 
                                            <td>${userList.email}</td>
                                            <td>${userList.phone}</td>  
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table> --%>
                            <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search..">
                            <table id="myTable">
                                <thead>
                                    <tr>
                                        <th scope="col">Name</th>
                                        <th scope="col">Age</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Phone No</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${users}" var="userList">
                                        <tr>
                                            <td>${userList.firstName} ${userList.lastName}</td>
                                            <td>${userList.birthDate}</td> 
                                            <td>${userList.email}</td>
                                            <td>${userList.phone}</td>  
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer -->
        <%@include file="footer.jsp"%>
    </body>
</html>