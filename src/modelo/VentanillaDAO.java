package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VentanillaDAO {

public List<Ventanilla> getVentanillas(){
		
		List<Ventanilla> ventanillas = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = MiConexion.getConnection();
			ps = con.prepareStatement(
					"Select VENTANILLA.ID, VENTANILLA.NOMBRE, VENTANILLA.HORARIO from VENTANILLA");
			rs = ps.executeQuery();

			while (rs.next()) {

				Ventanilla ventanilla = new Ventanilla();
			
				ventanilla.setId(rs.getInt(1));
				ventanilla.setNombre(rs.getString(2));
				ventanilla.setHorario(rs.getString(3));
				ventanillas.add(ventanilla);
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
						
		return ventanillas;
		
	}

public Ventanilla getVentanillaFromId(int id){
	
	Ventanilla ventanilla = new Ventanilla();
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try {
		con = MiConexion.getConnection();
		ps = con.prepareStatement(
				"Select VENTANILLA.ID, VENTANILLA.NOMBRE, VENTANILLA.HORARIO from VENTANILLA where VENTANILLA.id= "+ id);
		rs = ps.executeQuery();

		while (rs.next()) {

			ventanilla.setId(rs.getInt(1));
			ventanilla.setNombre(rs.getString(2));
			ventanilla.setHorario(rs.getString(3));
			
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
					
	return ventanilla;
	
}
}
