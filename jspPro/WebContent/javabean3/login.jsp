<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<form class="form-signin" method="post" action="loginAction.jsp">
			<h2 class="form-signin-heading">Please login</h2>
			<input type="text" class="form-control" name="username"
				placeholder="Email Address" required="" autofocus="" /> 
			<input
				type="password" class="form-control" name="password"
				placeholder="Password" required="" /> 
				<label class="checkbox"></label>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
		</form>
	</div>
</body>
</html>