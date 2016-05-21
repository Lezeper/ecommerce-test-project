<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/template/header.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <div class="container">
        <div class="page-header">
            <h1>Customer</h1>
            <p class="lead">Customer Details</p>
        </div>

        <h3>Shipping Address Info</h3>

        <c:forEach items="${address}" var="address">
            <form:form commandName="order">
            <div class="form-group">
                <label for="name">Full Name</label>
                <form:input path="shippingFullName" id="name" class="form-Control" value="${address.fullName}" />
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <form:input path="shippingPhoneNumber" id="phone" class="form-Control" value="${address.phoneNumber}"/>
            </div>
            <div class="form-group">
                <label for="address">Shipping Address</label>
                <form:input path="shippingAddress" id="address" class="form-Control" value="${address.address}"/>
            </div>
            <div class="form-group">
                <label for="shippingCity">City</label>
                <form:input path="shippingCity" id="shippingCity" class="form-Control" value="${address.city}"/>
            </div>
            <div class="form-group">
                <label for="shippingState">State</label>
                <form:input path="shippingState" id="shippingState" class="form-Control" value="${address.state}"/>
            </div>
            <div class="form-group">
                <label for="shippingCountry">Country</label>
                <form:input path="shippingCountry" id="shippingCountry" class="form-Control" value="${address.country}"/>
            </div>
            <div class="form-group">
                <label for="shippingZip">ZipCode</label>
                <form:input path="shippingZipCode" id="shippingZip" class="form-Control" value="${address.zipCode}"/>
            </div>

            <input type="hidden" name="_flowExecutionKey">

            <br>

            <input type="submit" value="Next" class="btn btn-default" name="_eventId_customerInfoCollected">
            <button class="btn btn-default" name="_eventId_cancel">Cancel</button>
            </form:form>
        </c:forEach>
        <br>
    </div>
</div>

<%@include file="/WEB-INF/view/template/footer.jsp" %>