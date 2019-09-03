<%@page import="java.sql.*,javax.sql.*,java.io.*"%>
<%! PreparedStatement ps;
	ResultSet rs;
	int rows;
%>
<%
	String uname=request.getParameter("uname");
	String uname1=uname;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conDummy=DriverManager.getConnection("jdbc:mysql://localhost:3306/dummy","root","");
	Connection conMain=DriverManager.getConnection("jdbc:mysql://localhost:3306/maindatabase","root","");
	
	ps=conMain.prepareStatement("select * from maintable where Email=?");
	ps.setString(1,uname);
	rs=ps.executeQuery();
	rs.next();
	
	ps=conMain.prepareStatement("Delete from maintable where Email=?");
	ps.setString(1,uname);
	int i=ps.executeUpdate();
	
	
	String dlNo=rs.getString(1);
	out.println(dlNo);
	new java.io.File("C:\\xampp\\tomcat\\webapps\\ROOT\\FinalProject\\pdf\\"+dlNo+".pdf").delete();
	new java.io.File("C:\\xampp\\tomcat\\webapps\\ROOT\\FinalProject\\images\\qr\\"+dlNo+".png").delete();
	
	out.println("<script>alert('Your Profile has been Deleted Successfully! Thank You for using our Services')</script>");
	out.println("<script>document.location.href='index.html'</script>");
%>