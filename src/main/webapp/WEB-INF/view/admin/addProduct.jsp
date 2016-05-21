<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/admin/template/header.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <div class="container">
        <div class="page-header">
            <h1>Add Product</h1>
        </div>

        <form:form action="${pageContext.request.contextPath}/admin/product/addProduct" method="post" commandName="product"
            enctype="multipart/form-data">
            <form:hidden path="productDate" id="productDate" value="${now}" />
            <div class="form-group">
                <label for="name">Name</label> <form:errors path="productName" cssStyle="color: red" />
                <form:input path="productName" id="name" class="form-Control" />
            </div>

            <div class="form-group">
                <label for="productCategory">Category</label><form:errors path="productCategory" cssStyle="color: red" />
                <c:forEach items="${mainCategoryList}" var="mainCategory">
                    <label class="checkbox-inline"><form:radiobutton path="productCategory" id="productCategory"
                                                                     value="${mainCategory}" />${mainCategory}</label>
                </c:forEach>
            </div>

            <div class="form-group">
                <label for="productSubCategory">SubCategory</label><form:errors path="productSubCategory" cssStyle="color: red" />
                <c:forEach items="${subCategoryList}" var="subCategory">
                    <label class="checkbox-inline"><form:radiobutton path="productSubCategory" id="productSubCategory"
                                                                     value="${subCategory}" />${subCategory}</label>
                </c:forEach>
            </div>

            <div class="form-group">
                <label for="productSummary">Summary</label><form:errors path="productSummary" cssStyle="color: red" />
                <form:input path="productSummary" id="productSummary" class="form-Control" />
            </div>

            <div class="form-group">
                <label for="productDescription">Description</label><form:errors path="productDescription" cssStyle="color: red" />
                <form:textarea path="productDescription" id="productDescription" class="form-Control" />
            </div>

            <div class="form-group">
                <label for="price">Price</label> <form:errors path="productPrice" cssStyle="color: red" />
                <form:input path="productPrice" id="price" class="form-Control" />
            </div>

            <div class="form-group">
                <label for="condition">Condition</label><form:errors path="productCondition" cssStyle="color: red" />
                <label class="checkbox-inline"><form:radiobutton path="productCondition" id="condition"
                                                                 value="new" />New</label>
                <label class="checkbox-inline"><form:radiobutton path="productCondition" id="condition"
                                                                 value="used" />Used</label>
            </div>

            <div class="form-group">
                <label for="unitInStock">Unit In Stock</label> <form:errors path="unitInStock" cssStyle="color: red" />
                <form:input path="unitInStock" id="unitInStock" class="form-Control" />
            </div>

            <div class="form-group">
                <label for="productTag">Tag</label><form:errors path="productTag" cssStyle="color: red" />
                <form:input path="productTag" id="productTag" class="form-Control" />
            </div>

            <div class="form-group">
                <label class="control-label" for="productImage">Upload Picture</label>
                <form:input id="productImage" path="productImage" type="file" class="form:input-large" />
            </div>

            <input type="submit" value="submit" class="btn btn-default">
            <a href="<c:url value="/admin/productInventory" />" class="btn btn-default">Cancel</a>

        </form:form>
    </div>
</div>