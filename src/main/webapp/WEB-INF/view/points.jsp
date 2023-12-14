<%--
Copyright 2023 Git Guardians

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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.core.env.Environment" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%
    Environment environment = WebApplicationContextUtils.getWebApplicationContext(application).getEnvironment();
    String apiUrl = environment.getProperty("api.base-url");
%>
<c:set var = "selectedPage" value = "admin" scope="request"/>
<jsp:include page="header.jsp" />
<!-- start of users.jsp selectedPage=${selectedPage}-->
<script>var apiUrl = '<%= apiUrl%>'</script>
<!-- Begin page content -->
<main role="main" class="container">

    <div>
        <h1><spring:message code="points-table-header" text="Manage Points" /></h1>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col"><spring:message code="points-table-name" text="Name" /></th>
                <th scope="col"><spring:message code="points-table-desc" text="Description" /></th>
                <th scope="col"><spring:message code="points-table-cat" text="Category" /></th>
                <th scope="col"><spring:message code="points-table-lat" text="Latitude" /></th>
                <th scope="col"><spring:message code="points-table-lng" text="Longitude" /></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="point" items="${mapPointList}">
                <tr>
                    <td>${point.id}</td>
                    <td>${point.name}</td>
                    <td>${point.description}</td>
                    <td>${point.category}</td>
                    <td>${point.lat}</td>
                    <td>${point.lng}</td>
                    <td>
                        <button class="remove-point-btn" data-pointid="${point.id}"><spring:message code="points-table-remove" text="Remove Point" /></button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>
</main>
<script type='text/javascript' src='./js/map/pointsadmin.js'></script>

<jsp:include page="footer.jsp" />
