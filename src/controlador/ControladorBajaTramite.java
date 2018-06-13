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

/**
 * Servlet implementation class ControladorBajaTramite
 */
@WebServlet("/ControladorBajaTramite")
public class ControladorBajaTramite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorBajaTramite() {
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
			request.setAttribute("ok", "El trámite se ha ELIMINADO correctamente!");
		} else {
			request.setAttribute("ok", "");
		}
		
		
		TramiteDAO miTDAO = new TramiteDAO();
		List<Tramite> misTramites =  miTDAO.getTramites();
		request.setAttribute("tramites", misTramites);
		
		
		getServletContext().getRequestDispatcher("/WEB-INF/jsp/baja_tramite.jsp").forward(request, response);
		
		}else{
			
			response.sendRedirect("./LogInAdmin.html");
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getSession(false)!= null&& request.getSession().getAttribute("tipeOfSession").equals("ABM")){
		
		int id_tramite = Integer.parseInt(request.getParameter("Tramite"));
		TramiteDAO miTDAO = new TramiteDAO();
		Tramite miTramite = miTDAO.getTramitebyId(id_tramite);
		miTDAO.bajaTramite(miTramite);
		
		
		response.sendRedirect("./ControladorBajaTramite?ok=1");}else{
			
			response.sendRedirect("./LogInAdmin.html");
			
		}
		
	}

}
