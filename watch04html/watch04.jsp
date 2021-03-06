<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Timex | Shopping.com</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/small-business.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="../../index.jsp">Shopping.Com</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="../watches.jsp">Back
						to Menu</a></li>
				<li class="nav-item"><a class="nav-link" href="../../login.jsp">Login</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../../signup.jsp">Signup</a></li>
				<li class="nav-item"><a class="nav-link" href="../../cart.jsp">Cart</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="container">
		<div class="row my-4">
			<div class="col-lg-8">
				<img class="img-fluid rounded" src="04.jpg" alt="">
			</div>
			<div class="col-lg-4">
				<h1>Timex Men Gunmetal-Toned Analogue Watch TW000Y418</h1>
				<h3>Original Price: Rs. 8445(50% OFF)</h3>
				<h2>Rs. 4222</h2>
				<p>Dial width: 40 mm; Strap Width: 23 mm; Display: Analogue;
					Movement: Automatic; Power source: Battery; Dial style: Solid round
					stainless steel dial; Features: Chronograph, Date Aperture, Glow in
					the Dark Inlays; Strap style: Gunmetal Toned bracelet style,
					stainless steel strap with a foldover closure; Water resistance: 50
					m; Warranty: 1 year.</p>
				<a class="btn btn-success btn-lg" href="../../cart.jsp">Add to
					Cart</a>
			</div>
		</div>
		<div class="card text-white bg-secondary my-4 text-center">
			<div class="card-body">
				<h2 class="text-white m-0">SIMILAR PRODUCTS</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 mb-4">
				<div class="card h-100">
					<div class="card-body">
						<h4 class="card-title">Roadster</h4>
						<p class="card-text">Men Black And Grey Regular Fit Checked
							Casual Shirt</p>
					</div>
					<div class="card-footer">
						<a href="../shirt01html/shirt01.jsp" class="btn btn-success">More
							Info</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-4">
				<div class="card h-100">
					<div class="card-body">
						<h4 class="card-title">HIGHLANDER</h4>
						<p class="card-text">Men Olive Green Slim Fit Camouflage
							Printed Casual Shirt</p>
					</div>
					<div class="card-footer">
						<a href="../shirt02html/shirt02.jsp" class="btn btn-success">More
							Info</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-4">
				<div class="card h-100">
					<div class="card-body">
						<h4 class="card-title">ether</h4>
						<p class="card-text">Men BLUE ANTI MICROBIAL FILAFIL Slim Fit
							Shirt</p>
					</div>
					<div class="card-footer">
						<a href="../shirt03html/shirt03.jsp" class="btn btn-success">More
							Info</a>
					</div>
				</div>
			</div>
		</div>
		<div class="card text-white bg-secondary my-4 text-center">
			<div class="card-body">
				<h2 class="text-white m-0">FREQUENTLY BOUGHT TOGETHER</h2>
			</div>
		</div>
		<div class="row">
			<%
				String filename = null;
				Class.forName("com.mysql.jdbc.Driver");
				// establishing connection with databases
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
				String st = new String();
				String s = "";
				String configFile = "C:\\Users\\Abhay\\eclipse-workspace\\firstproject\\src\\config1.txt";
				try {
					File file = new File(configFile);
					BufferedReader data = new BufferedReader(new FileReader(file));
					while ((st = data.readLine()) != null) {
						s = s + st;
					}
					char x = '1';
					char a;
					int n = 0;
					boolean bol = false;
					for (int i = 0; i < s.length(); i++) {
						if (s.charAt(i) == x){
							bol = false;
							break;
						}
						else
							bol = true;
					}
					Random rand = new Random();

					for (int i = 0; i < s.length(); i++) {
						int m = rand.nextInt(5)+1;
						if (bol == true) {

							String sql = "select s.* from product p,watch s where p.pid=" + m
									+ " && p.id=s.id group by s.id having count(*)>1;";
							PreparedStatement ps = con.prepareStatement(sql);
							ResultSet rs = ps.executeQuery();
							while (rs.next()) {
								filename = rs.getString(2);
								//int id=rs.getInt(1);
								Blob blob = rs.getBlob(3);
								FileOutputStream out1 = new FileOutputStream(
										"C:\\Users\\Abhay\\eclipse-workspace\\firstproject\\WebContent\\images\\"
												+ filename);
								//	byte byteArray[] = blob.getBytes(1, (int) blob.length());
								out1.write(blob.getBytes(1, (int) blob.length()));
								out1.close();

							}
			%>
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card">
					<img
						src="C:\\Users\\Abhay\\eclipse-workspace\\firstproject\\WebContent\\images\\<%=filename%>" />
				</div>
			</div>
			<%
				} else if (s.charAt(i) == ' ' || s.charAt(i) == x) {

						} else {
							a = s.charAt(i);
							n = Character.getNumericValue(a);

							String sql = "select s.* from product p,watch s where p.pid=" + n + " && p.id=s.id ";
							PreparedStatement ps = con.prepareStatement(sql);
							ResultSet rs = ps.executeQuery();
							while (rs.next()) {
								filename = rs.getString(2);
								//int id=rs.getInt(1);
								Blob blob = rs.getBlob(3);
								FileOutputStream out1 = new FileOutputStream(
										"C:\\Users\\Abhay\\eclipse-workspace\\firstproject\\WebContent\\images\\"
												+ filename);
								//	byte byteArray[] = blob.getBytes(1, (int) blob.length());
								out1.write(blob.getBytes(1, (int) blob.length()));
								out1.close();
			%>
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card">
					<img
						src="C:\\Users\\Abhay\\eclipse-workspace\\firstproject\\WebContent\\images\\<%=filename%>" />
				</div>
			</div>
			<%
				}
							rs.close();
						}
					}

				} catch (SQLException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</div>
	</div>
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Shopping.Com 2018| All Rights
				Reserved | Contact Us: +91 69696 96969</small>
		</div>
	</div>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>