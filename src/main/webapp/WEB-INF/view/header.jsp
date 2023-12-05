<%--
Copyright [yyyy] [name of copyright owner]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.project.user.model.User" %>
<%@ page import="org.project.user.model.UserRole" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <script>
            function changeLocale() {
                console.log("changeLocale function called");
                console.log()
                var langDropdown = document.getElementById("langDropdown");
                var selectedLang = langDropdown.options[langDropdown.selectedIndex].value;
                if (selectedLang) {
                    window.location.href = selectedLang;
                }
            }
        </script>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../favicon.ico">
        <!--<link rel="canonical" href="https://getbootstrap.com/docs/3.3/examples/navbar/">-->

        <title>GG MapApp</title>

        <!-- Bootstrap core CSS -->
        <link href="./resources/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="./resources/css/navbar.css" rel="stylesheet">

    </head>

    <body>

        <div class="container">
            <c:set var="currentLanguage" value="${pageContext.request.locale.language}" />
            <!-- Static navbar -->
            <select id="langDropdown" onchange="changeLocale()">
                <option></option>
                <option value="${pageContext.request.contextPath}/change-locale?lang=en" <% if ("en".equals(request.getAttribute("currentLanguage"))) {%>selected<% }%>><spring:message code="switch-en" text="English" /></option>
                <option value="${pageContext.request.contextPath}/change-locale?lang=it" <% if ("it".equals(request.getAttribute("currentLanguage"))) {%>selected<% }%>><spring:message code="switch-it" text="Italian" /></option>
                <option value="${pageContext.request.contextPath}/change-locale?lang=de" <% if ("de".equals(request.getAttribute("currentLanguage"))) {%>selected<% }%>><spring:message code="switch-de" text="German" /></option>
                <option value="${pageContext.request.contextPath}/change-locale?lang=fr" <% if ("fr".equals(request.getAttribute("currentLanguage"))) {%>selected<% }%>><spring:message code="switch-fr" text="French" /></option>
                <!-- Add more languages as needed -->
            </select>
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Git Guardians</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <c:set var="selectedPage" value="${requestScope.selectedPage}" />

                        <ul class="nav navbar-nav">
                            <li <% if ("home".equals(request.getAttribute("selectedPage"))) {%> class="active"  <% } %> ><a href="/home"> <spring:message code="home" text="Home" /></a></li>
                            <li <% if ("map".equals(request.getAttribute("selectedPage"))) {%>  class="active"  <% } %> ><a href="/map"><spring:message code="map" text="Map" /></a></li>
                            <li <% if ("contact".equals(request.getAttribute("selectedPage"))) {%>  class="active"  <% }%> ><a href="/contact"><spring:message code="contact" text="Contact" /></a></li>
                                <c:if test="${sessionUser.userRole =='ADMINISTRATOR'}">
                                <li class="dropdown" >
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><spring:message code="admin-dropdown" text="Admin" /><span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="./users"><spring:message code="admin-manage-users" text="Manage Users" /></a></li>
                                        <li><a href="./points"><spring:message code="admin-manage-points" text="Manage Points" /></a></li>
                                    </ul>
                                </li>
                            </c:if>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <!-- user role:  ${sessionUser.userRole}-->
                            <c:if test="${sessionUser.userRole =='ANONYMOUS'}">
                                <li><a href="./login"><spring:message code="login-create" text="Login or create a new Account" /></a></li>
                                </c:if>
                                <c:if test="${sessionUser.userRole !='ANONYMOUS'}">
                                <form id="logoutForm" method="POST" action="./logout">
                                </form>
                                <form id="profile" method="GET" action="./viewModifyUser">
                                    <input type="hidden" name="username" value="${sessionUser.username}"/>
                                </form>
                                <p class="text-muted"> <spring:message code="welcome" text="Welcome" />
                                    <c:if test="${sessionUser.userRole =='ADMINISTRATOR'}"> Admin</c:if>                                   
                                    ${sessionUser.username}&nbsp;&nbsp;
                                    <a onclick="document.forms['logoutForm'].submit()"><spring:message code="logout-button" text="Logout" /></a><BR>
                                    <a onclick="document.forms['profile'].submit()"><spring:message code="profile-button" text="Profile" /></a></p>
                                </c:if>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div><!--/.container-fluid -->
            </nav>
        </div>
    </body>
</html>
