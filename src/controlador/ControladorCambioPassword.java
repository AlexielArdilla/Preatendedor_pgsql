package controlador;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Administrador;
import modelo.AdministradorDAO;

/**
 * Servlet implementation class ControladorCambioPassword
 */
@WebServlet("/ControladorCambioPassword")
public class ControladorCambioPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorCambioPassword() {
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
			request.setAttribute("ok", "El Password se ha cambiado correctamente!");
		} else {
			request.setAttribute("ok", "");
		}

		
		getServletContext().getRequestDispatcher("/WEB-INF/jsp/cambio_password.jsp").forward(request, response);
		
		}else{
			
			response.sendRedirect("./LogInAdmin.html");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		if(request.getSession(false)!= null&& request.getSession().getAttribute("tipeOfSession").equals("ABM")){
		
		String password_candidato= request.getParameter("password1");
		
		Administrador usuario = (Administrador) request.getSession().getAttribute("elUser");
		String nombre_usuario = usuario.getUser();
		AdministradorDAO miAdminDAO = new AdministradorDAO();
		
		String pass_candidato_a_MD5 = miAdminDAO.stringAMD5(password_candidato);
		
		Administrador candidato = new Administrador();
		candidato.setUser(nombre_usuario);
		candidato.setPassword(pass_candidato_a_MD5);
		Administrador elUser = miAdminDAO.validaAdmin(nombre_usuario, usuario.getPassword());
		
		if(elUser != null){
				
				miAdminDAO.modAdmin(candidato);
				
				response.sendRedirect("./ControladorCambioPassword?ok=1");
				return;
			}
			
		response.sendRedirect("./ControladorCambioPassword");}else{
			
			response.sendRedirect("./LogInAdmin.html");
			
		}
		
	}

}
