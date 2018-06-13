package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class TramiteDAO {
	
public List<Tramite> getTramites(){
		
		List<Tramite> tramites = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = MiConexion.getConnection();
			ps = con.prepareStatement(
					"select TRAMITE.ID, TRAMITE.NOMBRE, TRAMITE.DESCRIPCION, TRAMITE.ID_VENTANILLA, TRAMITE.ID_TIPO_TRAMITE from TRAMITE");//***********
			rs = ps.executeQuery();

			while (rs.next()) {

				Tramite tramite = new Tramite();
			
				tramite.setId(rs.getInt(1));
				tramite.setNombre(rs.getString(2));
				tramite.setDescripcion(rs.getString(3));
				tramite.setId_ventanilla(rs.getInt(4));
				tramite.setId_tipoTramite(rs.getInt(5));
				
				tramites.add(tramite);
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
						
		return tramites;
		
	}

public Tramite getTramitebyId(int id){
	
	Tramite tramite = new Tramite();
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try {
		con = MiConexion.getConnection();
		ps = con.prepareStatement(
				"Select TRAMITE.ID, TRAMITE.NOMBRE, TRAMITE.DESCRIPCION, TRAMITE.ID_VENTANILLA, TRAMITE.ID_TIPO_TRAMITE from TRAMITE where TRAMITE.ID = "+id);//***********
		rs = ps.executeQuery();

		while (rs.next()) {

			tramite.setId(rs.getInt(1));
			tramite.setNombre(rs.getString(2));
			tramite.setDescripcion(rs.getString(3));
			tramite.setId_ventanilla(rs.getInt(4));
			tramite.setId_tipoTramite(rs.getInt(5));
			
		
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
					
	return tramite;
	
}

public List<Tramite> getTramitesAlumno(){
	
	List<Tramite> tramites = new ArrayList<>();
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try {
		con = MiConexion.getConnection();
		ps = con.prepareStatement(
				"select TRAMITE.ID, TRAMITE.NOMBRE, TRAMITE.DESCRIPCION, TRAMITE.ID_VENTANILLA, "
				+ "TRAMITE.ID_TIPO_TRAMITE from TRAMITE "
				+ "where Tramite.ID_TIPO_TRAMITE = 1 OR Tramite.ID_TIPO_TRAMITE = 3");
		rs = ps.executeQuery();

		while (rs.next()) {

			Tramite tramite = new Tramite();
		
			tramite.setId(rs.getInt(1));
			tramite.setNombre(rs.getString(2));
			tramite.setDescripcion(rs.getString(3));
			tramite.setId_ventanilla(rs.getInt(4));
			tramite.setId_tipoTramite(rs.getInt(5));
			
			tramites.add(tramite);
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
					
	return tramites;
	
}

public List<Tramite> getTramitesNoDocente(){
	
	List<Tramite> tramites = new ArrayList<>();
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try {
		con = MiConexion.getConnection();
		ps = con.prepareStatement(
				"select TRAMITE.ID, TRAMITE.NOMBRE, TRAMITE.DESCRIPCION, TRAMITE.ID_VENTANILLA, "
				+ "TRAMITE.ID_TIPO_TRAMITE from TRAMITE "
				+ "where Tramite.ID_TIPO_TRAMITE = 4");
		rs = ps.executeQuery();

		while (rs.next()) {

			Tramite tramite = new Tramite();
		
			tramite.setId(rs.getInt(1));
			tramite.setNombre(rs.getString(2));
			tramite.setDescripcion(rs.getString(3));
			tramite.setId_ventanilla(rs.getInt(4));
			tramite.setId_tipoTramite(rs.getInt(5));
			
			tramites.add(tramite);
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
					
	return tramites;
	
}


public List<Tramite> getTramitesDocente(){
	
	List<Tramite> tramites = new ArrayList<>();
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try {
		con = MiConexion.getConnection();
		ps = con.prepareStatement(
				"select TRAMITE.ID, TRAMITE.NOMBRE, TRAMITE.DESCRIPCION, TRAMITE.ID_VENTANILLA, "
				+ "TRAMITE.ID_TIPO_TRAMITE from TRAMITE "
				+ "where Tramite.ID_TIPO_TRAMITE = 2 OR Tramite.ID_TIPO_TRAMITE = 3");
		rs = ps.executeQuery();

		while (rs.next()) {

			Tramite tramite = new Tramite();
		
			tramite.setId(rs.getInt(1));
			tramite.setNombre(rs.getString(2));
			tramite.setDescripcion(rs.getString(3));
			tramite.setId_ventanilla(rs.getInt(4));
			tramite.setId_tipoTramite(rs.getInt(5));
			
			tramites.add(tramite);
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
					
	return tramites;
	
}

public List<Tramite> getTramitesAlumnoDocente(){
	
	List<Tramite> tramites = new ArrayList<>();
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try {
		con = MiConexion.getConnection();
		ps = con.prepareStatement(
				"select TRAMITE.ID, TRAMITE.NOMBRE, TRAMITE.DESCRIPCION, TRAMITE.ID_VENTANILLA, "
				+ "TRAMITE.ID_TIPO_TRAMITE from TRAMITE "
				+ "where Tramite.ID_TIPO_TRAMITE = 3");
		rs = ps.executeQuery();

		while (rs.next()) {

			Tramite tramite = new Tramite();
		
			tramite.setId(rs.getInt(1));
			tramite.setNombre(rs.getString(2));
			tramite.setDescripcion(rs.getString(3));
			tramite.setId_ventanilla(rs.getInt(4));
			tramite.setId_tipoTramite(rs.getInt(5));
			
			tramites.add(tramite);
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
					
	return tramites;
	
}

public int altaTramite(Tramite tra){
	
	Connection con = MiConexion.getConnection();
	String sql = "INSERT INTO TRAMITE (id, nombre, descripcion, id_ventanilla, id_tipo_tramite)"
			+ " values( ?, ?, ?, ?, ?)";
	
	int r;
	
	try{
		
		String query_max_id = "select MAX (id) from tramite";
	PreparedStatement max_id = con.prepareStatement(query_max_id);
	ResultSet rss = max_id.executeQuery();

	int id_to_int = 0;

	while (rss.next()) {

		id_to_int = rss.getInt(1);

	}

	 r = 0;
	
    
    	PreparedStatement s = con.prepareStatement(sql);
        s.setInt(1, id_to_int+1);
        s.setString(2, tra.getNombre());
        s.setString(3, tra.getDescripcion());
        s.setInt(4, tra.getId_ventanilla());
        s.setInt(5, tra.getId_tipoTramite());
        
        
       ;
        
        r = s.executeUpdate();
        if(r>0){System.out.println("Create exitoso"); }
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

public int bajaTramite(Tramite tra){
	
	Connection con = MiConexion.getConnection();
	String sql = "delete from tramite where id = ?";

	int r = 0;
    try
    {
    	PreparedStatement s = con.prepareStatement(sql);
        s.setInt(1, tra.getId());
        
        
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

public int modTramite(Tramite tra){
	
	Connection cn = MiConexion.getConnection();
	
	 int r = 0;
	
	try {
		 String query = "  update TRAMITE set NOMBRE = '"+tra.getNombre()+"', "
		 		+ "descripcion = '"+tra.getDescripcion()+"', "
		 		+ "ID_VENTANILLA= "+tra.getId_ventanilla()+", ID_TIPO_TRAMITE= "+tra.getId_tipoTramite()+""
		 				+ "  where ID = "+tra.getId();
		 
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
