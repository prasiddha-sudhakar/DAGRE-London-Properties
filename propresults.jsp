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
		LinkedList<HousingProps> hplist = (LinkedList<HousingProps>) session.getAttribute("housingresults");
		String altshade="";
		String show = "";
		String cp = (String) session.getAttribute("CallingPage");
		Boolean showButton = (Boolean) session.getAttribute("ShowSavedPropertiesButton");
		if (showButton) {
			show = "true";
		}
		else {
			show = "false";
		}
	%>

	<table width="100%" border="0">
		<tr>
			<td width="10%">
				<%=show%>
			</td>
			<td width="90%" align="center">
				<h1 align="center">Douglas And Gordon Real Estate Agents</h1>
			</td>
			<td width="10%" align="right">
				<%=session.getAttribute("Username")%>
			</td>

		</tr>
	</table>
	<table align="center">
		<tr bgcolor="#00ff00" style="font-weight:bold">
			<td>Door Number</td>
			<td>Street</td>
			<td>Borough</td>
			<td>Postcode</td>
			<td>Bedrooms</td>
			<td>Price (£)</td>
			<td>Age group</td>
			<td>Gym</td>
			<td>Swimming</td>
			<td>Park</td>
			<td>View Property</td>
		</tr>

		<%
			int countsearch = hplist.size();
		%>

		<h2 align="center">
			<%
				if (cp.equals("searchProperties")) {
			%>
			Found
			<%=countsearch%>
			properties matching the search criteria
			<%
				}
				else {
			%>
				List of Saved Properties
			<%
				}
			%>
		</h2>

		<%
			for (int i = 0; i < hplist.size(); i++) {
				Address a = hplist.get(i).getAddress();
				Characters c = hplist.get(i).getPropchar();
				
				if ((i%2) == 0) {
					altshade="#ddffdd";
				}
				else {
					altshade="#ffffff";
				}

				String gym = " ";

				if (c.isGym() == 1) {
					gym = "Yes";
				} else {
					gym = "No";
				}

				String swim = " ";

				if (c.isSwimming() == 1) {
					swim = "Yes";
				} else {
					swim = "No";
				}

				String parc = " ";

				if (c.isPark() == 1) {
					parc = "Yes";
				} else {
					parc = "No";
				}
		%>

		<tr bgcolor="<%= altshade %>">
			<%
				session.setAttribute("propertyimage", a.getID());
			%>

			<td align="center"><%=a.getStreetnum()%></td>
			<td><%=a.getStreetname()%></td>
			<td><%=a.getBorough()%></td>
			<td><%=a.getPostcode()%></td>
			<td align="center"><%=c.getBedrooms()%></td>
			<td>£ <%=c.getIncome()%></td>
			<td align="center"><%=c.getAgegroup()%></td>
			<td><%=gym%></td>
			<td align="center"><%=swim%></td>
			<td align="center"><%=parc%></td>
			<td align="center">
				<a href="propertydetails.jsp?propimage=<%=a.getID()%>&streetnumber=<%=a.getStreetnum()%>&streetname=<%=a.getStreetname()%>&borough=<%=a.getBorough()%>&postcode=<%=a.getPostcode()%>&bedrooms=<%=c.getBedrooms()%>&income=<%=c.getIncome()%>&agegroup=<%=c.getAgegroup()%>&gym=<%=gym%>&swim=<%=swim%>&park=<%=parc%>&showSaved=<%=show%>">
					<img src="<%=a.getID()%>.jpg" style="width: 50px; height: 50px;"></img>
				</a>
			</td>
		</tr>
		<%
			}
		%>
	</table>

</body>
</html>