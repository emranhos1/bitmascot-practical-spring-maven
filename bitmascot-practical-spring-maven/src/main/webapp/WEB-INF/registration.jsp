<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
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
                  <h3>Registration Form</h3>
                </div>

                <form:form class="form" method="POST" modelAttribute="userPojo" action="/registration" role="form">
                    <form:input type="text" class="fadeIn second" path="firstName" placeholder="First Name"/>
                    <form:input type="text" class="fadeIn second" path="lastName" placeholder="Last Name"/>
                    <form:input type="text" class="fadeIn second" path="address" placeholder="Address"/>
                    <form:input type="text" class="fadeIn second" path="phone" placeholder="Phone No"/>
                    <form:input type="email" class="fadeIn second" path="email" placeholder="Email"/>
                    <form:input type="date" class="fadeIn second" path="birthDate"/>
                    <form:input type="password" class="fadeIn second" path="password" placeholder="Password"/>
                    <input type="submit" class="fadeIn fourth btn-sm" value="Create" style="float: left"/>
                    <input type="reset" class="fadeIn fourth btn reset btn-sm" value="Clear"/>
                </form:form>

                <!-- Remind Passowrd -->
                <div id="formFooter">
                    <a class="underlineHover" href="/login">Already Have a account?</a>
                </div>
              </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
    </body>
</html>