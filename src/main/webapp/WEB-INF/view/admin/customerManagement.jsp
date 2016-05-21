<%@include file="/WEB-INF/view/admin/template/header.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Customer Management</h1>

    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Name</th>
                <th>Phone</th>
                <th>Username</th>
                <th>Authority</th>
                <th>Enable</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${customerList}" var="customer">
                <tr>
                    <td>${customer.customerName}</td>
                    <td>${customer.customerPhone}</td>
                    <td>${customer.username}</td>
                    <td>${customer.authority}</td>
                    <td>${customer.enabled}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <a href="/admin/product/addProduct"><button class="btn btn-primary">Add Product</button></a>
    </div>
</div>
</div>
</div>

<%@include file="/WEB-INF/view/admin/template/footer.jsp" %>
