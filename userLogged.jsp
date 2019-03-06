
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256" import="dagrelogin.UserBean"%>

<html>

<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>User Logged Successfully</title>
</head>

<style>
table, th, td {
	border: 1px solid #eee;
	border-collapse: collapse;
	padding: 5px;
}

input {
	color: #00f;
	width: 50%;
}

body {
	font-family: "Verdana", Georgia, Serif;
}

body {
	height: 100%;
	margin: 0;
	padding: 0
}

h1 {
	margin: 0;
	padding: 0
}

header h1 {
	border: 0;
	margin: 0;
	background-color: "Red";
}

input[type='checkbox'] {
	float: left;
	width: 20px;
}

input[type='checkbox']+label {
	display: block;
	width: 30px;
}
</style>

<body>
	<h1 align="center">Douglas And Gordon Real Estate Agents</h1>
	<p></p>

	<%
		UserBean user = (UserBean) session.getAttribute("currentSessionUser");
	%>

	<table align="center" border="0" width="100%">
		<tr>
			<td width="20%"></td>
			<td width="60%" align="center">
				<h2>
					Welcome
					<%=user.getTitle()%>.
					<%=user.getFirstname()%>
					<%=user.getLastname()%>
				</h2>
			</td>
			<td width="20%" align="right">My saved properties: 
				<%
					int savedProperties = user.getSavedProperties();
					
					if (savedProperties == 0) {
				%>
					0
				<%
					}
					else {
				%>
				<form action="userProperties">
					<input type="submit" value=<%=savedProperties %>>
					<input type="hidden" name="Username" value=<%=user.getFirstname()%>>
				</form>
				<%
					}
				%>
			</td>
		</tr>
	</table>

	<p></p>
	
	<form action="searchProperties">
		<input type="hidden" name="user" value="<%=user.getFirstname() %>">
		<table align="center">
			<tr>
				<td>Borough</td>
				<td><input type="text" name="borough"></td>
			</tr>
			<tr>
				<td>Maximum number of Bedrooms</td>
				<td><input type="number" name="bedrooms" min="0" max="5"
					value="2"></td>
			</tr>
			<tr>
				<td>What is your budget?</td>
				<td><input id="slider1" name="range" type="range" min="0"
					max="200000" step="5000" oninput="budvalID.value = slider1.value"">
					£ <output name="budvalname" id="budvalID" value="100000"></td>
			</tr>

			<tr>
				<td align="center"><input type="submit" name="Search"
					value="Submit"></td>
				<td align="center"><input type="reset" name="reset"></td>
			</tr>
		</table>
	</form>
</body>

</html>