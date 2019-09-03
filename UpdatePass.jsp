
<%@page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@page import="java.io.*"%>
<%@page import="com.itextpdf.text.*,com.itextpdf.text.pdf.PdfWriter"%>

<%! PreparedStatement ps;
	ResultSet rs;
	String password,uname;
		
%>
<%
	password=request.getParameter("pass1");
	uname=request.getParameter("email");

		Class.forName("com.mysql.jdbc.Driver");
		Connection conMain=DriverManager.getConnection("jdbc:mysql://localhost:3306/maindatabase","root","");
		ps=conMain.prepareStatement("Select * from maintable where Email=?");
		ps.setString(1,uname);
		rs=ps.executeQuery();
		rs.next();
		String dummyDLNO=rs.getString(1);
		String fullname=rs.getString(2);
		String gender=rs.getString(3);
		String strGender;
		if(gender.equals("Female"))
		{
			strGender="Mrs. ";
		}
		else
		{
			strGender="Mr. ";
		}

		ps=conMain.prepareStatement("Update maintable set Password=? where Email=?");
		ps.setString(1,password);
		ps.setString(2,uname);
		int i=ps.executeUpdate();
		
		String pdfFilePath = "C:/xampp/tomcat/webapps/ROOT/FinalProject/pdf/"+dummyDLNO+".pdf";
					File f=new File(pdfFilePath);
					OutputStream fos = new FileOutputStream(f);
					Document document = new Document(PageSize.A4.rotate(),30,0,55,0);
					PdfWriter pdfWriter = PdfWriter.getInstance(document, fos);
					String userPassword = password;
					String ownerPassword = "administrator12";
					pdfWriter.setEncryption(userPassword.getBytes(),
					ownerPassword.getBytes(), PdfWriter.ALLOW_PRINTING,
					PdfWriter.ENCRYPTION_AES_128);
					document.open();
					document.add(new Paragraph("This is RTO Authorized License of "+strGender+fullname+". with DL number : "+dummyDLNO));
					Image image = Image.getInstance("C:/xampp/tomcat/webapps/ROOT/FinalProject/images/licenses/"+dummyDLNO+".jpg");
					image.setAbsolutePosition(22f, 100f);
					image.scaleAbsoluteWidth(800f);
					image.scaleAbsoluteHeight(400f);
					document.add(image); //Add image to document
					document.close();
					fos.close();
	out.println("<script>alert('Password Changed Successfully')</script>");
		out.println("<script>document.location.href='login.jsp'</script>");	
		
		
		
		
%>