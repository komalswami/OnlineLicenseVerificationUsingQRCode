<%@page import="java.sql.*,javax.sql.*"%>

<%! PreparedStatement ps;
	ResultSet rs;
	String ans,currPass,dbpass,mainAns,uname,emailid;
	String f1;
	boolean unable;
		
%>
<%
	f1=request.getParameter("f1");
	uname=request.getParameter("email");
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conMain=DriverManager.getConnection("jdbc:mysql://localhost:3306/maindatabase","root","");
		ps=conMain.prepareStatement("Select * from maintable where Email=?");
		ps.setString(1,uname);
		rs=ps.executeQuery();
		rs.next();
		dbpass=rs.getString(5);
		mainAns=rs.getString(8);
		if(f1.equals("1"))
		{
			ans=request.getParameter("ans");
			if(mainAns.equals(ans))
			{
				String uname1=uname;
			}
			else
			{
				%>
					<jsp:forward page="ResetPass.jsp">
					<jsp:param name="f1" value="<%=f1%>" />
					<jsp:param name="message" value="Wrong Answer, Try Again!" />
					</jsp:forward>
				<%
			}
		}
		else
		{
			currPass=request.getParameter("currPass");
			if(dbpass.equals(currPass))
			{
				String uname1=uname;
			}
			else
			{
				%>
					<jsp:forward page="ResetPass.jsp">
					<jsp:param name="f1" value="<%=f1%>" />
					<jsp:param name="message" value="Incorrect Password" />
					</jsp:forward>
				<%
			}
		}
	}
	catch(SQLException e)
	{
		%>
			<jsp:forward page="ResetPass.jsp">
			<jsp:param name="f1" value="<%=f1%>" />
			<jsp:param name="message" value="Username does not exist!"/>
			</jsp:forward>
		<%
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Bootsrap Example</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="css/global.css" type="text/css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			
	<script>
		function validatePass1()
		{
			with(document.forms.ResetPassword)
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
		}
		function validatePass2(ch)
		{
			with(document.forms.ResetPassword)
			{
			
				if(pass1.value.length<4)
				{
					pass1.focus();
					alert("Enter Pass1 first");
				}
				else
				{
				}
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
	</script>
</head>
<body>
<div class="container-fluid bg">
<div class="row">
	<div class="col-md-4 col-sm-4 col-xs-12"></div>
	<div class="col-md-4 col-sm-4 col-xs-12"></div>

	<!--########################Form Start######################-->

	<form class="form-container" name="ResetPassword" action="UpdatePass.jsp" method="post">  <!--action="just.html" -->		
	<h2>Reset Password</h2><br>
	
		
		<div class="form-group">
			<label for="pass1">Set Password</label>
			<input type="password" class="form-control" name="pass1" id="pass1" placeholder="********" onchange="validatePass1()" required>
		</div>
			
		<div class="form-group">
			<label for="pass2">Retype password</label>
			<input type="password" class="form-control" name="pass2" placeholder="********" onchange="validatePass2()" required>
		</div>
		<input type="hidden" name="email" value="<%=uname%>" />
		<input type="hidden" name="f1" id="f1" value="<%=f1%>" />
		<button type="submit" class="btn btn-success btn-block" style="background:#4FB9BA;" name="submit"/>submit</button>
				
	</form>
			<!--########################Form End######################-->
</div>
<div class="col-md-4 col-sm-4 col-xs-12"></div>
</div>
</body>
</html>