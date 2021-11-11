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
public class login {
    private String usuario,password;
    Conexion cn;

    
    public login(){}
    public login(String usuario, String password) {
        this.usuario = usuario;
        this.password = password;
    }
    
    

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public int verificar(){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "SELECT idusuarios FROM `eccomerce_empresa`.`usuarios` where usuario = ? and password = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1,getUsuario());
            parametro.setString(2,getPassword());
            ResultSet rs = parametro.executeQuery();
            while (rs.next())
            {
            retorno = 1;
            }

            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
    
}
