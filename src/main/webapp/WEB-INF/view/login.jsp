<%@include file="/WEB-INF/view/template/header.jsp"%>

<!-- Cart view section -->
<section id="aa-myaccount">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-myaccount-area">
                    <div class="col-md-6" style="float: none; margin-left: 35%; width: 30%">
                        <div class="aa-myaccount-login">

                            <h4>Login</h4>
                            <c:if test="${not empty msg}">
                                <div class="msg" style="color: red">${msg}</div>
                            </c:if>

                            <form name="loginForm" action="<c:url value="/j_spring_security_check" />"
                                  class="aa-login-form" method="post">

                                <c:if test="${not empty error}">
                                    <div class="error" style="color: red">${error}</div>
                                </c:if>

                                <div class="form-group">
                                    <label for="username">Email<span>*</span></label>
                                    <input id="username" type="text" name="username" placeholder="Email address" class="form-control" />
                                </div>

                                <div class="form-group">
                                    <label for="password">Password<span>*</span></label>
                                    <input id="password" type="password" name="password" placeholder="Password" class="form-control">
                                </div>

                                <button type="submit" class="aa-browse-btn">Login</button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                <label class="rememberme" for="rememberme"><input type="checkbox" id="rememberme"> Remember me </label>
                                <p class="aa-lost-password"><a href="#">Lost your password?</a></p>
                                <p>Don't have an account?<a href="<spring:url value="/register" />" style="color: red">Register now!</a></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Cart view section -->

<%@include file="/WEB-INF/view/template/footer.jsp"%>