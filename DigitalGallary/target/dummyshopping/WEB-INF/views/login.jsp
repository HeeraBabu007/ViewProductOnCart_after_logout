<%@ include file="/WEB-INF/views/template/header.jsp" %>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<div class="container">
<div class="container-wrapper">
<div class="container">
        <div id="login-box">
            <h2>Welcome to Digital Gallery! Login with valid Username and Password</h2>

            <c:if test="${not empty msg}">
                <div class="msg">${msg}</div>
            </c:if>

<form class="form-horizontal">
            <form name="loginForm" action="<c:url value="/j_spring_security_check" />" method="post">

                <c:if test="${not empty error}">
                    <div class="error" style="color: #ff0000;">${error}</div>
                </c:if>
                <div class="form-group">
                    <label class="control-label col-sm-6" for="username">User: </label>
                    <div class="col-sm-4">
                    <input type="text" id="username" name="username" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-6" for="password">Password:</label>
                    <div class="col-sm-4">
                    <input type="password" id="password" name="password" class="form-control" />
                    </div>
                </div>
                <div class="form-group"> 
				<label class="control-label col-sm-6"></label>
				<div class="col-sm-4">
                <input type="submit" value="Submit" class="btn btn-default">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
                </div></div>
                </form>
            </form>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</div>