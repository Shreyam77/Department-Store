<%@ include file="components/common.jsp" %>
<%@ page import="com.deloitte.dao.ItemDao" %>
<%@page import="java.util.List"%>
<%@page import="com.deloitte.Item"%>

<!DOCTYPE html>

<html lang="en">
<head>
	<title>Item List</title>
</head>
<style>
	body
	{
		background-image: url('images/bg.jpg');	
		  background-size: cover;
		
	}
	
	.bgcolor
	{
		background-color: #2E8B57;
		color:white;
		
	}
	
	.bgcolorbody
	{
		border:black 4px solid;
		background-color:#FAFAD2;
	}
	
	td
	{
		font-size:20px;
		font-weight:bold;
	}
	
	.button
	{
		color:white;
		font-weight:bold;
		text-decoration:none;
	}
</style>
<body>


	<%
		// Fetching all data from DB using DAO  
		ItemDao iDao = new ItemDao();
		List<Item> i1 = iDao.fetchItem();
	
	%>
	
	<div class="mt-3 text-center">
			<%@ include file="components/response.jsp"%>
	</div>
	
	<div class="container">
		<!-- First Part: Search Card -->
		<div>
			<div class="card mt-5 mb-2 bgcolorbody">
				<h2 class="card-header bgcolor text-center">Inventory List</h2>
				<div class="card">
				<table>									
				<!--  Table for displaying Titles -->
				<tr class="text-center" style="background-color:#FAFAD2;">
					<td>Name:</td> 
					<td><input type="text" name="searchName" id="searchName"></td>
					<td><button class="btn btn-secondary" onClick="window.location.reload(true)">Clear Searches</button></td>
					<td><button class="btn btn-primary" onclick="search()" >Search</button></td>
					<td></td>
				</tr>
				</table>
				</div>
			</div>
		</div>
		
		<!-- Second Part: Displaying ITEMS -->
		<div class="card mt-3 pb-3 bgcolorbody">
				<!--------  TABLE STARTS  -------->
				<table id="myTable">	<!-- //Table for displaying Inventory Items -->
				<tr class="card-header text-center bgcolor">
					<th><h4>Code</h4></th>
					<th><h4>Name</h4></th>
					<th><h4>Qty</h4></th>
					<th><h4>Unit Price(Rs)</h4></th>
					<th><h4>Actions</h4></th>
				</tr>
				
				<% //FOR LOOP STARTS
				for(Item i: i1){ 

					%>
				
				<tr class="text-center">
					<td><%= i.getInvtCode() %></td> 
					<td><%= i.getInvtName() %></td>
					<td><%= i.getQty() %></td>
					<td><%= i.getUnitPrice() %></td>
					<td><a href="editItem.jsp?invtCode=<%=i.getInvtCode()%>">Edit</a></td>
				</tr>
				<%} 
				//FOR LOOP ENDS %>
				
				<tr class="text-center mb-3">
					<td></td> 
					<td></td>
					<td></td>
					<td></td>
					<td><button class="mt-3 btn btn-info"><a class=" button" href="addItem.jsp">Add</a></button></td>
				</tr>
				</table>
				<!--------  TABLE ENDS  -------->
			
		</div>
	</div>
	
</body>
</html>
