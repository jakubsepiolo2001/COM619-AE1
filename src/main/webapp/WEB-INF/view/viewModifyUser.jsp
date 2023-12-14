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
<%@page import="org.project.user.model.UserRole"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var = "selectedPage" value = "users" scope="request"/>
<jsp:include page="header.jsp" />

<!-- Begin page content -->
<main role="main" class="container">

    <div>
        <H1><spring:message code="view-user-modify-header" text="User Details" /> ${modifyUser.username} </H1>
        <!-- print error message if there is one -->
        <div style="color:red;">${errorMessage}</div>
        <div style="color:green;">${message}</div>

        <form action="./viewModifyUser" method="POST">
            <table class="table">
                <thead>
                </thead>

                <tbody>
                    <tr>
                        <td><spring:message code="view-user-modify-id" text="User ID" /></td>
                        <td>${modifyUser.id}</td>
                    </tr>
                    <tr>
                        <td><spring:message code="view-user-modify-username" text="Username" /></td>
                        <td>${modifyUser.username}</td>
                    </tr>
                    <tr>
                        <td><spring:message code="view-user-modify-first-name" text="First Name" /></td>
                        <td><input type="text" name="firstName" value="${modifyUser.firstName}" /></td>
                    </tr>
                    <tr>
                        <td><spring:message code="view-user-modify-second-name" text="Second Name" /></td>
                        <td><input type="text" name="secondName" value="${modifyUser.secondName}" /></td>
                    </tr>
                    <tr>
                        <td><spring:message code="view-user-modify-house-number" text="House Number" /></td>
                        <td><input type="text" name="houseNumber" value="${modifyUser.address.houseNumber}" /></td>
                    </tr>
                    <tr>
                        <td><spring:message code="view-user-modify-address-line-1" text="Address Line 1" /></td>
                        <td><input type="text" name="addressLine1" value="${modifyUser.address.addressLine1}" /></td>
                    </tr>
                    <tr>
                        <td><spring:message code="view-user-modify-address-line-2" text="Address Line 2" /></td>
                        <td><input type="text" name="addressLine2" value="${modifyUser.address.addressLine2}" /></td>
                    </tr>
                    <tr>
                        <td><spring:message code="view-user-modify-city" text="City" /></td>
                        <td><input type="text" name="county" value="${modifyUser.address.city}" /></td>
                    </tr>
                    <tr>
                        <td><spring:message code="view-user-modify-County" text="County" /></td>
                        <td><input type="text" name="county" value="${modifyUser.address.county}" /></td>
                    </tr>
                    <tr>
                        <td><spring:message code="view-user-modify-country" text="Country" /></td>
                        <td><input type="text" name="country" value="${modifyUser.address.country}" /></td>
                    </tr>
                    <tr>
                        <td><spring:message code="view-user-modify-postcode" text="Postcode" /></td>
                        <td><input type="text" name="postcode" value="${modifyUser.address.postcode}" /></td>
                    </tr>
                    <tr>
                        <td><spring:message code="view-user-modify-tele" text="Telephone" /></td>
                        <td><input type="text" name="telephone" value="${modifyUser.address.telephone}" /></td>
                    </tr>
                    <tr>
                        <td><spring:message code="view-user-modify-mobile" text="Mobile" /></td>
                        <td><input type="text" name="mobile" value="${modifyUser.address.mobile}" /></td>
                    </tr>

                </tbody>

            </table>

            <c:if test="${sessionUser.userRole !='ADMINISTRATOR'}">
                <p><spring:message code="view-user-modify-user-status-and-role" text="User Status and Role" /></p>
                <table class="table">
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <td><spring:message code="view-user-modify-role" text="Role" /></td>
                            <td>${modifyUser.userRole}</td>
                        </tr>
                        <tr>
                            <td><spring:message code="view-user-modify-status" text="Status" /></td>
                            <td><c:if test="${modifyUser.enabled}"><spring:message code="view-user-modify-enabled" text="ENABLED" /></c:if><c:if test="${!modifyUser.enabled}"><spring:message code="view-user-modify-disabled" text="DISABLED" /></c:if></td>
                            </tr>
                        </tbody>
                    </table>
            </c:if>

            <c:if test="${sessionUser.userRole =='ADMINISTRATOR'}">
                <p><spring:message code="view-user-modify-manage-user-status-and-role" text="Manage User Status and Role" /></p>
                <table class="table">
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <td><spring:message code="view-user-modify-role" text="Role" /></td>
                            <td>
                                <select class="form-control" name="userRole" >
                                    <c:forEach var="value" items="${UserRole.values()}">
                                        <option value="${value}" <c:if test="${modifyUser.userRole == value}"> selected  </c:if>>${value}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>enabled</td>
                            <td>
                                <select class="form-control" name="userEnabled" >
                                    <option value="true" <c:if test="${modifyUser.enabled}"> selected  </c:if> ><spring:message code="view-user-modify-enabled" text="ENABLED" /></option>
                                    <option value="false" <c:if test="${!modifyUser.enabled}"> selected  </c:if> ><spring:message code="view-user-modify-disabled" text="DISABLED" /></option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
            </c:if>

            <input type="hidden" name="username" value="${modifyUser.username}"/>
            <button class="btn" type="submit" ><spring:message code="view-user-modify-update-user-button" text="Update User" /> ${modifyUser.username}</button>
        </form>
        <p><spring:message code="view-user-modify-update-password-header" text="Update Password" /></p>
        <form action="./viewModifyUser" method="post">
            <input type="hidden" name="username" value="${modifyUser.username}"/>
            <input type="hidden" name="action" value="updatePassword"/>
            <p><spring:message code="view-user-modify-password" text="Password" />Password <input type="password" name="password" ></input></p>
            <p><spring:message code="view-user-modify-confirm-password" text="Re-enter Password" /> <input type="password" name="password2" ></input></p>
            <button class="btn" type="submit" ><spring:message code="view-user-modify-update-password-button" text="Update " />${modifyUser.username} Password</button>
        </form>
        <c:if test="${sessionUser.userRole =='ADMINISTRATOR'}">
            <BR>
            <form action="./users">
                <button class="btn" type="submit" ><spring:message code="view-user-modify-return-button" text="Return to Users" /></button>
            </form> 
        </c:if> 

        </div>

    </main>

<jsp:include page="footer.jsp" />
