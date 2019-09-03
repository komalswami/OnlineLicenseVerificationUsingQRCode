<%@page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@page import="java.io.*"%>
<%@page import="com.itextpdf.text.*,com.itextpdf.text.pdf.PdfWriter"%>

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
	String fullname=rs.getString(2);
	String qrPath=rs.getString(6);
	String dlNo=rs.getString(1);
	String pass=rs.getString(5);
	String gender=rs.getString(3);
	String strGender;
	if(gender.equals("Female"))
	{
		strGender="Ms. ";
	}
	else
	{
		strGender="Mr. ";
	}

	ps=conDummy.prepareStatement("select *from dummy_licences where DLNO=?");
	ps.setString(1,dlNo);
		
	rs=ps.executeQuery();
	rs.next();
	String dummyLicense=rs.getString(2);
	
		String pdfFilePath ="C:/xampp/tomcat/webapps/ROOT/FinalProject/pdf/"+dlNo+".pdf";
		File f=new File(pdfFilePath);
		OutputStream fos = new FileOutputStream(f);
		Document document = new Document(PageSize.A4.rotate(),30,0,55,0);
		PdfWriter pdfWriter = PdfWriter.getInstance(document, fos);
		String userPassword = pass;
		String ownerPassword = "administrator12";
		pdfWriter.setEncryption(userPassword.getBytes(),ownerPassword.getBytes(), PdfWriter.ALLOW_PRINTING,PdfWriter.ENCRYPTION_AES_128);
		document.open();
		document.add(new Paragraph("This is RTO Authorized License of "+strGender+fullname+". with DL number : "+dlNo));
		Image image = Image.getInstance("C:/xampp/tomcat/webapps/ROOT/FinalProject/images/licenses/"+dlNo+".jpg");
		image.setAbsolutePosition(22f, 100f);
		image.scaleAbsoluteWidth(800f);
		image.scaleAbsoluteHeight(400f);
		document.add(image); //Add image to document
		document.close();
		fos.close();
		
%>
<jsp:forward page="Profile.jsp">
				<jsp:param name="name" value="<%=fullname%>"/>
				<jsp:param name="qrPath" value="<%=qrPath%>"/>
				<jsp:param name="uname" value="<%=uname%>"/>
				<jsp:param name="message" value="Profile Updated Successfully!" />
				</jsp:forward>

