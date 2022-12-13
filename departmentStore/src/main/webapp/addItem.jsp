<%@ include file="components/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Add Inventory</title>
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
	
	.fonts
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

	<div class="mt-3 text-center">
			<%@ include file="components/response.jsp"%>
	</div>
	<div class="container fonts">
	
			<!--------  CARD STARTS  -------->
			<div class="card mt-5 bgcolorbody" style="width:auto;">

				<h2 class="card-header bgcolor text-center">Add Inventory</h2>
	
				<div class="card" style="background-color:#FAFAD2;">
				
				<!--------  FORM STARTS  -------->	
				<form class="form-horizontal" name="fr" action="AddServlet" method="post">
				<div class="row mt-3 text-center" >
					
					<div class="col-md-3 ">Inventory Code*</div>
					<div class="col-sm-2 "><input name="inventoryCode" type="text" required="required"
											oninvalid="this.setCustomValidity('One or more mandatory fields missing')"
  											oninput="this.setCustomValidity('')"></div>
					<div class="col-md-3 ">Quantity*</div>
					<div class="col-sm-2 "><input name="quantity" type="text" required="required" 
										placeholder="0" pattern="^[+]?([0-9])+$"
										oninvalid="this.setCustomValidity('Give valid values')"
  										oninput="this.setCustomValidity('')"></div>
				</div>	
				<div class="row mt-3 text-center">
				
					<div class="col-md-3 ">Inventory Name*</div>
					<div class="col-sm-2 "><input name="inventoryName" type="text" required="required"
											oninvalid="this.setCustomValidity('One or more mandatory fields missing')"
  											oninput="this.setCustomValidity('')"></div>
					<div class="col-md-3 ">Unit Price*</div>
					<div class="col-sm-2 "><input name="unitPrice" type="text" required="required" 
										placeholder="0.0" pattern="^[+]?([0-9]*[.])?[0-9]+$"
										oninvalid="this.setCustomValidity('Give valid values')"
  										oninput="this.setCustomValidity('')"></div>
				
				</div>
				<div class="row mt-3 text-center">
					<div class="col-md-3 "></div>
					<div class="col-sm-3 "><h6>* Required Fields</h6></div>
					<div class="col-sm-2 "><button  class="btn btn-secondary font-weight-bold"><a href="itemList.jsp" class="button">Back</a></button></div>
					<div class="col-sm-2 "><button type="reset" class="btn btn-secondary font-weight-bold">Clear</button></div>
								<div class="col-sm-2 "><button type="submit" class="btn btn-success font-weight-bold">Submit</button></div>
				</div>
				</form>
				<!--------  FORM ENDS  -------->
				</div>
			</div>
			<!--------  CARD ENDS  -------->
			
	</div>


</body>
</html>