package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Gestion;
import modelo.Tramite;
import modelo.TramiteDAO;
import modelo.Ventanilla;
import modelo.VentanillaDAO;
import modelo.gestionDAO;

/**
 * Servlet implementation class ControladorGestion
 */
@WebServlet("/ControladorGestion")
public class ControladorGestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorGestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getSession(false)!= null&&request.getSession().getAttribute("tipeOfSession").equals("Preatendedor")){

			String tramite_id = request.getParameter("tramiteId");
			int tramite_id_a_int = Integer.parseInt(tramite_id);
			TramiteDAO miTramiteDAO = new TramiteDAO();
			Tramite tramite = miTramiteDAO.getTramitebyId(tramite_id_a_int);
			request.setAttribute("objTramite", tramite);
			
			VentanillaDAO miVentanilla = new VentanillaDAO();
			Ventanilla ventanilla = miVentanilla.getVentanillaFromId(tramite.getId_ventanilla());
			String nombre_ventanilla = ventanilla.getNombre();
			String horario = ventanilla.getHorario();
			request.setAttribute("nombre_ventanilla", nombre_ventanilla);
			request.setAttribute("horario", horario);
			//*****ahi le vuelve a pasar los params al jsp
			
			///*******aca para grabar la gestion en la BBDD
			String nom_tramite = tramite.getNombre();
			String nombre_apel = (String) request.getSession().getAttribute("usuario");
			//String volver = (String) request.getSession().getAttribute("volver");

			gestionDAO miGestionDAO = new gestionDAO();
			Gestion miGestion = new Gestion();
			miGestion.setNom_apel(nombre_apel);
			miGestion.setNom_tramite(nom_tramite);
			miGestionDAO.agregarGestion(miGestion);
			request.setAttribute("ok", "");

			getServletContext().getRequestDispatcher("/WEB-INF/jsp/tramiteTemplate.jsp").forward(request, response);

		} else {

			response.sendRedirect("./index.html");

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		
	}

}
