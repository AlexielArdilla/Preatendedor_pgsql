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
 * Servlet implementation class ControladorAltaAdmin
 */
@WebServlet("/ControladorAltaAdmin")
public class ControladorAltaAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorAltaAdmin() {
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
			request.setAttribute("ok", "El Admin se ha creado correctamente!");
		} else {
			request.setAttribute("ok", "");
		}
		
		getServletContext().getRequestDispatcher("/WEB-INF/jsp/alta_admin.jsp").forward(request, response);
		
		}else{
			
			response.sendRedirect("./LogInAdmin.html");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getSession(false)!= null&& request.getSession().getAttribute("tipeOfSession").equals("ABM")){
		
		AdministradorDAO miAdminDAO = new AdministradorDAO();
		String user = request.getParameter("Nombre");
		String password = request.getParameter("password1");
		String pass_a_MD5 = miAdminDAO.stringAMD5(password);
		Administrador miAdmin = new Administrador();
		miAdmin.setUser(user);
		miAdmin.setPassword(pass_a_MD5);
		miAdminDAO.altaAdmin(miAdmin);
		
		response.sendRedirect("./ControladorAltaAdmin?ok=1");}else{
			
			response.sendRedirect("./LogInAdmin.html");
			
		}
		
	}

}
