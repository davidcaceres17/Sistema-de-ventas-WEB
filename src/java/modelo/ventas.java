/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author justo
 */
public class ventas {
    private int id,no_factura,idcliente,idempleado;
    private String serie,fecha_factura,fechaingreso;
    Conexion cn;
    
    public ventas(){}

    public ventas(int id, int no_factura, int idcliente, int idempleado, String serie, String fecha_factura, String fechaingreso) {
        this.id = id;
        this.no_factura = no_factura;
        this.idcliente = idcliente;
        this.idempleado = idempleado;
        this.serie = serie;
        this.fecha_factura = fecha_factura;
        this.fechaingreso = fechaingreso;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNo_factura() {
        return no_factura;
    }

    public void setNo_factura(int no_factura) {
        this.no_factura = no_factura;
    }

    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }

    public int getIdempleado() {
        return idempleado;
    }

    public void setIdempleado(int idempleado) {
        this.idempleado = idempleado;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public String getFecha_factura() {
        return fecha_factura;
    }

    public void setFecha_factura(String fecha_factura) {
        this.fecha_factura = fecha_factura;
    }

    public String getFechaingreso() {
        return fechaingreso;
    }

    public void setFechaingreso(String fechaingreso) {
        this.fechaingreso = fechaingreso;
    }
    
public DefaultTableModel leer(int dato){
 DefaultTableModel tabla = new DefaultTableModel();
 try{
     cn = new Conexion();
     cn.abrir_conexion();
      String query = "SELECT v.idVenta as id,v.no_factura,v.serie,c.nombres,c.idCliente,e.nombres as nombre,e.idEmpleado,v.fechaingreso FROM eccomerce_empresa.ventas as v inner join eccomerce_empresa.clientes as c on c.idCliente = v.idCliente inner join eccomerce_empresa.empleados as e on e.idEmpleado = v.idEmpleado where no_factura = "+dato+";";
      ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
      String encabezado[] = {"id","no_factura","serie","nombres","idCliente","nombre","idEmpleado","fechaingreso"};
      tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[8];
      while (consulta.next()){
          datos[0] = consulta.getString("id");
          datos[1] = consulta.getString("no_factura");
          datos[2] = consulta.getString("serie");
          datos[3] = consulta.getString("nombres");
          datos[4] = consulta.getString("idCliente");
          datos[5] = consulta.getString("nombre");
          datos[6] = consulta.getString("idEmpleado");
          datos[7] = consulta.getString("fechaingreso");
          tabla.addRow(datos);
      
      }
      
     cn.cerrar_conexion();
 }catch(SQLException ex){
     System.out.println(ex.getMessage());
 }
 return tabla;
 }

public DefaultTableModel leer2(){
 DefaultTableModel tabla = new DefaultTableModel();
 try{
     cn = new Conexion();
     cn.abrir_conexion();
      String query = "SELECT v.idVenta as id,v.no_factura,v.serie,c.nombres,c.idCliente,e.nombres as nombre,e.idEmpleado,v.fechaingreso FROM eccomerce_empresa.ventas as v inner join eccomerce_empresa.clientes as c on c.idCliente = v.idCliente inner join eccomerce_empresa.empleados as e on e.idEmpleado = v.idEmpleado;";
      ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
      String encabezado[] = {"id","no_factura","serie","nombres","idCliente","nombre","idEmpleado","fechaingreso"};
      tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[8];
      while (consulta.next()){
          datos[0] = consulta.getString("id");
          datos[1] = consulta.getString("no_factura");
          datos[2] = consulta.getString("serie");
          datos[3] = consulta.getString("nombres");
          datos[4] = consulta.getString("idCliente");
          datos[5] = consulta.getString("nombre");
          datos[6] = consulta.getString("idEmpleado");
          datos[7] = consulta.getString("fechaingreso");
          tabla.addRow(datos);
      
      }
      
     cn.cerrar_conexion();
 }catch(SQLException ex){
     System.out.println(ex.getMessage());
 }
 return tabla;
 }
    
    public int agregar(){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "INSERT INTO `eccomerce_empresa`.`ventas` (`no_factura` , `serie` , `fecha_factura` , `idCliente`, `idEmpleado`, `fechaingreso`) VALUES (?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1,getNo_factura());
            parametro.setString(2,getSerie());
            parametro.setString(3,getFecha_factura());
            parametro.setInt(4,getIdcliente());
            parametro.setInt(5,getIdempleado());
            parametro.setString(6,getFechaingreso());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
    
  
    public int modificar (){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "UPDATE `eccomerce_empresa`.`ventas` SET `no_factura` = ?, `serie` = ?, `idCliente` = ?, `idEmpleado` = ?, `fechaingreso` = ? WHERE (`idVenta` = ?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1,getNo_factura());
            parametro.setString(2,getSerie());
            parametro.setInt(3,getIdcliente());
            parametro.setInt(4,getIdempleado());
            parametro.setString(5,getFechaingreso());
            parametro.setInt(6,getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
   
   
   public int eliminar (){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "delete from ventas  where idVenta = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
}
