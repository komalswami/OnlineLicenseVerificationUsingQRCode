
<%@page import="java.sql.*,javax.sql.*"%>

<%! PreparedStatement ps;
	ResultSet rs;
%>
<%
	String uname=request.getParameter("email");
	String pass=request.getParameter("password");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conMain=DriverManager.getConnection("jdbc:mysql://localhost:3306/maindatabase","root","");
		ps=conMain.prepareStatement("Select * from maintable where Email=?");
		ps.setString(1,uname);
		rs=ps.executeQuery();
		rs.next();
		String name=rs.getString(2);
		String dbpass=rs.getString(5);
		String qrPath=rs.getString(6);
		if(pass.equals(dbpass))
		{
			String name1=name;
			%>
				<jsp:forward page="Profile.jsp">
				<jsp:param name="name" value="<%=name1%>"/>
				<jsp:param name="qrPath" value="<%=qrPath%>"/>
				<jsp:param name="uname" value="<%=uname%>"/>
				<jsp:param name="message" value="" />
				</jsp:forward>
			<%
		}
		else
		{
			%>
				<jsp:forward page="login.jsp">
				<jsp:param name="message" value="Wrong Password"/>
				</jsp:forward>
			<%
			
		}
	}
	catch(SQLException e)
	{
		%>
				<jsp:forward page="login.jsp">
				<jsp:param name="message" value="Username Does not exists"/>
				</jsp:forward>
			<%
	}
%>