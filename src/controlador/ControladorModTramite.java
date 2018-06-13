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
 * Servlet implementation class ControladorModTramite
 */
@WebServlet("/ControladorModTramite")
public class ControladorModTramite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorModTramite() {
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
			request.setAttribute("ok", "El trámite se ha actualizado correctamente!");
		} else {
			request.setAttribute("ok", "");
		}
		
		
		TramiteDAO miTDAO = new TramiteDAO();
		List<Tramite> misTramites = miTDAO.getTramites();
		request.setAttribute("tramites", misTramites);
		
		VentanillaDAO miVDAO = new VentanillaDAO();
		List<Ventanilla> misVentanillas = miVDAO.getVentanillas();
		request.setAttribute("ventanillas", misVentanillas);
		
		TpoTramiteDAO miTipoTDAO = new TpoTramiteDAO();
		List<TipoTamite> misTiposTramite = miTipoTDAO.getTiposDeTramite();
		request.setAttribute("tipo_tramites", misTiposTramite);
		
		
		getServletContext().getRequestDispatcher("/WEB-INF/jsp/mod_tramite.jsp").forward(request, response);
		
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
		int ventanilla_id = Integer.parseInt(request.getParameter("Ventanilla"));
		int tipo_tramite_id = Integer.parseInt(request.getParameter("Tipo_tramite"));
		String descripcion = request.getParameter("Descripcion");
		TramiteDAO miTramiteDAO = new TramiteDAO();
		String nombre = miTramiteDAO.getTramitebyId(tramite_id).getNombre();
		
		Tramite miTramite = new Tramite();
		miTramite.setId(tramite_id);
		miTramite.setDescripcion(descripcion);
		miTramite.setId_tipoTramite(tipo_tramite_id);
		miTramite.setId_ventanilla(ventanilla_id);
		miTramite.setNombre(nombre);
		miTramiteDAO.modTramite(miTramite);
		
		response.sendRedirect("./ControladorModTramite?ok=1");}else{
			
			response.sendRedirect("./LogInAdmin.html");
			
		}
		
	}

}
