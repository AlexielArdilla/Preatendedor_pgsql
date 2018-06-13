package controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Administrador;
import modelo.AdministradorDAO;

/**
 * Servlet implementation class ControladorBajaAdmin
 */
@WebServlet("/ControladorBajaAdmin")
public class ControladorBajaAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorBajaAdmin() {
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
			request.setAttribute("ok", "El Admin se ha Borrado correctamente!");
		} else {
			request.setAttribute("ok", "");
		}
		
		
		AdministradorDAO miAdDAO = new AdministradorDAO();
		List<Administrador> misAdmins = miAdDAO.getAllAdmins();
		request.setAttribute("admins", misAdmins);
		
		getServletContext().getRequestDispatcher("/WEB-INF/jsp/baja_admin.jsp").forward(request, response);
		
		}else{
			
			response.sendRedirect("./LogInAdmin.html");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getSession(false)!= null&& request.getSession().getAttribute("tipeOfSession").equals("ABM")){
		
		String user = request.getParameter("user");
		String password = request.getParameter("password");
		AdministradorDAO miAdminDAO = new AdministradorDAO();
		String pass_a_MD5 = miAdminDAO.stringAMD5(password);
		Administrador elUser = miAdminDAO.validaAdmin(user, pass_a_MD5);
		
		if(elUser != null){
				
				miAdminDAO.bajaAdmin(elUser);
				
				response.sendRedirect("./ControladorBajaAdmin?ok=1");
				
				return;
			}
				
		response.sendRedirect("./ControladorBajaAdmin");}else{
			
			response.sendRedirect("./LogInAdmin.html");
			
		}
		
	}

}
