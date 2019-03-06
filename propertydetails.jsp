<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"
	import="java.util.*, searchProperties.HousingProps, searchProperties.Address, searchProperties.Characters, searchProperties.PropBean"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Douglas and Gordon real estates</title>
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

	<%
		String streetnumber = request.getParameter("streetnumber");
		String streetname = request.getParameter("streetname");
		String borough = request.getParameter("borough");
		String postcode = request.getParameter("postcode");
		String income = request.getParameter("income");
		String agegroup = request.getParameter("agegroup");
		String bedrooms = request.getParameter("bedrooms");
		String park = request.getParameter("park");
		String gym = request.getParameter("gym");
		String swim = request.getParameter("swim");
		String show = request.getParameter("showSaved");
		String propimage = request.getParameter("propimage");
	%>

	<table align="center">
	
	<h1 align="center">Douglas And Gordon Real Estate Agents</h1>
	<h2 align="center"><%=session.getAttribute("Username")%> <%=show%></h2>
	
		<tr>
			<td><img src="<%=propimage%>.jpg"></img></td>
			<td>
			<%=streetnumber%> <%=streetname%>
			<p><%=borough%></p>
			<%=postcode%>
			</td>
		</tr>
		<tr>
			<td> <b>Income: </b> £ <%=income%> </td>
			<td> <b>Age group: </b> <%=agegroup%></td>
		</tr>
		<tr>
			<td><b>Bedrooms: </b> <%=bedrooms%> </td>
			<td><b>Near to a Park: </b> <%=park%> </td>
		</tr>
		<tr>
			<td><b>Near to a Gym: </b> <%=gym%> </td>
			<td><b>Swimming Pool: </b> <%=swim%> </td>
		</tr>

		<tr>
			<%
				if (!session.getAttribute("Username").equals("guest") && !show.equals("false")) {
			%>
			<td colspan="2" align="center">
				<form action="userProperties">
					<input type="hidden" name="Username" value="<%=session.getAttribute("Username")%>">
					<input type="hidden" name="CallingPage" value="PropertyDetails">
					<input type="hidden" name="ID" value="<%=propimage%>">
					<input type="submit" value="Save Property">
				</form>
			</td>
			<%
				}
				else {
			%>
			<td colspan="2" align="center">
				<input type="button" value="Save Property" style="color: grey" disabled>
			</td>
			<%
				}
			%>
		</tr>

	</table>

</body>
</html>