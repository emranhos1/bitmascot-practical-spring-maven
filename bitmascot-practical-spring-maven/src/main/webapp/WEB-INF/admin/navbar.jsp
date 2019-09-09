<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="http://cijulenlinea.ucr.ac.cr/dev-users/">
            <img src="<%=request.getContextPath()%>/images/bitmascot-logo.png" id="icon" alt="User Icon" />
        </a>
    </div>
    <!-- Top Menu Items -->
    <ul class="nav navbar-right top-nav">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">${userName}&nbsp;<b class="fa fa-angle-down"></b></a>
            <ul class="dropdown-menu">
                <li><a href="/logout"><i class="fa fa-fw fa-power-off"></i> Logout</a></li>
            </ul>
        </li>
    </ul>

    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav side-nav">
            <li>
                <a href="/dashboard/userList"><i class="fa fa-fw fa-user"></i>User List</a>
            </li>
        </ul>
    </div>
    <!-- /.navbar-collapse -->
</nav>