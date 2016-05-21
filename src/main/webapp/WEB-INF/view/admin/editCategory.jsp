<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/admin/template/header.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <div class="container">
        <div class="page-header">
            <h1>Edit Category</h1>
        </div>

        <form:form action="${pageContext.request.contextPath}/admin/category/editCategory/${category.categoryId}" method="post" commandName="category"
                   enctype="multipart/form-data">

            <form:hidden path="categoryId" value="${category.categoryId}" />
            <div class="form-group"><form:errors path="mainCategoryName" cssStyle="color: red" />
                <label for="mainCategoryName">MainCategory</label>
                <form:input path="mainCategoryName" id="mainCategoryName" class="form-Control" />
            </div>

            <div class="form-group"><form:errors path="subCategoryName" cssStyle="color: red" />
                <label for="subCategoryName">SubCategory</label>
                <form:input path="subCategoryName" id="subCategoryName" class="form-Control" />
            </div>

            <input type="submit" value="submit" class="btn btn-default">
            <a href="<c:url value="/admin/category" />" class="btn btn-default">Cancel</a>

        </form:form>
    </div>
</div>