package controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Administrador;
import modelo.AdministradorDAO;

/**
 * Servlet implementation class ControladorLoginAdmin
 */
@WebServlet("/ControladorLoginAdmin")
public class ControladorLoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorLoginAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getSession(false)!= null&& request.getSession().getAttribute("tipeOfSession").equals("ABM")){
		
		getServletContext().getRequestDispatcher("/WEB-INF/jsp/panel_de_control.jsp").forward(request, response);
		
		}else{
			
			response.sendRedirect("./LogInAdmin.html");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String user = request.getParameter("user");
			String password= request.getParameter("password");
			
			AdministradorDAO miAdminDAO = new AdministradorDAO();
			String pass_a_MD5 = miAdminDAO.stringAMD5(password);//***************************************
			Administrador elUser = miAdminDAO.validaAdmin(user, pass_a_MD5);
			
			
			if(elUser != null){
					
					HttpSession session = request.getSession();
					   session.setMaxInactiveInterval(20*60);
					   request.getSession().setAttribute("elUser", elUser);
					   request.getSession().setAttribute("tipeOfSession", "ABM");
					
				getServletContext().getRequestDispatcher("/WEB-INF/jsp/panel_de_control.jsp").forward(request, response);
				return;	
				
			}
				
			response.sendRedirect("./LogInAdmin.html");
		} catch (Exception e) {
			
			e.printStackTrace();
			
			response.sendRedirect("./LogInAdmin.html");
		}
		
		
	
	}//*****************************

}
