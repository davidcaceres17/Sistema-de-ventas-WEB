/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author justo
 */
public class compras {
    private int id,no_orden_compra,idProveedor;
    private String fecha_orden,fecha_ingreso;
    Conexion cn;
    
    public compras(){}
    public compras(int id, int no_orden_compra, int idProveedor, String fecha_orden, String fecha_ingreso) {
        this.id = id;
        this.no_orden_compra = no_orden_compra;
        this.idProveedor = idProveedor;
        this.fecha_orden = fecha_orden;
        this.fecha_ingreso = fecha_ingreso;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNo_orden_compra() {
        return no_orden_compra;
    }

    public void setNo_orden_compra(int no_orden_compra) {
        this.no_orden_compra = no_orden_compra;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getFecha_orden() {
        return fecha_orden;
    }

    public void setFecha_orden(String fecha_orden) {
        this.fecha_orden = fecha_orden;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }
    public DefaultTableModel leer2(){
 DefaultTableModel tabla = new DefaultTableModel();
 try{
     cn = new Conexion();
     cn.abrir_conexion();
      String query = "SELECT c.idCompra as id,c.no_orden_compra,p.idProveedor,p.proveedor,c.fecha_orden,c.fecha_ingreso FROM eccomerce_empresa.compras as c inner join eccomerce_empresa.proveedores as p on p.idProveedor = c.idProveedor;";
      ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
      String encabezado[] = {"id","no_orden_compra","idProveedor","proveedor","fecha_orden","fecha_ingreso"};
      tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[6];
      while (consulta.next()){
          datos[0] = consulta.getString("id");
          datos[1] = consulta.getString("no_orden_compra");
          datos[2] = consulta.getString("idProveedor");
          datos[3] = consulta.getString("proveedor");
          datos[4] = consulta.getString("fecha_orden");
          datos[5] = consulta.getString("fecha_ingreso");
          tabla.addRow(datos);
      
      }
      
     cn.cerrar_conexion();
 }catch(SQLException ex){
     System.out.println(ex.getMessage());
 }
 return tabla;
 }
    
public DefaultTableModel leer(int dato){
 DefaultTableModel tabla = new DefaultTableModel();
 try{
     cn = new Conexion();
     cn.abrir_conexion();
      String query = "SELECT c.idCompra as id,c.no_orden_compra,p.idProveedor,p.proveedor,c.fecha_orden,c.fecha_ingreso FROM eccomerce_empresa.compras as c inner join eccomerce_empresa.proveedores as p on p.idProveedor = c.idProveedor where no_orden_compra = "+dato+";";
      ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
      String encabezado[] = {"id","no_orden_compra","idProveedor","proveedor","fecha_orden","fecha_ingreso"};
      tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[6];
      while (consulta.next()){
          datos[0] = consulta.getString("id");
          datos[1] = consulta.getString("no_orden_compra");
          datos[2] = consulta.getString("idProveedor");
          datos[3] = consulta.getString("proveedor");
          datos[4] = consulta.getString("fecha_orden");
          datos[5] = consulta.getString("fecha_ingreso");
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
            String query = "INSERT INTO `eccomerce_empresa`.`compras` (`no_orden_compra` , `idProveedor` , `fecha_orden` , `fecha_ingreso`) VALUES (?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1,getNo_orden_compra());
            parametro.setInt(2,getIdProveedor());
            parametro.setString(3,getFecha_orden());
            parametro.setString(4,getFecha_ingreso());
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
            String query = "UPDATE `eccomerce_empresa`.`compras` SET `idProveedor` = ?, `fecha_ingreso` = ? WHERE (`idCompra` = ?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1,getIdProveedor());
            parametro.setString(2,getFecha_ingreso());
            parametro.setInt(3,getId());
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
            String query = "delete from compras  where idCompra = ?;";
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
