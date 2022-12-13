<%@ include file="components/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.deloitte.dao.ItemDao" %>
<%@page import="java.util.List"%>
<%@page import="com.deloitte.Item"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Edit Inventory</title>
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
		border:black 4px solid;
		
				
	}
	
	.bgcolorbody
	{
		background-color:#FAFAD2;
		color:black;
		font-weight:bold;
		font-size:20px;
		
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
		//Fetching specific data from DB using DAO
		String Id = request.getParameter("invtCode");
		ItemDao iDao2 = new ItemDao();
		List<Item> i2 = iDao2.fetchItem();
		
	
	%>
	<div class="mt-3 text-center">
	
	<!--------  DISPLAYING RESPONSE  -------->
	<%@ include file="components/response.jsp"%>
	</div>
	<div class="container ">
	
			<!--------  CARD STARTS  -------->
			<div class="card mt-5 bgcolor " style="width:auto;">
			
				<h2 class="card-header text-center">Edit Inventory</h2>
				
				<div class="card bgcolorbody">
				<form class="form-horizontal" action="EditServlet" method="POST">
				<div class="row mt-3 text-center">
				
				<% //FOR LOOP STARTS
				for(Item i: i2){ 
					if(i.getInvtCode().equals(Id))
					{
						
				%>
					<input type="hidden" value="<%=i.getInvtCode()%>" name="invtId">
					<div class="col-md-3 ">Inventory Code</div>
					<div class="col-sm-2 "><input type="text" disabled="disabled" value="<%=i.getInvtCode()%>" ></div>
					<div class="col-md-3 ">Quantity</div>
					<div class="col-sm-2 "><input type="text" value="<%=i.getQty()%>" name="quantity" 
												pattern="^[+]?([0-9])+$"
												oninvalid="this.setCustomValidity('Give valid values')"
  												oninput="this.setCustomValidity('')"
  												required="required"></div>
				</div>	
				<div class="row mt-3 text-center">
				
					<div class="col-md-3 ">Inventory Name</div>
					<div class="col-sm-2 "><input type="text" disabled="disabled" value="<%=i.getInvtName()%>" ></div>
					<div class="col-md-3 ">Unit Price</div>
					<div class="col-sm-2 "><input type="text" value="<%=i.getUnitPrice()%>" name="price" 
												pattern="^[+]?([0-9]*[.])?[0-9]+$"
												oninvalid="this.setCustomValidity('Give valid values')"
  												oninput="this.setCustomValidity('')"
  												required="required"></input></div>
				
				</div>
				<div class="row mt-3 text-center">
					<div class="col-md-3 "></div>
					<div class="col-sm-2 "></div>
					<div class="col-md-3 "><button  class="btn btn-secondary font-weight-bold"><a href="itemList.jsp" class="button">Back</a></button></div>
					<div class="col-sm-2 "><button type="submit" class="btn btn-success font-weight-bold">Submit</button></div>
				</div>
				
				<%	}
				// FOR LOOP ENDS
				}
				%>
				</form>
				</div>
			</div>
			<!--------  CARD ENDS  -------->
	</div>


</body>
</html>