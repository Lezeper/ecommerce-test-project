<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<c:if test="${pageContext.request.userPrincipal.name != null}">
<html ng-app="cartApp" ng-controller = "cartCtrl" ng-init="initCartId('${cart_id}')">
</c:if>
<c:if test="${pageContext.request.userPrincipal.name == null}">
    <html ng-app="cartApp" ng-controller = "cartCtrl">
</c:if>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Daily Shop | Home</title>

    <!-- Font awesome -->
    <link href="<c:url value="/resources/css/font-awesome.css" />" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="<c:url value="/resources/css/jquery.smartmenus.bootstrap.css" />" rel="stylesheet">
    <!-- product view slider -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/jquery.simpleLens.css" />">
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/slick.css" />">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/nouislider.css" />">
    <!-- Theme color -->
    <link id="switcher" href="<c:url value="/resources/css/theme-color/default-theme.css" />" rel="stylesheet">
    <!-- <link id="switcher" href="css/theme-color/bridge-theme.css" rel="stylesheet"> -->
    <!-- Top Slider CSS -->
    <link href="<c:url value="/resources/css/sequence-theme.modern-slide-in.css" />" rel="stylesheet" media="all">

    <!-- Main style sheet -->
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>

    <link href="<c:url value="/resources/css/custom.css" />" rel="stylesheet">

    <!-- jQuery library -->
    <script src="<c:url value="/resources/js/jquery.min.js" />"></script>
</head>
<body>
<!-- wpf loader Two -->
<div id="wpf-loader-two">
    <div class="wpf-loader-two-inner">
        <span>Loading</span>
    </div>
</div>
<!-- / wpf loader Two -->
<!-- SCROLL TOP BUTTON -->
<a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
<!-- END SCROLL TOP BUTTON -->


<!-- Start header section -->
<header id="aa-header">
    <!-- start header top  -->
    <div class="aa-header-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="aa-header-top-area">
                        <!-- start header top left -->
                        <div class="aa-header-top-left">
                            <!-- start language -->
                            <div class="aa-language">
                                <div class="dropdown">
                                    <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                        <img src="<c:url value="/resources/img/flag/english.jpg" />" alt="english flag">ENGLISH
                                        <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                        <li><a href="#"><img src="<c:url value="/resources/img/flag/english.jpg" />" alt="">ENGLISH</a></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- / language -->
                            <a class="btn dropdown-toggle" href="#" style="margin-top: -1px">Daily Deals</a>
                        </div>
                        <!-- / header top left -->
                        <div class="aa-header-top-right">
                            <ul class="aa-head-top-nav-right">
                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                    <li><a href="#" style="cursor: default">Welcome: ${customer_name}</a></li>
                                    <li><a href="<c:url value="/logout" />">Logout</a></li>
                                    <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
                                        <li><a href="/admin/">Admin</a></li>
                                    </c:if>
                                    <li><a href="<c:url value="/customer/account" />">My Account</a> </li>
                                </c:if>
                                <c:if test="${pageContext.request.userPrincipal.name == null}">
                                    <li><a href="" data-toggle="modal" data-target="#login-modal" class="btn dropdown-toggle">Login</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- / header top  -->

    <!-- start header bottom  -->
    <div class="aa-header-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="aa-header-bottom-area">
                        <!-- logo  -->
                        <div class="aa-logo">
                            <!-- Text based logo -->
                            <a href="<c:url value="/" />">
                                <span class="fa fa-shopping-cart"></span>
                                <p>daily<strong>Shop</strong> <span>Your Shopping Partner</span></p>
                            </a>
                        </div>
                        <!-- / logo  -->
                        <!-- cart box -->
                        <div class="aa-cartbox">
                            <a class="aa-cart-link" href="<spring:url value="/customer/cart" />">
                                <span class="fa fa-shopping-basket"></span>
                                <span class="aa-cart-title">SHOPPING CART</span>
                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                    <span class="aa-cart-notify">{{cart.cartItems.length}}</span>
                                </c:if>
                            </a>
                            <c:if test="${pageContext.request.userPrincipal.name != null}">
                                <div class="aa-cartbox-summary">
                                    <ul>
                                        <li ng-repeat="item in cart.cartItems">
                                            <a class="aa-cartbox-img"><img src="/resources/images/{{item.product.productId}}/0.png" alt="img"></a>
                                            <div class="aa-cartbox-info">
                                                <h4><a href="/products/viewProduct/{{item.product.productId}}">{{item.product.productName}}</a></h4>
                                                <p>{{item.quantity}} x $ {{item.product.productPrice}}</p>
                                            </div>
                                            <a class="aa-remove-product" href="#" ng-click="removeFromCart(item.product.productId)">
                                                <span class="fa fa-times"></span>
                                            </a>
                                        </li>
                                        <li>
                                            <span class="aa-cartbox-total-title">Total</span>
                                            <span class="aa-cartbox-total-price">$ {{calGrandTotal()}}</span>
                                        </li>
                                    </ul>
                                    <a class="aa-cartbox-checkout aa-primary-btn" href="<spring:url value="/order/${cart_id}"/>">Checkout</a>
                                </div>
                            </c:if>
                        </div>
                        <!-- / cart box -->
                        <!-- search box -->
                        <div class="aa-search-box">
                            <form action="">
                                <input type="text" name="" id="" placeholder="Search here ex. 'man' ">
                                <button type="submit" style="width: 50px; height: 40px" class="fa fa-search"></button>
                            </form>
                        </div>
                        <!-- / search box -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- / header bottom  -->
</header>
<!-- / header section -->
<!-- menu -->
<section id="menu">
    <div class="container">
        <div class="menu-area">
            <!-- Navbar -->
            <div class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="navbar-collapse collapse">
                    <!-- Left nav -->
                    <ul class="nav navbar-nav">
                        <li><a href="<c:url value="/" /> ">Home</a></li>
                        <li><a href="<spring:url value="/products/men"/>">Men <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="<spring:url value="/products/men?sc=trousers"/>">Trousers</a></li>
                                <li><a href="<spring:url value="/products/men?sc=t-shirt"/>">T-Shirt</a></li>
                                <li><a href="<spring:url value="/products/men?sc=shoes"/>">Shoes</a></li>
                                <!--<li><a href="#">And more.. <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Sandals</a></li>
                                        <li><a href="#">Loafers</a></li>
                                    </ul>
                                </li>-->
                            </ul>
                        </li>
                        <li><a href="<spring:url value="/products/women"/>">Women <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="<spring:url value="/products/women?sc=shirtdress"/>">Shirtdress</a></li>
                                <li><a href="<spring:url value="/products/women?sc=jeans"/>">Jeans</a></li>
                                <li><a href="<spring:url value="/products/women?sc=shoes"/>">Shoes</a></li>
                            </ul>
                        </li>
                        <li><a href="<c:url value="/contact" />">Contact</a></li>
                        <li><a href="#">Pages <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="<spring:url value="/products/all" />">All Products</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </div>
    </div>
</section>
<!-- / menu -->