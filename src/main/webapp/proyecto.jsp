<%@page import="entidades.Proyecto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Proyectos de Inversion Publica</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<div class="container-fluid mt-4">
		<div class="row">

			<!-- FORMULARIO -->
			<div class="col-md-5">
				<h4 class="mb-3">Registrar Proyecto</h4>

				<%
				String mensaje = (String) request.getAttribute("mensaje");

				if (mensaje != null) {
				%>
				<div class="alert alert-success">
					<%=mensaje%>
				</div>
				<%
				}
				%>

				<form method="post" action="ProyectoServlet">

					<div class="mb-3">
						<label class="form-label">Nombre del Proyecto</label> <input
							name="nombre" type="text" class="form-control" minlength="4"
							maxlength="60" required>
					</div>

					<div class="mb-3">
						<label class="form-label"> Descripcion tecnica del
							Proyecto (Opcional) </label>
						<textarea name="descripcion" class="form-control" rows="3"></textarea>
					</div>

					<div class="mb-3">
						<label class="form-label">Fecha de inicio del Proyecto</label> <input
							name="fechaInicio" type="date" class="form-control" required>
					</div>

					<div class="mb-3">
						<label class="form-label">Fecha de culminacion del
							Proyecto</label> <input name="fechaFin" type="date" class="form-control"
							required>
					</div>

					<div class="mb-3">
						<label class="form-label"> Asesor Tecnico del Proyecto
							(Nombres y Apellidos) </label> <input name="asesorTecnico" type="text"
							class="form-control" required>
					</div>

					<div class="mb-3">
						<label class="form-label">Presupuesto Asignado</label> <input
							name="presupuesto" type="number" class="form-control" min="0.01"
							step="0.01" required>
					</div>

					<button type="submit" class="btn btn-primary">Registrar</button>

					<a href="ProyectoServlet" class="btn btn-warning"> Listar </a>

				</form>
			</div>

			<!-- TABLA DE PROYECTOS -->
			<div class="col-md-7">
				<h4 class="mb-3">Proyectos Disponibles</h4>

				<table class="table table-bordered table-striped table-sm">
					<thead class="table-light">
						<tr>
							<th>Id</th>
							<th>Nombre del Proyecto</th>
							<th>Inicio</th>
							<th>Fin</th>
							<th>Asesor Tecnico</th>
							<th>Presupuesto</th>
						</tr>
					</thead>

					<tbody>
						<%
						List<Proyecto> lista = (List<Proyecto>) request.getAttribute("proyectos");

						if (lista != null && !lista.isEmpty()) {
							for (Proyecto p : lista) {
						%>
						<tr>
							<td><%=p.getId()%></td>
							<td><%=p.getNombre()%></td>
							<td><%=p.getFechaInicio()%></td>
							<td><%=p.getFechaFin()%></td>
							<td><%=p.getAsesorTecnico()%></td>
							<td>S/ <%=String.format(java.util.Locale.US, "%,.2f", Double.parseDouble(p.getPresupuesto()))%></td>
						</tr>
						<%
						}
						}
						%>
					</tbody>
				</table>
			</div>

		</div>
	</div>

</body>
</html>
