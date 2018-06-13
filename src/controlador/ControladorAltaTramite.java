package controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.TipoTamite;
import modelo.TpoTramiteDAO;
import modelo.Tramite;
import modelo.TramiteDAO;
import modelo.Ventanilla;
import modelo.VentanillaDAO;


/**
 * Servlet implementation class ControladorAltaTramite
 */
@WebServlet("/ControladorAltaTramite")
public class ControladorAltaTramite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorAltaTramite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		if(request.getSession(false)!= null&& request.getSession().getAttribute("tipeOfSession").equals("ABM")){
		
		String ok = request.getParameter("ok");
		if (ok != null) {
			request.setAttribute("ok", "El trámite se ha creado correctamente!");
		} else {
			request.setAttribute("ok", "");
		}
		
		
		VentanillaDAO miVDAO = new VentanillaDAO();
		List<Ventanilla> misVentanillas = miVDAO.getVentanillas();
		request.setAttribute("ventanillas", misVentanillas);
		TpoTramiteDAO miTDAO = new TpoTramiteDAO();
		List<TipoTamite> misTramites = miTDAO.getTiposDeTramite();
		request.setAttribute("tramites", misTramites);
		
		
		getServletContext().getRequestDispatcher("/WEB-INF/jsp/alta_tramite.jsp").forward(request, response);
		
		}else{
			
			response.sendRedirect("./LogInAdmin.html");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getSession(false)!= null&& request.getSession().getAttribute("tipeOfSession").equals("ABM")){
		
		String nombre = request.getParameter("Nombre");
		int ventanilla_id= Integer.parseInt(request.getParameter("Ventanilla"));
		int tipo_de_tramite = Integer.parseInt(request.getParameter("Tipo_tramite"));
		String descripcion = request.getParameter("Descripcion");
		
		TramiteDAO miTraDAO = new TramiteDAO();
		Tramite miTramite = new Tramite();
		miTramite.setNombre(nombre);
		miTramite.setId_ventanilla(ventanilla_id);
		miTramite.setId_tipoTramite(tipo_de_tramite);
		miTramite.setDescripcion(descripcion);
		miTraDAO.altaTramite(miTramite);
	
		response.sendRedirect("./ControladorAltaTramite?ok=1");}else{
			
			response.sendRedirect("./LogInAdmin.html");
			
		}
	}

}
