<%@include file="/WEB-INF/view/template/header.jsp"%>

<!-- Cart view section -->
<section id="cart-view">
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="cart-view-area">
                        <div class="cart-view-table">
                            <form action="">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th>Product</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr ng-repeat="item in cart.cartItems">
                                            <input type="hidden" id="product-info-{{item.product.productId}}"
                                                   stock="{{item.product.unitInStock}}" quantity="{{item.quantity}}"
                                                   productPrice = "{{item.product.productPrice}}">
                                            <td>
                                                <a class="label label-danger" href="#"
                                                   ng-click="removeFromCart(item.product.productId)">
                                                <span class="glyphicon glyphicon-remove"></span></a>
                                            </td>
                                            <td>
                                                <a href="<c:url value="/products/viewProduct/" />{{item.product.productId}}">
                                                    <img src="/resources/images/{{item.product.productId}}/0.png" alt="img">
                                                </a>
                                            </td>
                                            <td><a class="aa-cart-title" href="<c:url value="/products/viewProduct/" />{{item.product.productId}}">{{item.product.productName}}</a></td>
                                            <td>$ {{item.product.productPrice}}</td>
                                            <td>
                                                <p style="color: red" id="quantity-error-cart-{{item.product.productId}}"></p>
                                                <select productId="{{item.product.productId}}" ng-model="item.selectedOption"
                                                        id="selector-quantity-{{item.product.productId}}" ng-change="selected_quantity(item.product.productId)"
                                                        onmousedown="click_selected_quantity(this); this.onmousedown = false;">
                                                    <option value="{{item.quantity}}" selected>{{item.quantity}}</option>
                                                </select>
                                                <div id="update-quantity-div-{{item.product.productId}}" hidden>
                                                    <input type='number' min='1' max='999' id="update-quantity-{{item.product.productId}}"/>
                                                    <button ng-click="update_quantity(item.product.productId);">Update</button>
                                                </div>
                                            </td>

                                            <td>$ <p id="total-{{item.product.productId}}" style="display: inline">
                                                {{converDouble(item.totalPriceDouble)}}</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6" class="aa-cart-view-bottom">
                                                <div class="aa-cart-coupon">
                                                    <input class="aa-coupon-code" type="text" placeholder="Coupon: 123">
                                                    <input class="aa-cart-view-btn" type="submit" value="Apply Coupon">
                                                </div>
                                                <a href="<spring:url value="/"/>">
                                                    <input class="aa-cart-view-btn" type="text" style="cursor: hand" value="Keep Shopping">
                                                </a>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </form>
                            <!-- Cart Total view -->
                            <div class="cart-view-total">
                                <h4>Cart Totals</h4>
                                <table class="aa-totals-table">
                                    <tbody>
                                    <!--
                                    <tr>
                                        <th>Subtotal</th>
                                        <td>$ {{calGrandTotal()}}</td>
                                    </tr>-->
                                    <tr>
                                        <th>Total</th>
                                        <td>$ <p id="cart-grandTotal" style="display: inline">{{calGrandTotal()}}</p></td>
                                    </tr>
                                    </tbody>
                                </table>
                                <a href="<spring:url value="/order/${cartId}"/> " class="aa-cart-view-btn">
                                    <span class="glyphicon-shopping-cart glyphicon"></span> Proced to Checkout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Cart view section -->

<%@include file="/WEB-INF/view/template/footer.jsp"%>