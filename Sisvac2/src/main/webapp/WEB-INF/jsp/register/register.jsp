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
<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>SISVAC - REGISTRO</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary2">

	<div class="container2 justify-content-center">

		<div class="card w-50 o-hidden border-0 shadow-lg my-5">
			<div class="card-body">
				<a href="<c:url value="/"/>">Voltar</a>
				<!-- Nested Row within Card Body -->

				<div class="p-5">
					<div class="col text-center">
						<h1 class="h4 text-gray-900 mb-4">Cadastre-se para se
							vacinar!</h1>
					</div>

					<c:if test="${not empty errors}">
						<div class="alert alert-danger" role="alert">
							<c:forEach var="error" items="${errors}">
								${error.message}<br />
							</c:forEach>
						</div>
					</c:if>

					<form method="post" class="paciente"
						action="<c:url value="register/salvapaciente"/>">
						<div class="form-group row justify-content-center">
							<div class="col-xl-10 mb-3 mb-sm-0">
								 <label for="exampleInputEmail1">Digite seu nome: </label>
								<input name="paciente.nome" type="text"
									class="form-control form-control-user" id="exampleFirstName"
									placeholder="Digite seu nome completo....">
							
							</div>
						</div>

						<div class="form-group row justify-content-center">
							<div class="col-xl-10 mb-3 mb-sm-0">
								 <label for="exampleInputEmail1">Digite seu e-mail: </label>
							<input name="paciente.email" type="text"
								class="form-control form-control-user" id="exampleInputEmail"
								placeholder="Email Address">
							</div>
						</div>
						
						<div class="container row justify-content-center text-center">
							<div class="form-group col-xl-5 mb-3 mb-sm-0">
								<label for="example-date-input" class="col">Data de nascimento:</label>
								<input name="paciente.dataNascimento" type="date" class="form-control" id="example-date-input">
							</div>
							<div class="fomr-group col mb-3 mb-sm-0">
								<label for="deficiente" class="control-label">Portador de deficiência?</label>
								<span class="input-group-addon"> <label
											class="radio-inline" for="radios-0"> <input
												name="paciente.deficiencia" type="radio" id="deficiente"
												value="Nao" onloadstart onclick="ocultar('tipo_deficiente')"
												checked> Não
										</label> <label class="radio-inline" for="radios-1"> <input
												name="paciente.deficiencia" type="radio" name="deficiente"
												id="deficiente" value="Sim"
												onclick="exibir('tipo_deficiente')"> Sim
										</label>
										</span>
										<div class="col-xl-10">
											<input name="paciente.tipoDeficiencia" id="tipo_deficiente"
												class="form-control form-control-user" type="text"
												placeholder="Digite sua deficência">
										</div>
									
							</div>
						</div>	
					<script type="text/javascript">

                                    var x = document.getElementById("tipo_deficiente").style.display = "none";

                                    function exibir() {
                                        document.getElementById("tipo_deficiente").style.display = "block";
                                    }

                                    function ocultar() {
                                        document.getElementById("tipo_deficiente").style.display = "none";
                                    }
                                    
                     </script>
						<hr class="sidebar-divider">
						<div class="row justify-content-center">
							<button type="submit" class="col-xl-4 btn btn-primary btn-user">
								Registrar cadastro!</button>
						</div>

					</form>
					<hr>
					
						<span class="badge badge-success">${vmessages.success.from('paciente.token')}</span>
					
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

</body>

</html>