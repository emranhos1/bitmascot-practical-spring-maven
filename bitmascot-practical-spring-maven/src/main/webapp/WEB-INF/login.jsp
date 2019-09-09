<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="head.jsp"%>
    </head>

    <body>
        <div class="wrapper fadeInDown">
            <div>
                <h4>${message}</h4>
            </div>
            <div id="formContent">
                <!-- Tabs Titles -->
                <!-- Icon -->
                <div class="fadeIn first">
                    <img src="<%=request.getContextPath()%>/images/bitmascot-logo.png" id="icon" alt="User Icon" />
                </div>
            
                <!-- Login Form -->
                <form:form class="form" method="POST" modelAttribute="userPojo" action="/login" role="form">
                    <form:input type="email" class="fadeIn second" path="email" placeholder="email"/>
                    <form:input type="password" class="fadeIn third" path="password" placeholder="password"/>
                    <input type="submit" class="btn btn-primary btn-sm" value="Login" style="float: left"/>
                    <input type="reset" class="btn btn-primary btn reset" value="Clear"/>
                </form:form>
                
                <!--
                <div id="formFooter">
                    <a class="underlineHover" href="/changePassword">Forgot Password?</a>
                </div> -->
                
                <div id="formFooter">
                    Are you new here? <a class="underlineHover" href="/registration">Register Here</a>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>