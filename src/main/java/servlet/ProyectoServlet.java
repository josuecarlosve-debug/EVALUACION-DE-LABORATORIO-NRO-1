package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import entidades.Proyecto;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProyectoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private List<Proyecto> listaProyectos = new ArrayList<Proyecto>();
	private int contadorId = 1;

	public ProyectoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("proyectos", listaProyectos);
		request.getRequestDispatcher("proyecto.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");
		String fechaInicio = request.getParameter("fechaInicio");
		String fechaFin = request.getParameter("fechaFin");
		String asesorTecnico = request.getParameter("asesorTecnico");
		String presupuesto = request.getParameter("presupuesto");

		Proyecto proyecto = new Proyecto(String.valueOf(contadorId), nombre, descripcion, fechaInicio, fechaFin,
				asesorTecnico, presupuesto);

		listaProyectos.add(proyecto);
		contadorId++;

		request.setAttribute("mensaje", "Proyecto registrado correctamente");

		request.getRequestDispatcher("proyecto.jsp").forward(request, response);
	}
}
