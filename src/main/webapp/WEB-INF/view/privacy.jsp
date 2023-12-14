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
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- Begin page content -->
<main role="main" class="container">
    <H1><spring:message code="privacy-header-top" text="Privacy Notice" /></H1>

    <H2><spring:message code="privacy-header-one" text="1. Location Information:" /></H2>
    <p><spring:message code="privacy-message-one" text="When you use this website, we may collect and store information about your device's location to provide you with location-based services. This data helps enhance your experience . Rest assured that your location information is treated with the utmost confidentiality and is not shared with third parties." /></p>

    <H2><spring:message code="privacy-header-two" text="2. Password Information:" /></H2>
    <p><spring:message code="privacy-message-two" text="To ensure the security of your account, we require you to create and use a password. This password is securely stored in our systems using industry-standard encryption protocols. We do not have access to your password, and it is never shared or disclosed to anyone, including our team." /></p>

    <H2><spring:message code="privacy-header-three" text="3. Security Measures:" /></H2>
    <p><spring:message code="privacy-message-three" text="We implement robust security measures to protect your data from unauthorized access, disclosure, alteration, and destruction. Our team is dedicated to continuously monitoring and improving our security practices to safeguard your information." /></p>

    <H2><spring:message code="privacy-header-four" text="4. Your Consent:" /></H2>
    <p><spring:message code="privacy-message-four" text="By using this website, you consent to the collection and use of your location information and the storage of your password as outlined in this privacy notice. If you do not agree with any part of this notice, please refrain from using our application." /></p>

    <H2><spring:message code="privacy-header-five" text="5. Changes to Privacy Notice:" /></H2>
    <p><spring:message code="privacy-message-five" text="We may update this privacy notice to reflect changes in our practices or for legal reasons. We encourage you to review this notice periodically for any updates." /></p>

    <H2><spring:message code="privacy-header-six" text="6. Contact Us:" /></H2>
    <p><spring:message code="privacy-message-six" text="If you have any questions or concerns regarding your privacy while using our website, please contact us.

        Thank you for trusting us with your information.

        Git Guardians
        Dec 2023" /></p>
</main>




<jsp:include page="footer.jsp" />
