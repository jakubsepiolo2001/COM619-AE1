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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.springframework.core.env.Environment" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%
    Environment environment = WebApplicationContextUtils.getWebApplicationContext(application).getEnvironment();
    String apiUrl = environment.getProperty("api.base-url");
%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="org.project.config.ApiConfig" %>


<!DOCTYPE html>
<html>
<script>var apiUrl = '<%= apiUrl%>'</script>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>MapApp - Spring Boot + Leaflet</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />

    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet' type='text/css'/>

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <![endif]-->
    <!-- Leaflet library import-->
    <link rel="stylesheet" type="text/css" href="./css/leaflet.css" />
    <link rel="stylesheet" type="text/css" href="./css/leaflet-loader.css" />
    <script type='text/javascript' src='./js/jquery.min.js'></script>
    <script type='text/javascript' src='./js/leaflet.js'></script>
    <script type='text/javascript' src='./js/leaflet-loader.js'></script>
    <script type='text/javascript' src='./js/leaflet-layerjson.min.js'></script>
    <!-- -->

</head>

<jsp:include page="header.jsp" />
<body>

<div class="container">

    <button onclick="createPoint()"><spring:message code="button-create-point" text="Create Point" /></button>
    <button onclick="getLocation()"><spring:message code="button-get-location" text="Get Location" /></button>
    <article>
        <header>
            <h1>Leaflet App</h1>
            <p></p>
        </header>
        <section>
            <div id="map" style="height: 440px; border: 1px solid #AAA;"></div>
            <div id="loader"></div>
            <p><a href="./swagger-ui/index.html" target="_blank">Swagger (OpenAPI) UI</a></p>
            <p><a href="./api-docs" target="_blank">Swagger (OpenAPI) Json Definition</a></p>
            </section>
        <footer>

        </footer>
        <hr/>
    </article>

    <footer style="text-align: center">
        <p><span style="text-decoration:none;color:grey;">/* Map - <a style="text-decoration:none;color:grey;" href="https://github.com/imaginalis"><span class="glyphicon glyphicon-star"></span>  imaginalis</a> */</span>
        </p>
    </footer>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" ></script>
<!-- Our JS map script importing-->
<script type='text/javascript' src='./js/map/map.js'></script>
<script type='text/javascript' src='./js/map/markers.js'></script>
<!-- -->
</body>
<jsp:include page="footer.jsp" />
</html>