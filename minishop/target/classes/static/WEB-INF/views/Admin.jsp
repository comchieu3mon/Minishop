<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admin</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href='<c:url value="/resources/assets/css/cs-skin-elastic.css"></c:url>'>
<link rel="stylesheet"
	href='<c:url value="/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css"></c:url>'>
<link rel="stylesheet"
	href='<c:url value="/resources/assets/css/style.css"></c:url>'>

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<jsp:include page="Header.jsp"></jsp:include>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>

<body>
	<!-- Left Panel -->

	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">

			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="index.html"><i class="menu-icon fa fa-laptop"></i>Dashboard
					</a></li>

					<li class="menu-item-has-children active dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="menu-icon fa fa-table"></i>Tables
					</a>
						<ul class="sub-menu children dropdown-menu">
							<li><i class="fa fa-table"></i><a href="./products/1/">Products
							</a></li>
							<li><i class="fa fa-table"></i><a href="tables-data.html">Data
									Table</a></li>
						</ul></li>
					<li><a href="./add/product/"><i class="menu-icon fa fa-laptop"></i>Add Product
					</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>
	</aside>
	<!-- /#left-panel -->

	<!-- Left Panel -->

	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<!-- Header-->
		<header id="header" class="header">
			<div class="top-left">
				<div class="navbar-header">
					<a class="navbar-brand" href="./"><img
						src='<c:url value="/resources/Images/logo.png"></c:url>'
						alt="Logo"></a> <a class="navbar-brand hidden" href="./"><img
						src='<c:url value="/resources/Images/logo2.png"></c:url>'
						alt="Logo"></a> <a id="menuToggle" class="menutoggle"><i
						class="fa fa-bars"></i></a>
				</div>
			</div>
			<div class="top-right">
				<div class="header-menu">
					<div class="header-left">
						<button class="search-trigger">
							<i class="fa fa-search"></i>
						</button>
						<div class="form-inline">
							<form class="search-form">
								<input class="form-control mr-sm-2" type="text"
									placeholder="Search ..." aria-label="Search">
								<button class="search-close" type="submit">
									<i class="fa fa-close"></i>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- /header -->
		<!-- Header-->

		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="col-sm-4">
						<div class="page-header float-left">
							<div class="page-title">
								<h1>Dashboard</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="#">Dashboard</a></li>
									<li><a href="#">Table</a></li>
									<li class="active">Data table</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="content">
			<div class="animated fadeIn">
				<div class="row">

					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">Data Table</strong>
							</div>
							<div class="card-body">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>ID</th>
											<th>Name</th>
											<th>Number Of Products</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="category" items="${ categoryList }">
											<tr>
												<td>${ category.getCategory_id() }</td>
												<td>${ category.getCategory_name() }</td>
												<td>${ category.getTotalProduct() }</td>
												<td>
													<button class="btn btn-danger">
														<i class="fa fa-minus"></i>
													</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>


				</div>
			</div>
			<!-- .animated -->
		</div>
		<!-- .content -->


		<div class="clearfix"></div>

		<footer class="site-footer">
			<div class="footer-inner bg-white">
				<div class="row">
					<div class="col-sm-6">Copyright &copy; 2018 Ela Admin</div>
					<div class="col-sm-6 text-right">
						Designed by <a href="https://colorlib.com">Colorlib</a>
					</div>
				</div>
			</div>
		</footer>

	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src='<c:url value="/resources/assets/js/main.js"></c:url>'></script>

	<script
		src='<c:url value="/resources/assets/js/lib/data-table/datatables.min.js"></c:url>'></script>
	<script
		src='<c:url value="/resources/assets/js/lib/data-table/dataTables.bootstrap.min.js"></c:url>'></script>
	<script
		src='<c:url value="/resources/assets/js/lib/data-table/dataTables.buttons.min.js"></c:url>'></script>
	<script
		src='<c:url value="/resources/assets/js/lib/data-table/buttons.bootstrap.min.js"></c:url>'></script>
	<script
		src='<c:url value="/resources/assets/js/lib/data-table/jszip.min.js"></c:url>'></script>
	<script
		src='<c:url value="/resources/assets/js/lib/data-table/vfs_fonts.js"></c:url>'></script>
	<script
		src='<c:url value="/resources/assets/js/lib/data-table/buttons.html5.min.js"></c:url>'></script>
	<script
		src='<c:url value="/resources/assets/js/lib/data-table/buttons.print.min.js"></c:url>'></script>
	<script
		src='<c:url value="/resources/assets/js/lib/data-table/buttons.colVis.min.js"></c:url>'></script>
	<script
		src='<c:url value="/resources/assets/js/init/datatables-init.js"></c:url>'></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#bootstrap-data-table-export').DataTable();
		});
	</script>


</body>

</html>