package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.GraficaDTO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class GraficaDAO {

    private Connection conexion;

    private static final String SQL_GRAFICAR = "SELECT C.NOMBRECATEGORIA, COUNT(P.EXISTENCIAPRODUCTO) AS CANTIDAD FROM PRODUCTO P INNER JOIN CATEGORIA C ON P.IDCATEGORIA = C.IDCATEGORIA GROUP BY P.IDCATEGORIA, C.NOMBRECATEGORIA;";

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

    public List obtenerDatosGrafica() throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List lista = new ArrayList<>();

        try {
            ps = conexion.prepareStatement(SQL_GRAFICAR);
            rs = ps.executeQuery();
            while(rs.next()){
                GraficaDTO dto = new GraficaDTO();
                dto.setNombreCategoria(rs.getString("nombreCategoria"));
                dto.setCantidad(rs.getInt("cantidad"));
                lista.add(dto);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }

        return lista;
    }

    public static void main(String[] args) {
        GraficaDAO dao = new GraficaDAO();
        try {
            System.out.println(dao.obtenerDatosGrafica());
        } catch (SQLException ex) {
            Logger.getLogger(GraficaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
