<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Details</title>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.5.0.min.js"></script>
<script src="Components/User.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-8">
				<h1 class="m-3">User details</h1>
				<form id="formItem" name="formItem" method="post" action="User.jsp">
					User code: 
					<input id="User_ID" name="User_ID" type="text" class="form-control form-control-sm"> 
					<br> User name:
					<input id="User_Name" name="User_Name" type="text" class="form-control form-control-sm">
					<br> User DOB: 
					<input id="User_DOB" name="User_DOB" type="text" class="form-control form-control-sm">
					 <br> User Email: 
					 <input id="User_Email" name="User_Email" type="text" class="form-control form-control-sm"> 
					 <br> User Gender: 
					<input id="User_Gender" name="User_Gender" type="text" class="form-control form-control-sm"> 
					<br> User PhoneNo:
					<input id="User_Phone_No" name="User_Phone_No" type="text" class="form-control form-control-sm">
					<br> User Address: 
					<input id="User_Address" name="User_Address" type="text" class="form-control form-control-sm">
					<br>
					
					<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 
					<input type="hidden" id="hidUserID_tblSave" name="hidUserID_tblSave" value="">
				</form>
				<br>
					<div id="alertSuccess" class="alert alert-success"></div>
			
					<br>
					<div id="alertError" class="alert alert-danger"></div>
					


				
				
	
			<div id="divItemsGrid">
				<%
					User Userobj = new User();
					out.print(Userobj.readUser());
				%>
			</div>
		


			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-12" id="colStudents"></div>
		</div>
	</div>

</body>
</html>