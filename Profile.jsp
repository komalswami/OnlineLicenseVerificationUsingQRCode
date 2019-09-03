<%
		String name=request.getParameter("name");
		String qrPath=request.getParameter("qrPath");
		String uname=request.getParameter("uname");
		String message=request.getParameter("message"); 
		if(message.equals("null"))
		{
			message="";
		}
%>
<!DOCTYPE html>
	<html>
		<head>
		<meta charset="utf-8">
			<meta name="viewport" content="width=device-width,initial-scale=1">
			<link rel="stylesheet" type="text/css" href="					https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
			<link href="css/global.css" type="text/css" rel="stylesheet">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			<script src="<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
			</script>
			<link rel="stylesheet" href="css/start.css">

			<title>Profile</title>
		</head> 	
		<body>
		<script>
			function confirmation()
			{
				var uname=document.getElementById("uname").value;
				if(confirm("Do you really Want to Delete Profile?"))
				{
					document.location.href='DeleteProfile.jsp?uname='+uname;
				}
			}
			function confirmLogout()
			{
				if(confirm("Are you sure want to logout"))
				{
					document.location.href='Logout.jsp';
				}
			}
		</script>
			<div class="container-fluid bg">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-12"></div>
				<div class="col-md-4 col-sm-4 col-xs-12"></div>
			</div>	
<!--Form start--->
<form class="form-container" name="Modify">

<center><h1>Hello, <%=name%></h1><br>
<b><x style="color:#f1c40f;"><%=message%></x></b></center>


	<center><img src="<%=qrPath%>" height="200px" width="200px"></center>
	<br><br><br>
	<button type="button" class="btn btn-success btn-block" style="background:#4FB9BA;"" name="update" onclick="document.location.href='UpdateProfile.jsp?uname=<%=uname%>'">Update</button>&nbsp &nbsp 
	<button type="button" class="btn btn-success btn-block" style="background:#4FB9BA;"" name="delete" onclick="confirmation()">Delete</button>&nbsp &nbsp 
	<button type="button" class="btn btn-success btn-block" style="background:#4FB9BA;"" name="logout" onclick="confirmLogout()">Logout</button>&nbsp &nbsp 
	<input type="hidden" name="uname" id="uname" value="<%=uname%>"/>
</form>
<!---Form end--->

</div>
<div class="col-md-4 col-sm-4 col-xs-12"></div>
</div>
</div>
</body>
</html>