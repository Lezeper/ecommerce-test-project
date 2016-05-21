<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/admin/template/header.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <div class="container">
        <div class="page-header">
            <h1>Add Slider</h1>
        </div>

        <form:form action="${pageContext.request.contextPath}/admin/homePageSettings/slider/addSlider" method="post" commandName="slider"
                   enctype="multipart/form-data">

            <div class="form-group">
                <label for="sliderUpperData">SliderUpperData</label> <form:errors path="sliderUpperData" cssStyle="color: red" />
                <form:input path="sliderUpperData" id="sliderUpperData" class="form-Control" />
            </div>
            <div class="form-group">
                <label for="sliderTitle">SliderTitle</label> <form:errors path="sliderTitle" cssStyle="color: red" />
                <form:input path="sliderTitle" id="sliderTitle" class="form-Control" />
            </div>
            <div class="form-group">
                <label for="sliderDescription">SliderDescription</label> <form:errors path="sliderDescription" cssStyle="color: red" />
                <form:input path="sliderDescription" id="sliderDescription" class="form-Control" />
            </div>
            <div class="form-group">
                <label for="sliderLink">SliderLink</label> <form:errors path="sliderLink" cssStyle="color: red" />
                <form:input path="sliderLink" id="sliderLink" class="form-Control" />
            </div>

            <div class="form-group">
                <label class="control-label" for="sliderImage">Upload Picture</label>
                <form:input id="sliderImage" path="sliderImage" type="file" class="form:input-large" />
            </div>

            <input type="submit" value="submit" class="btn btn-default">
            <a href="<c:url value="/admin/productInventory" />" class="btn btn-default">Cancel</a>

        </form:form>
    </div>
</div>