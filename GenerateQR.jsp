<%@page import="java.awt.*,java.awt.image.BufferedImage,java.io.*,java.util.Hashtable"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="com.google.zxing.*,com.google.zxing.common.BitMatrix"%>
<%@page import="com.google.zxing.qrcode.QRCodeWriter
,com.google.zxing.qrcode.decoder.ErrorCorrectionLevel"%>

<%
	String dlNo=request.getParameter("dlNo");
	String qrCodeText = "192.168.43.53:8182/FinalProject/pdf/"+dlNo+".pdf";
	String filePath = "C://xampp//tomcat//webapps//ROOT//FinalProject//images//qr//"+dlNo+".png";
	int size = 125;
	String fileType = "png";
	File qrFile = new File(filePath);
	
	
	Hashtable<EncodeHintType, ErrorCorrectionLevel> hintMap = new Hashtable<>();
	hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
	QRCodeWriter qrCodeWriter = new QRCodeWriter();
	BitMatrix byteMatrix = qrCodeWriter.encode(qrCodeText, BarcodeFormat.QR_CODE, size, size, hintMap);
		
	int matrixWidth = byteMatrix.getWidth();
	BufferedImage image = new BufferedImage(matrixWidth, matrixWidth, BufferedImage.TYPE_INT_RGB);
	image.createGraphics();

	Graphics2D graphics = (Graphics2D) image.getGraphics();
	graphics.setColor(Color.WHITE);
	graphics.fillRect(0, 0, matrixWidth, matrixWidth);
		
	graphics.setColor(Color.BLACK);

	for (int i = 0; i < matrixWidth; i++) {
		for (int j = 0; j < matrixWidth; j++) {
			if (byteMatrix.get(i, j)) {
				graphics.fillRect(i, j, 1, 1);
			}
		}
	}
	ImageIO.write(image, fileType, qrFile);
%>
<jsp:forward page="login.jsp">
<jsp:param name="message" value="Congratulations! Your profile has been created successfully. Please login!"/>
</jsp:forward>