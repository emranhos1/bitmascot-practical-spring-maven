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
                            <div>
                                <h4>${message}</h4>
                            </div>
                                <div id="formContent">
                                    <!-- Tabs Titles -->
                                
                                    <!-- Icon -->
                                    <div class="fadeIn first">
                                      <h3>Change Password</h3>
                                    </div>
                                
                                    <form:form class="form" method="POST" modelAttribute="userPojo" action="/dashboard/new/password" role="form">
                                        <form:input type="password" class="fadeIn second" path="password" placeholder="Previous Password"/>
                                        <form:input type="password" class="fadeIn second" path="newPass" placeholder="New Password"/>
                                        <form:input type="password" class="fadeIn second" path="confirmPass" placeholder="Confirm Password"/>
                                        <input type="submit" class="fadeIn fourth" value="Change" style="float: left"/>
                                        <input type="reset" class="fadeIn fourth btn reset" value="Clear"/>
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