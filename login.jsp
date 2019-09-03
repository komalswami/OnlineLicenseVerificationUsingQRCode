<%
	String message;
	try
	{
		message=request.getParameter("message");
		if(message.equals("null"))
		{
			message="";
		}
	}
	catch(Exception e)
	{
		message="";
	}
	
%>
<!DOCTYPE html>
	<html lang="en">
		<head>
			<title>Login</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width,initial-scale=1">
			<link rel="stylesheet" type="text/css" href="					https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
			<link href="css/global.css" type="text/css" rel="stylesheet">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			<script src="<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		</head>
		<body>
			<div class="container-fluid bg">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-12"></div>
				<div class="col-md-4 col-sm-4 col-xs-12"></div>
			</div>	
<!--Form start--->
<form class="form-container" action="loginValidate.jsp" method="do">
<h1><center>Login Form</center></h1><br>
<b><x style="color:#f1c40f;"><%=message%></x></b><p>
	<div class="form-group">
		<b><label for="email">Email</label></b>
		<input type="email" class="form-control" id="email" name="email" placeholder="User Name" required/>
	</div>
	
	<div class="form-group">
		<b><label for="exampleInputPassword1">Password</label></b>
		<input type="password" class="form-control" id="password" name="password" placeholder="Password" required/>
	</div>
			
	<h5>
	<a href="ResetPass.jsp?f1=2&message=null"> <p style="color:#f1c40f;">Reset my Password</p></a></h5><br>
	<button type="submit" class="btn btn-success btn-block" style="background:#4FB9BA;">Submit</button>
	<h5>Don't have an account?<a href="signup.jsp"><b><x style="color:#f1c40f;"> Sign Up </x></b></a></h5>
</form>
<!---Form end--->

</div>
<div class="col-md-4 col-sm-4 col-xs-12"></div>
</div>
</div>
</body>
</html>