<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                            <div class="wrapper fadeInDown">
                                <div class="col-sm-6">
                                    <form:form modelAttribute="user">
                                        <div class="form-group">
                                            <label class="fadeIn second col-sm-6">First name:</label> <label class="fadeIn second col-sm-6" id="firstName">${user.firstName}</label>
                                        </div>

                                        <div class="form-group">
                                            <label class="fadeIn second col-sm-6">List name:</label> <label class="fadeIn second col-sm-6" id="lastName">${user.lastName}</label>
                                        </div>

                                        <div class="form-group">
                                            <label class="fadeIn second col-sm-6">Address:</label> <label class="fadeIn second col-sm-6" id="address">${user.address}</label>
                                        </div>

                                        <div class="form-group">
                                            <label class="fadeIn second col-sm-6">Phone:</label> <label class="fadeIn second col-sm-6" id="phone">${user.phone}</label>
                                        </div>

                                        <div class="form-group">
                                            <label class="fadeIn second col-sm-6">Email:</label> <label class="fadeIn second col-sm-6" id="email">${user.email}</label>
                                        </div>

                                        <div class="form-group">
                                            <label class="fadeIn second col-sm-6">Birth date:</label> <label class="fadeIn second col-sm-6" id="birthDate">${user.birthDate}</label>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- footer -->
        <%@include file="footer.jsp"%>
    </body>
</html>