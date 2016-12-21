<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %>

<script>

    $(document).ready(function(){
        var searchCondition = '${searchCondition}';

        $('.table').DataTable({
            "lengthMenu": [[1,2,3,5,10, -1], [1,2,3,5,10, "All"]],
            "oSearch" : {"sSearch": searchCondition}
        });
    });
</script>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>All Products</h1>

            <p class="lead">Checkout all the awesome products available now!</p>
        </div>
<div class="container">
  <h2>Shop Now</h2>
  <p>We provide 100% online security for your shopping here</p>            
  <table class="table table-condensed">
    <thead>
      <tr>
       <th>Proto Thumb</th>
                    <th>Product Name</th>
                    <th>Category</th>
                    <th>Condition</th>
                    <th>Price</th>
                    <th></th>
      </tr>
    </thead>
 <tbody>
	<c:forEach items="${products}" var="product">
                <tr>
                    <th><img src="<c:url value="/resources/images/${product.productId}.jpg" />" alt="image" style="width:100%"/></th>
                    <th>${product.productName}</th>
                    <th>${product.productCategory}</th>
                    <th>${product.productCondition}</th>
                    <th>${product.productPrice} USD </th>
                    <th><a href="<spring:url value="/product/viewProduct/${product.productId}" />">
                    <span class="glyphicon glyphicon-info-sign"></span>Add to cart</a></th>
                </tr>
            </c:forEach>
 </tbody>
  </table>
</div>

<%@ include file="/WEB-INF/views/template/footer.jsp" %>