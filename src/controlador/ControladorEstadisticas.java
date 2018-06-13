package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.BitacoraDAO;

/**
 * Servlet implementation class ControladorEstadisticas
 */
@WebServlet("/ControladorEstadisticas")
public class ControladorEstadisticas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorEstadisticas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getSession(false)!= null&& request.getSession().getAttribute("tipeOfSession").equals("ABM")){
			
		BitacoraDAO miBitacoraDAO = new BitacoraDAO();
		int est_alumnos = miBitacoraDAO.getEstadisticaAlumnos();
		int est_docentes = miBitacoraDAO.getEstadisticaDocentes();
		int est_otros = miBitacoraDAO.getEstadisticaOtros();
		
		request.setAttribute("est_alumnos", est_alumnos);
		request.setAttribute("est_docentes", est_docentes);
		
		request.setAttribute("est_otros", est_otros);
		
		request.setAttribute("est_listado_labels", "[ \"Alumnos\", \"Docentes\", \"Otros\" ]");
			
		
		getServletContext().getRequestDispatcher("/WEB-INF/jsp/estadisticas.jsp").forward(request, response);
		
		}else{
			
			response.sendRedirect("./LogInAdmin.html");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
