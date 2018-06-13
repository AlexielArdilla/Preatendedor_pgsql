package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.security.*;
import java.math.BigInteger;

public class AdministradorDAO {
	
	
	public int altaAdmin(Administrador admin){

		Connection con = MiConexion.getConnection();
		String sql = "insert into Administradores values( ?,?)";
		
		int r;
		
		 r = 0;
		
	    
		try {
			PreparedStatement s = con.prepareStatement(sql);
			//String pass = stringAMD5(admin.getPassword());
			s.setString(1, admin.getUser());
			s.setString(2, admin.getPassword());

			r = s.executeUpdate();

			if (r > 0) {
				System.out.println("Create exitoso");
			}

		} catch (Exception e)

		{
			 r = 0;
	        e.printStackTrace();
	        System.out.println("Algo ha fallado");
	    } finally {
	    	try {
				con.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			System.out.println("Algo ha fallado");
			}
	    }
	    return r;
		
	}
	
	public int bajaAdmin(Administrador admin){
		
		Connection con = MiConexion.getConnection();
		String sql = "delete from Administradores where usuario = ?";

		int r = 0;
	    try
	    {
	    	PreparedStatement s = con.prepareStatement(sql);
	        s.setString(1, admin.getUser());
	        
	        r = s.executeUpdate();
	    } catch (Exception e)
	    {
	    	r = 0;
	        e.printStackTrace();
	        System.out.println("Algo ha fallado");
	    } finally {
	    	try {
				con.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
	    }
	    return r;
	}
	
	public Administrador validaAdmin(String usr, String password){


		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = MiConexion.getConnection();
			ps = con.prepareStatement(
					"  select usuario, password from Administradores where usuario = ?");//***********
			ps.setString(1, usr);
			rs = ps.executeQuery();

			Administrador miAdmin;
			
			if (rs.next()) {
				
				
				
					if (rs.getString(2).equals(password)) {
					
					    miAdmin = new Administrador();
					
						miAdmin.setUser(rs.getString(1));
						miAdmin.setPassword(rs.getString(2));
						
						return miAdmin;
						
					} else {
						
						return null;
						
					}
				
			}
			
		} catch (SQLException e) {		
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}										
		}
		
		return null;
	}
	
	public String stringAMD5(String password){
		
		String hashtext = null;
		
		try {
			MessageDigest m = MessageDigest.getInstance("MD5");
			m.reset();
			m.update(password.getBytes());
			byte[] digest = m.digest();
			BigInteger bigInt = new BigInteger(1,digest);
			hashtext = bigInt.toString(16);
			// Now we need to zero pad it if you actually want the full 32 chars.
			while(hashtext.length() < 32 ){
			  hashtext = "0"+hashtext;
			}
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return hashtext;
	}
	
	public List<Administrador> getAllAdmins(){


		List<Administrador> admins = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = MiConexion.getConnection();
			ps = con.prepareStatement(
					"  select usuario, password from Administradores");//***********
			rs = ps.executeQuery();

			Administrador miAdmin;
			
			while (rs.next()) {

			    miAdmin = new Administrador();
			
				miAdmin.setUser(rs.getString(1));
				miAdmin.setPassword(rs.getString(2));
				
				
				admins.add(miAdmin);
			}
			
		} catch (SQLException e) {		
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}										
		}
						
		return admins;
	}
	
	public int modAdmin(Administrador admin){
		
		Connection cn = MiConexion.getConnection();
		
		 int r = 0;
		
		try {
			 String query = "update Administradores set password = '"+admin.getPassword()+"' where usuario = '"+admin.getUser()+"'";
			 
			 PreparedStatement p = cn.prepareStatement(query);

			  r=p.executeUpdate();
			  
			  if(r>0){ System.out.println("update exitoso");
			  
				  
			  }
			  cn.close();
			 } catch (SQLException e) {

				 System.out.println("Algo ha fallado!!!");
			
				 
				e.printStackTrace();
			}finally{
				
				try{
					
					cn.close();
					
				}catch(SQLException e){
					
					e.printStackTrace();
					
				}
				
			}
		
		return r;
		
	}
	
}
