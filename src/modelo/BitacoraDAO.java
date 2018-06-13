package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;





public class BitacoraDAO {
	
	public int agregarBitacora(Bitacora bi){
		
		Connection con = MiConexion.getConnection();
		String sql = "insert into bitacora values(now(),'"+bi.getAccion()+"','"+bi.getTipo_persona()+"',"
				+ "'"+bi.getTipo_documento()+"','"+bi.getNum_documento()+"',"+bi.getId_tramite()+")";
		
		int r;
		
		 r = 0;
		 try{
	    
	    	PreparedStatement s = con.prepareStatement(sql);
	       
	       ;
	        
	        r = s.executeUpdate();
	        if(r>0){System.out.println("Create exitoso"); }
	   
	    
	    
	    }catch(Exception e){
	    	
	    	e.printStackTrace();
	    	System.out.println("Algo ha fallado");
	    	
	    }finally{
	    	
	    	try {
				
	    		con.close();
			
	    	} catch (SQLException e) {
				
				e.printStackTrace();
				
				System.out.println("Algo ha fallado");
			}
	    	
	    }
		 
		 
	    return r;
		
	}
	
	public String getFechaParaBitacora(){//**************************************************
		
		
		Calendar calendario = Calendar.getInstance();
		//String fecha = ""+ calendario.getTime();
		String anio = ""+ calendario.get(Calendar.YEAR);
		int mes_int = calendario.get(Calendar.MONTH) + 1;
		String mes =""+mes_int; 
		String dia =""+ calendario.get(Calendar.DATE);
		String hora =""+ calendario.get(Calendar.HOUR_OF_DAY);
		String minutos =""+ calendario.get(Calendar.MINUTE);
		String segundos =""+ calendario.get(Calendar.SECOND);
		String milisec =""+ calendario.get(Calendar.MILLISECOND);
		
		String fecha_formateada = anio+"-"+mes+"-"+dia+" "+hora+":"+minutos+":"+segundos+"."+milisec;
		
		return fecha_formateada;
	}//****************************************************************************************
	
	public int getEstadisticaAlumnos() {
		
		int alumnos = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = MiConexion.getConnection();
			ps = con.prepareStatement(
					"select COUNT (tipo_persona)as alumno" 
			+ " from bitacora where tipo_persona = 'alumno' ");// ***********
			rs = ps.executeQuery();

			while (rs.next()) {

				alumnos = rs.getInt(1);
			
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
						
		return alumnos;
	}

	public int getEstadisticaDocentes() {

		int docentes = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = MiConexion.getConnection();
			ps = con.prepareStatement(
					"select COUNT (tipo_persona)as docente from bitacora "
					+ "where tipo_persona = 'docente' ");// ***********
			rs = ps.executeQuery();

			while (rs.next()) {

				docentes = rs.getInt(1);
			
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
						
		return docentes;
		
	}

	public int getEstadisticaNoDocentes() {

		int alumnos_docentes = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = MiConexion.getConnection();
			ps = con.prepareStatement(
					"select COUNT (tipo_persona)as no_docente from bitacora "
					+ "where tipo_persona = 'NO-DOCENTE' ");// ***********
			rs = ps.executeQuery();

			while (rs.next()) {

				alumnos_docentes = rs.getInt(1);
			
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
						
		return alumnos_docentes;
	}

	public int getEstadisticaOtros() {
		
		int otros = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = MiConexion.getConnection();
			ps = con.prepareStatement(
					"select COUNT (tipo_persona)as otro from bitacora "
					+ "where tipo_persona = 'OTRO' ");// ***********
			rs = ps.executeQuery();

			while (rs.next()) {

				otros = rs.getInt(1);
			
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
						
		return otros;
	}
	
}
