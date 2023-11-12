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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
// request set in controller
//    request.setAttribute("selectedPage","contact");
%>
<jsp:include page="header.jsp" />
<!-- Begin page content -->
<main role="main" class="container">
    <H1>Create a New Account</H1>
    <div style="color:red;">${errorMessage}</div>
    <div style="color:green;">${message}</div>


    <p>Username must be unique and password must be at least 8 characters</p>
    <form action="./register" method="POST">
        <input type="hidden" name="action" value="createNewAccount">
        <p>Username <input type="text" name="username" ></input></p><BR>
        <p>Password <input type="password" name="password" ></input></p>
        <p>Re Enter Password <input type="password" name="password2" ></input></p>
        <p><button type="submit" >Create New Account</button></p>
    </form> 

</main>


<jsp:include page="footer.jsp" />
