package modelo;


public class Bitacora {
	
	private  String fecha;
	private String accion;
	private String tipo_persona;
	private String tipo_documento;
	private String num_documento;
	private int id_tramite;
	
	
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getAccion() {
		return accion;
	}
	public void setAccion(String accion) {
		this.accion = accion;
	}
	public String getTipo_persona() {
		return tipo_persona;
	}
	public void setTipo_persona(String tipo_persona) {
		this.tipo_persona = tipo_persona;
	}
	public String getTipo_documento() {
		return tipo_documento;
	}
	public void setTipo_documento(String tipo_documento) {
		this.tipo_documento = tipo_documento;
	}
	public String getNum_documento() {
		return num_documento;
	}
	public void setNum_documento(String num_documento) {
		this.num_documento = num_documento;
	}
	public int getId_tramite() {
		return id_tramite;
	}
	public void setId_tramite(int id_tramite) {
		this.id_tramite = id_tramite;
	}

}
