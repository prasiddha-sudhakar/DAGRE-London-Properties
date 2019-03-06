
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256" import="dagrelogin.UserBean"%>

<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Invalid Login</title>
</head>

<body>

	<% UserBean user = (UserBean) session.getAttribute("currentSessionUser"); %>

	<h1 align="center">User <%= user.getemail()%> is not registered or entered incorrect password</h1>

</body>

</html>