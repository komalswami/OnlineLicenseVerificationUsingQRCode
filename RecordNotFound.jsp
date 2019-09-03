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
		function displayAlert()
		{
			alert("Sorry! We could not find your record \nContact RTO or Click ok to try again");
			document.location.href="signup.jsp"
		}
	</script>
</head>
<body onload="displayAlert()">
<div class="container-fluid bg">
<div class="row">
	<div class="col-md-4 col-sm-4 col-xs-12"></div>
	<div class="col-md-4 col-sm-4 col-xs-12"></div>
</body>
</html>