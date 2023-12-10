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
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- Begin page content -->
<main role="main" class="container">
    <H1><spring:message code="contact-header" text="Contact" /></H1>
    <p>Tyler Short - 5short82@solent.ac.uk</p>
    <p>Owen Bradstreet - 5brado63@solent.ac.uk</p>
    <p>Jakub Sepiolo - 5sepij35@solent.ac.uk</p>
    <p>Steve Dawe - 5dawes65@solent.ac.uk</p>
    <p>Luke Wood - 5woodl59@solent.ac.uk</p>
</main>


<jsp:include page="footer.jsp" />
