package controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Tramite;
import modelo.TramiteDAO;
import modelo.Ventanilla;
import modelo.VentanillaDAO;

/**
 * Servlet implementation class ControladorTramitesActivos
 */
@WebServlet("/ControladorTramitesActivos")
public class ControladorTramitesActivos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorTramitesActivos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getSession(false)!= null&& request.getSession().getAttribute("tipeOfSession").equals("ABM")){
		
		TramiteDAO miTDAO = new TramiteDAO();
		List<Tramite> misTramites = miTDAO.getTramites();
		request.setAttribute("tramites", misTramites);
		
		
		getServletContext().getRequestDispatcher("/WEB-INF/jsp/tramites_activos.jsp").forward(request, response);
		
		}else{
			
			response.sendRedirect("./LogInAdmin.html");
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getSession(false)!= null&& request.getSession().getAttribute("tipeOfSession").equals("ABM")){
		
		int tramite_id = Integer.parseInt(request.getParameter("Tramite"));
		TramiteDAO miTDAO = new TramiteDAO();
		Tramite tramite = miTDAO.getTramitebyId(tramite_id);
		request.setAttribute("objTramite", tramite);
		
		VentanillaDAO miVentanilla = new VentanillaDAO();
		Ventanilla ventanilla = miVentanilla.getVentanillaFromId(tramite.getId_ventanilla());
		String nombre_ventanilla = ventanilla.getNombre();
		String horario = ventanilla.getHorario();
		request.setAttribute("nombre_ventanilla", nombre_ventanilla);
		request.setAttribute("horario", horario);

		
		
		getServletContext().getRequestDispatcher("/WEB-INF/jsp/tramite_activo_concreto.jsp").forward(request, response);}else{
			
			response.sendRedirect("./LogInAdmin.html");
			
		}
		
	}

}
