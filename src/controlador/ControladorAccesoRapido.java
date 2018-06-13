package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ControladorAccesoRapido
 */
@WebServlet("/ControladorAccesoRapido")
public class ControladorAccesoRapido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorAccesoRapido() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		if(request.getSession(false)!= null&& request.getSession().getAttribute("tipeOfSession").equals("ABM")){
		
		String accion = request.getParameter("accion");
		
		
		if(accion.equals("Panel de control")){
			
			response.sendRedirect("./ControladorPanelDeControl");
			
			
		}else if(accion.equals("Estadisticas")){//**************
			
			response.sendRedirect("./ControladorEstadisticas");
			
			
		}else if(accion.equals("Tramites activos")){
			
			response.sendRedirect("./ControladorTramitesActivos");
			
			
		}else if(accion.equals("Log out")){
			
			response.sendRedirect("./ControladorLogOut");
			
			
		}else if(accion.equals("Alta tramite")){
			
			response.sendRedirect("./ControladorAltaTramite");
			
			
		}else if(accion.equals("Baja tramite")){
			
			response.sendRedirect("./ControladorBajaTramite");
			
			
		}else if(accion.equals("Modificacion tramite")){
			
			response.sendRedirect("./ControladorModTramite");
			
			
		}else if(accion.equals("Preatendedor")){//************
			
			response.sendRedirect("./#");
			
		}else if(accion.equals("Alta admin")){
			
			response.sendRedirect("./ControladorAltaAdmin");
			
			
		}else if(accion.equals("Baja admin")){
			
			response.sendRedirect("./ControladorBajaAdmin");
			
			
		}else if(accion.equals("Cambio de password")){
			
			response.sendRedirect("./ControladorCambioPassword");
			
			
		}else{
			
			response.sendRedirect("./ControladorPanelDeControl");
			
		}
		
		}else{
			
			response.sendRedirect("./index.html");
			
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
