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
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="header.jsp" />
<!-- Begin page content -->
<main role="main" class="container">
    <H1><spring:message code="login-header" text="Login" /></H1>
    <div style="color:red;">${errorMessage}</div>
    <div style="color:green;">${message}</div>

    <form action="./login" method="post">
        <input type="hidden" name="action" value="login">
        <p><spring:message code="login-username" text="Username " /><input type="text" name="username" ></input></p><BR>
        <p><spring:message code="login-password" text="Password " /><input type="password" name="password" ></input></p>
        <p><spring:message code="login-gdpr" text="*By logging in you have accepted our policy regarding GDPR and your information" /></p>
        <p><button type="submit" ><spring:message code="login-login-button" text="Login" /></button></p>
    </form> 
    
    <a href="./register"><spring:message code="login-create-button" text="Create a new account" /></a>
</main>


<jsp:include page="footer.jsp" />
