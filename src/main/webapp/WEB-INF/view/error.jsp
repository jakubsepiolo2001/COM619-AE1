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
<jsp:include page="header.jsp" />
<!-- Begin page content -->
<main role="main" class="container">
        <h1>Error Page</h1>
        <p>Application has encountered an error.</p>
        <p>${error}</p>
        <p>${status}</p>
        <p>Failed URL: ${requestUrl}</p>
        <p>Exception:  ${exception.message}</p>
        <p>Stack trace:</p>
        <p>${strStackTrace}</p>
</main>

<jsp:include page="footer.jsp" />
