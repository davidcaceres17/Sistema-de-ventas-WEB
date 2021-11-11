/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import modelo.Producto;
import modelo.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author justo
 */
public class ProductoDAO {
    Connection con;
    Conexion cn;
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;

    public HashMap drop_sangre(){
    HashMap<String,String> drop = new HashMap();
    try{
        String query ="Select idProducto as id,producto from eccomerce_empresa.productos;";
         cn = new Conexion();
         cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()){
            drop.put(consulta.getString("id"),consulta.getString("producto") );
            }
         cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
    }
    return drop;
    }
    
    public int agregar(Producto p) {
        Conexion cn = new Conexion();
        String sql = "INSERT INTO `eccomerce_empresa`.`productos` (`producto`,`idMarca`,`decripcion`,`imagen`,`precio_costo`,`precio_venta`,`existencia`,`fecha_ingreso`) VALUES (?,?,?,?,?,?,?,?);";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getProducto());
            ps.setInt(2, p.getIdMarca());
            ps.setString(3, p.getDescripcion());
            ps.setString(4, p.getRuta());
            ps.setInt(5, p.getPrecio_costo());
            ps.setInt(6, p.getPrecio_venta());
            ps.setInt(7, p.getExistencia());
            ps.setString(8, p.getFecha_ingreso());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }

    public List<Producto> listar() {
        Conexion cn = new Conexion();
        String sql = "select * from producto";
        List<Producto>lista=new ArrayList<>();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                Producto p=new Producto();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setRuta(rs.getString(3));
                lista.add(p);
            }
        } catch (Exception e) {
        }
        return lista;
    }
    
 public DefaultTableModel leer(){
 DefaultTableModel tabla = new DefaultTableModel();
 try{
     cn = new Conexion();
     cn.abrir_conexion();
      String query = "SELECT p.idProducto as id , p.producto , m.marca , m.idMarca , p.decripcion , p.imagen , p.precio_costo , p.precio_venta , p.existencia , p.fecha_ingreso FROM eccomerce_empresa.productos as p inner join eccomerce_empresa.marcas as m on p.idMarca = m.idMarca;";
      ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
      String encabezado[] = {"id","producto","marca","idMarca","descripcion","imagen","precio_costo","precio_venta","existencia","fecha_ingreso"};
      tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[10];
      while (consulta.next()){
          datos[0] = consulta.getString("id");
          datos[1] = consulta.getString("producto");
          datos[2] = consulta.getString("marca");
          datos[3] = consulta.getString("idMarca");
          datos[4] = consulta.getString("decripcion");
          datos[5] = consulta.getString("imagen");
          datos[6] = consulta.getString("precio_costo");
          datos[7] = consulta.getString("precio_venta");
          datos[8] = consulta.getString("existencia");
          datos[9] = consulta.getString("fecha_ingreso");
          tabla.addRow(datos);
      
      }
      
     cn.cerrar_conexion();
 }catch(SQLException ex){
     System.out.println(ex.getMessage());
 }
 return tabla;
 }
 
 public DefaultTableModel estadistica(){
 DefaultTableModel tabla = new DefaultTableModel();
 try{
     cn = new Conexion();
     cn.abrir_conexion();
      String query = "SELECT COUNT(producto) FROM `eccomerce_empresa`.`productos`;";
      ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
      String encabezado[] = {"COUNT(producto)"};
      tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[2];
      while (consulta.next()){
          datos[0] = consulta.getString("COUNT(producto)");
          tabla.addRow(datos);
      }
      
     cn.cerrar_conexion();
 }catch(SQLException ex){
     System.out.println(ex.getMessage());
 }
 return tabla;
 }
}
