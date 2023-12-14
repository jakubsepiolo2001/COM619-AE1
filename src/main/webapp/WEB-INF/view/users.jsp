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
<c:set var = "selectedPage" value = "admin" scope="request"/>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="header.jsp" />
<!-- start of users.jsp selectedPage=${selectedPage}-->

<!-- Begin page content -->
<main role="main" class="container">

    <div>
        <h1><spring:message code="users-header" text="Modify Users" /></h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col"><spring:message code="users-username" text="Username" /></th>
                    <th scope="col"><spring:message code="users-firstname" text="First Name" /></th>
                    <th scope="col"><spring:message code="users-secondname" text="Second Name" /></th>
                    <th scope="col"><spring:message code="users-status" text="Status" /></th>
                    <th scope="col"><spring:message code="users-role" text="Role" /></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${userList}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.firstName}</td>
                        <td>${user.secondName}</td>
                        <!-- user.enabled=${user.enabled}-->
                        <td><c:if test="${user.enabled}"><spring:message code="users-enabled" text="ENABLED" /></c:if><c:if test="${!user.enabled}"><spring:message code="users-disabled" text="DISABLED" /></c:if></td>
                        <td>${user.userRole}</td>
                        <td>
                            <form action="./viewModifyUser" method="GET">
                                <input type="hidden" name="username" value="${user.username}">
                                <button class="btn" type="submit" ><spring:message code="users-modify-button" text="Modify User" /></button>
                            </form> 
                        </td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
        <form action="./register" method="GET">
            <button class="btn" type="submit" ><spring:message code="users-add-button" text="Add User" /></button>
        </form> 
    </div>
</main>

<jsp:include page="footer.jsp" />
