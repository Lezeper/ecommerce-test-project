<%@include file="/WEB-INF/view/template/header.jsp"%>

<div class="container-wrapper">
    <div class="container">
        <section>
            <div class="container">
                <h1 class="alert-danger">Checkout Cancelled</h1>

                <p>Your checkout process is cancelled.</p>
            </div>
        </section>

        <section class="container">
            <p>
                <a href="<spring:url value="/customer/cart" />" class="btn btn-default">OK</a>
            </p>

        </section>
    </div>
</div>

<%@include file="/WEB-INF/view/template/footer.jsp"%>