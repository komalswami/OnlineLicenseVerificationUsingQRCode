<%
	String forWhat,forWhatText,forWhatName,forWhatPlaceholder,forWhatType;
	String f1=request.getParameter("f1");
	String message=request.getParameter("message");
	if(message.equals("null"))
	{
		message="";
	}
	
	if(f1.equals("1"))
	{
		forWhat="Security Answer";
		forWhatText="What is Your Favorite Food Item(make sure it should be secret) :";
		forWhatName="ans";
		forWhatPlaceholder="Enter Your Answer Here.";
		forWhatType="text";
		
	}
	else
	{
		forWhat="Reset Password";
		forWhatText="Enter your current password";
		forWhatName="currPass";
		forWhatPlaceholder="******";
		forWhatType="password";
	}
%>
<html lang="en">
<head>
	<title>Bootsrap Example</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="css/global.css" type="text/css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			
<script type="text/javascript" src="js/signupValidation.js">
			
<!--########################Validate Password######################-->
	function validatePass1(ch)
	{
	}
<!--########################Validate Confirm Password######################-->

	function validatePass2(ch)
	{
	}
<!--########################End Script######################-->	
</script>
</head>
<body>
<div class="container-fluid bg">
<div class="row">
	<div class="col-md-4 col-sm-4 col-xs-12"></div>
	<div class="col-md-4 col-sm-4 col-xs-12"></div>

	<!--########################Form Start######################-->

	<form class="form-container" name="ResetPassForm" action="NewPass.jsp" method="post">  <!--action="just.html" -->		
	<h2>Reset Password</h2><br>
	<b><x style="color:#f1c40f;"><%=message%></x></b><p>
		<div class="form-group">
			<b><label for="email">User Name</label></b>
			<input type="email" class="form-control" id="email" name="email" placeholder="User Name" required/>
		</div>
		<div class="form-group">
			<label for="<%=forWhat%>"><%=forWhatText%></label>
			<input type="<%=forWhatType%>" class="form-control" name="<%=forWhatName%>" placeholder="<%=forWhatPlaceholder%>" required>
		</div>
		<input type="hidden" name="f1" value="<%=f1%>"/>	
		<%
			if(f1.equals("1"))
			{
				%>
					<a href="ResetPass.jsp?f1=2&message=null"> <p style="color:#f1c40f;">Reset my Password(I know my password)</p></a></h5>
				<%
			}
			else
			{
				%>
					<a href="ResetPass.jsp?f1=1&message=null"> <p style="color:#f1c40f;"> I do not remember my Password</p></a></h5>
				<%
			}
		%>
		<a href="login.jsp"> <p style="color:#f1c40f;">Login</p></a></h5><br>
	
		<button type="submit" class="btn btn-success btn-block" style="background:#4FB9BA;" name="submit"/>Submit</button>
				
	</form>
			<!--########################Form End######################-->
</div>
<div class="col-md-4 col-sm-4 col-xs-12"></div>
</div>
</body>
</html>