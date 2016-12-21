<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Customer Management Page</h1>

            <p class="lead">This is the customer management page!</p>
        </div>

        <table class="table table-striped table-hover">
            <thead>
            <tr class="bg-success">
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>User name</th>
                <th>Enabled</th>
            </tr>
            </thead>
            <c:forEach items="${customerList}" var="customer">
                <tr>
                    <th>${customer.customerName}</th>
                    <th>${customer.customerEmail}</th>
                    <th>${customer.customerPhone}</th>
                    <th>${customer.username}</th>
                    <th>${customer.enabled}</th>
                </tr>
            </c:forEach>
        </table>

<%@ include file="/WEB-INF/views/template/footer.jsp" %>