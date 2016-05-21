<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/admin/template/header.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <div class="container">
        <div class="page-header">
            <h1>Edit Product</h1>
        </div>

        <form:form action="${pageContext.request.contextPath}/admin/product/editProduct" method="post" commandName="product"
            enctype="multipart/form-data">
            <form:hidden path="productViews" value="${product.productViews}" />
            <form:hidden path="productDate" value="${product.productDate}" />
            <form:hidden path="productId" value="${product.productId}" />

            <div class="form-group">
                <label for="name">Name</label>
                <form:input path="productName" id="name" class="form-Control" value="${product.productName}" />
            </div>

            <div class="form-group">
                <label for="productCategory">Category</label>
                <c:forEach items="${mainCategoryList}" var="mainCategory">
                    <c:if test="${mainCategory eq product.productCategory}">
                        <label class="checkbox-inline"><form:radiobutton path="productCategory" id="productCategory"
                                                             value="${mainCategory}" checked="checked" />${mainCategory}</label>
                    </c:if>
                    <c:if test="${mainCategory ne product.productCategory}">
                        <label class="checkbox-inline"><form:radiobutton path="productCategory" id="productCategory"
                                                                         value="${mainCategory}"/>${mainCategory}</label>
                    </c:if>
                </c:forEach>
            </div>

            <div class="form-group">
                <label for="productSubCategory">SubCategory</label>
                <c:forEach items="${subCategoryList}" var="subCategory">
                    <c:if test="${subCategory eq product.productSubCategory}">
                    <label class="checkbox-inline"><form:radiobutton path="productSubCategory" id="productSubCategory"
                                                                     value="${subCategory}" check="checked"/>${subCategory}</label>
                    </c:if>
                    <c:if test="${subCategory ne product.productSubCategory}">
                        <label class="checkbox-inline"><form:radiobutton path="productSubCategory" id="productSubCategory"
                                                                         value="${subCategory}"/>${subCategory}</label>
                    </c:if>
                </c:forEach>
            </div>

            <div class="form-group">
                <label for="productSummary">Summary</label><form:errors path="productSummary" cssStyle="color: red" />
                <form:input path="productSummary" id="productSummary" class="form-Control" value="${product.productSummary}" />
            </div>

            <div class="form-group">
                <label for="desciption">Description</label>
                <form:textarea path="productDescription" id="desciption" class="form-Control" value="${product.productDescription}" />
            </div>

            <div class="form-group">
                <label for="price">Price</label>
                <form:input path="productPrice" id="price" class="form-Control" value="${product.productPrice}" />
            </div>

            <div class="form-group">
                <label for="condition">Condition</label>
                <label class="checkbox-inline"><form:radiobutton path="productCondition" id="condition"
                                                                 value="new" />New</label>
                <label class="checkbox-inline"><form:radiobutton path="productCondition" id="condition"
                                                                 value="used" />Used</label>
            </div>

            <div class="form-group">
                <label for="unitInStock">Unit In Stock</label>
                <form:input path="unitInStock" id="unitInStock" class="form-Control" value="${product.unitInStock}" />
            </div>

            <div class="form-group">
                <label for="productTag">Tag</label>
                <form:input path="productTag" id="productTag" class="form-Control" value="${product.productTag}" />
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