package com.ipn.mx.modelo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class UsuarioDAO {
    private Connection conexion;
    private static final String SQL_LOGIN = "Select * from Usuario where nombreUsuario = ? and claveUsuario = ? ";
    
    private void obtenerConexion() {
        String usuario = "postgres";
        String clave = "hello619";
        String url = "jdbc:postgresql://localhost:5432/Base3CM182";
        String driverPostgreSQL = "org.postgresql.Driver";
        try {
            Class.forName(driverPostgreSQL);
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(GraficaDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
