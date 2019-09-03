<%@page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@page import="java.io.*"%>
<%@page import="com.itextpdf.text.*,com.itextpdf.text.pdf.PdfWriter"%>

<%! PreparedStatement ps;
	ResultSet rs;
	int rows;
%>
<%
	String uname=request.getParameter("uname");
	String email=request.getParameter("username");
	String dlNo=request.getParameter("dlNo");
	String pass=request.getParameter("pass1");
	String gender=request.getParameter("gender");
	String SecurityAnswer=request.getParameter("ans");
	String qrPath="images//qr//"+dlNo+".png";
	String dummyDLNO=dlNo;	
	String licensePath="FinalProject\\pdf\\"+dummyDLNO+".pdf";
	String strGender;
	if(gender.equals("Female"))
	{
		strGender="Ms. ";
	}
	else
	{
		strGender="Mr. ";
	}
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conDummy=DriverManager.getConnection("jdbc:mysql://localhost:3306/dummy","root","");
		
		Connection conMain=DriverManager.getConnection("jdbc:mysql://localhost:3306/maindatabase","root","");
		ps=conDummy.prepareStatement("select *from dummy_licences where DLNO=?");
		ps.setString(1,dlNo);
		
		
		rs=ps.executeQuery();
		rs.next();
		String dl1=rs.getString(1);
		
		if(dl1.equals(dlNo))
		{
			try
			{
				ps=conMain.prepareStatement("insert into maintable values(?,?,?,?,?,?,?,?)");
				ps.setString(1,dlNo);
				ps.setString(2,uname);
				ps.setString(3,gender);
				ps.setString(4,email);
				ps.setString(5,pass);
				ps.setString(6,qrPath);
				ps.setString(7,licensePath);
				ps.setString(8,SecurityAnswer);
				int rows=ps.executeUpdate();
			
				if(rows>0)
				{
					String pdfFilePath = "C:/xampp/tomcat/webapps/ROOT/FinalProject/pdf/"+dummyDLNO+".pdf";
					File f=new File(pdfFilePath);
					OutputStream fos = new FileOutputStream(f);
					Document document = new Document(PageSize.A4.rotate(),30,0,55,0);
					//Document document = new Document();
					PdfWriter pdfWriter = PdfWriter.getInstance(document, fos);
					String userPassword = pass;
					String ownerPassword = "administrator12";
					pdfWriter.setEncryption(userPassword.getBytes(),
					ownerPassword.getBytes(), PdfWriter.ALLOW_PRINTING,
					PdfWriter.ENCRYPTION_AES_128);
					document.open();
					document.add(new Paragraph("This is RTO Authorized License of "+strGender+uname+". with DL number : "+dummyDLNO));
					Image image = Image.getInstance("C:/xampp/tomcat/webapps/ROOT/FinalProject/images/licenses/"+dummyDLNO+".jpg");
					image.setAbsolutePosition(22f, 100f);
					image.scaleAbsoluteWidth(800f);
					image.scaleAbsoluteHeight(400f);
					document.add(image); //Add image to document
					document.close();
					fos.close();
					%>
					<jsp:forward page="GenerateQR.jsp">
					<jsp:param name="dlNO" value="<%=dummyDLNO%>"/>
					</jsp:forward>
				<%}
			}
			catch(SQLIntegrityConstraintViolationException e)
			{
				%>
					<jsp:forward page="login.jsp">
					<jsp:param name="message" value="Profile with this License number already exists! Please Login"/>
					</jsp:forward>
				<%
			}	
		}
		else
		{
			%>
				<jsp:forward page="signup.jsp">
				<jsp:param name="message" value="Sorry! We could not find your record.Contact RTO or Try again with appropriate information"/>
				</jsp:forward>
			<%
		}
		
	}	
	catch(Exception e)
	{		
	
			%>
				<jsp:forward page="signup.jsp">
				<jsp:param name="message" value="Sorry! We could not find your record. Contact RTO or try again with appropriate information"/>
				</jsp:forward>
			<%
	}
%>