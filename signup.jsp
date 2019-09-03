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
	<title>Signup</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="css/global.css" type="text/css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			
<script type="text/javascript">
			
<!--########################Validate License Number######################-->			
	function validateDLNo()
{
	with(document.forms.SignUpForm)
	{
		var lNo=dlNo.value
		var re=/^(\D{2})[ -\.]?(\d{13})$/
		if(re.test(lNo))
		{
			dlNo.value=lNo.split('-').join('')
			dlNo.value=dlNo.value.slice(0,2)+"-"+dlNo.value.slice(2,15);
			dlNo.value=dlNo.value.toUpperCase();
			getLicense.disabled=false
		}
		else
		{
			alert("Invalid License Format..!");
			dlNo.focus();
		}
	}
}
<!--########################Validate Password######################-->
	function validatePass1(ch)
{
	with(document.forms.SignUpForm)
	{
		if(ch==2)
		{
			if(pass1.value.length>=4)
			{
			}
			else
			{
				alert("Password 1 must be at least four characters");
				pass1.focus();	
			}
		}
		else
		{
			validateDLNo();
		}
	}
}

<!--########################Validate Confirm Password######################-->
function validatePass2(ch)
{
	with(document.forms.SignUpForm)
	{
		if(ch==1)
		{	
			if(pass1.value.length<4)
			{
				pass1.focus();
				alert("Enter Pass1 first");
			}
			else
			{
			
			}
		}
		else
		{
			if(pass1.value==pass2.value)
			{
			}
			else
			{
				pass2.value="";
				alert("Password Do not match");
				pass2.focus();
			}
		}
	}
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

	<form class="form-container" name="SignUpForm" action="GetMyLicense.jsp" method="post">  <!--action="just.html" -->		
	<h2>Sign Up</h2><br>
	<b><x style="color:#f1c40f;"><%=message%></x></b><p>
		<div class="form-group">
			<label for="username">Name:</label>
			<input type="text" class="form-control" name="uname" placeholder="abc" required>
		</div>
			
		<div class="form-group">
			<label for="username">Email:</label>
			<input type="email" class="form-control" name="username" placeholder="example@email.com" required>
		</div>
			
		<div class="form-group">
			<label for="dlNo">License Number:</label>
			<input type="text" class="form-control" name="dlNo" placeholder="DL-XXXXXXXXXXXXX" onchange="validateDLNo()" required>
		</div>
		
		<div class="form-group">
			<label for="pass1">Set Password</label>
			<input type="password" class="form-control" name="pass1" placeholder="********" onfocus="validatePass1(1)" onchange="validatePass1(2)" required>
		</div>
			
		<div class="form-group">
			<label for="pass2">Retype password</label>
			<input type="password" class="form-control" name="pass2" placeholder="********" onfocus="validatePass2(1)" onchange="validatePass2(2)" required>
		</div>
		<div class="form-group">
			<label for="Security Ans">What is Your Favorite Food Item(make sure it should be secret) :</label>
			<input type="text" class="form-control" name="ans" placeholder="Your Answer Here" required>
		</div>
		<div class="form-group">
			<label for="radio">Choose Gender</label><br><br>
			<input type="radio"  name="gender" value="Male" required><label for="radio">&nbsp Male</label></input> &nbsp &nbsp &nbsp &nbsp 
			<input type="radio"  name="gender" value="Female" required><label for="radio">&nbsp Female</label></input>
			
		</div>
				
		<button type="submit" class="btn btn-success btn-block" style="background:#4FB9BA;" disabled="true" name="getLicense"/>Get My License</button>
				
		<h5>Already Have an account? <a href="login.jsp"><b><x style="color:#f1c40f;">Login</x></b></a></h5>
	</form>
			<!--########################Form End######################-->
</div>
<div class="col-md-4 col-sm-4 col-xs-12"></div>
</div>
</body>
</html>