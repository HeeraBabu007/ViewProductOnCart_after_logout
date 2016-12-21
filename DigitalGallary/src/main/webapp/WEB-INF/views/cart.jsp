<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<script src="resources/js/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.min.js"></script>

<script>
angular.module('demo', [])
.controller('Hello', function($scope, $http) {
    $http.get('http://localhost:8080/DigitalGallary/rest/cart/${cartId}').
        then(function(response) {
            $scope.greeting = response.data;;
        });
});
</script>

<!-- <body ng-app="demo"> -->
<!-- 		<div ng-controller="Hello"> -->
<!-- 			<p>CartID={{greeting.cartId}}</p> -->
<!-- 			<p>price= {{cartItems.totalPrice}}</p> -->
<!-- 		</div> -->
		
<!-- </body> -->
	
<div class="container-wrapper">
    <div class="container">
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1>Cart</h1>
                    <p>All the selected products in your shopping cart</p>
                </div>
            </div>
        </section>

<section class="container" ng-app="demo">

<div ng-controller = "Hello" ng-init="initCartId('${cartId}')">
<!--              			<p>CartID={{greeting.cartId}}</p> -->
    <div>
     <a class="btn btn-danger pull-left" ng-click = "clearCart()"><span class="glyphicon glyphicon-remove-sign">
     </span> Clear Cart</a>
     
     <a href="<spring:url value="/order/${cartId}" />" class="btn btn-success pull-right">
     <span class="glyphicon glyphicon-shopping-cart"></span> Check out</a>
    </div>
           <br/><br/><br/>
                
		<!--                 <a href="http://localhost:8080/dummyshopping/rest/cart/2">my product in cart</a> -->
<div class="container">
	<table class="table">
	<thead>
      <tr>
       <th>Product Name</th> 
                        <th>Product ID</th>
                        <th>Price</th>  
                        <th>Quantity</th>
                        <th>total Price</th>
                       <th>Action</th>
      </tr>
	</thead>
	<tbody>
	<tr ng-repeat = "item in greeting.cartItems">
                 
                        <th>{{item.product.productName}}</th>
                        <th>{{item.product.productId}}</th>
                        <th>{{item.product.productPrice}}</th>
                        <th>{{item.quantity}}</th>
                        <th>{{item.totalPrice}}</th>
                        
                        <th>
                         <a href="<spring:url value="/rest/cart/remove/{item.product.productId}" />" class="label label-danger">
                          <span class="glyphicon glyphicon-remove"></span> remove</a>
</tr>
	</tbody>
</table>
</div>
</div>
</section>
</div></div>

<script src="<c:url value="/resources/js/controller.js?v3" /> "></script>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>