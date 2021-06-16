<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">


<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>SISVAC - HOME</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css"></link>
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet"></link>

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet"></link>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href=<c:url value="home"/>">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">Sistema De vacinação</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0" />

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="<c:url value="/home"/>"> <i
					class="fas fa-fw fa-tachometer-alt"></i> <span>HOME</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider"></hr>

			<!-- Heading -->
			<div class="sidebar-heading">Menu Principal</div>

			<li class="nav-item"><a class="nav-link" href="charts.html">
					<i class="fas fa-fw fa-chart-area"></i> <span>Vacinar</span>
			</a></li>

			<li class="nav-item"><a class="nav-link"
				href="<c:url value="home/listar"/>"> <i
					class="fas fa-fw fa-chart-area"></i> <span>Lista de
						pacientes</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider" />

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- cabeÃ§alho -->
					<div class="col-10 col-xs-8 col-sm-8 col-md-8 col-lg-9 col-xl-10">
						<h1 class="h1 mb-0 mr-3 text-gray-800 text-center">SISTEMA DE
							VACINAÇÃO CEARENSE</h1>
					</div>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav navbar-expand ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">${medicoLogado.nomeMedico}</span>
								<img class="img-profile rounded-circle"
								src="img/undraw_profile.svg" />
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Sair
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<span class="h4 mb-0 text-gray-600 text-center">BEM-VINDO
							AO SISVAC</span>
					</div>
				</div>

				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<!-- Inicio do Card -->
							<div class="card shadow mb-4 card-novaaposta mx-auto">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary text-center">Lista
										de pacientes</h6>
								</div>
								<div class="card-body">
									<div class="col-6 input-group mb-3">
										<table class="table table-hover table-bordered">
											<thead>
												<tr class="bg-primary">
													<th class="text-white" >Nome Paciente</th>
													<th class="text-white" >Idade</th>
													<th class="text-white" >Categoria</th>
													<th class="text-white" >Token</th>
													<th class="text-white" >Prioridade</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${pacienteList}" var="paciente">
													<tr>
														<td>${paciente.nome}</td>
														<td>${paciente.idade}</td>
														<td>${paciente.categoria}</td>
														<td>${paciente.token}</td>
														<td>${paciente.nivelPrioridade}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

									</div>
								</div>
							</div>

						</div>
					</div>
				</div>


			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright Paulo Lopes Corp.</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Deseja Sair?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">Ao apertar em "sair" sua sessão será
					encerrada!</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancelar</button>
					<a class="btn btn-primary" href="<c:url value="login/sair"/>">sair</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>