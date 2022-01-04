package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.CategoriaDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class CategoriaDAO {

    private static final String SQL_INSERT = "CALL insert_categoria(?, ?)";
    private static final String SQL_UPDATE = "CALL update_categoria(?, ?, ?)";
    private static final String SQL_DELETE = "CALL delete_categoria(?)";
    private static final String SQL_SELECT = "SELECT * from select_one_categoria(?)";
    private static final String SQL_SELECT_ALL = "SELECT * from select_all_categoria()";

    private Connection conexion;

    public Connection obtenerConexion() {
        String usuario = "postgres";
        String clave = "hello619";
        String url = "jdbc:postgresql://localhost:5432/Base3CM182";
        String driverPostgreSQL = "org.postgresql.Driver";
        try {
            Class.forName(driverPostgreSQL);
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return conexion;
    }

    /*
    private void obtenerConexion(){
        String usuario = "qtaiuzjdezykiz";
        String clave = "4ffd7fd0d86a1d4b5307b83df62fcfbf7626f04a61b6a53eca855c9dbb33b61e";
        String url = "jdbc:postgresql://ec2-52-0-93-3.compute-1.amazonaws.com:5432/d1d6s08hvjuiaq";
        String driverPostgreSQL = "org.postgresql.Driver";
        try {
            Class.forName(driverPostgreSQL);
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
     */
    public void create(CategoriaDTO dto) throws SQLException {
        obtenerConexion();
        CallableStatement ps = null;
        try {
            ps = conexion.prepareCall(SQL_INSERT);
            ps.setString(1, dto.getEntidad().getNombreCategoria());
            ps.setString(2, dto.getEntidad().getDescripcionCategoria());
            ps.executeUpdate();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }

    public void update(CategoriaDTO dto) throws SQLException {
        obtenerConexion();
        CallableStatement ps = null;
        try {
            ps = conexion.prepareCall(SQL_UPDATE);
            ps.setInt(1, dto.getEntidad().getIdCategoria());
            ps.setString(2, dto.getEntidad().getNombreCategoria());
            ps.setString(3, dto.getEntidad().getDescripcionCategoria());
            ps.executeUpdate();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }

    public void delete(CategoriaDTO dto) throws SQLException {
        obtenerConexion();
        CallableStatement ps = null;
        try {
            ps = conexion.prepareCall(SQL_DELETE);
            ps.setInt(1, dto.getEntidad().getIdCategoria());
            ps.executeUpdate();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }

    public CategoriaDTO read(CategoriaDTO dto) throws SQLException {
        obtenerConexion();
        CallableStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conexion.prepareCall(SQL_SELECT);
            ps.setInt(1, dto.getEntidad().getIdCategoria());
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);

            if (resultados.size() > 0) {
                return (CategoriaDTO) resultados.get(0);
            } else {
                return null;
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
    }

    public List readAll() throws SQLException {
        obtenerConexion();
        CallableStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conexion.prepareCall(SQL_SELECT_ALL);
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if (resultados.size() > 0) {
                return resultados;
            } else {
                return null;
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
    }

    private List obtenerResultados(ResultSet rs) throws SQLException {
        List resultados = new ArrayList();
        while (rs.next()) {
            CategoriaDTO dto = new CategoriaDTO();
            dto.getEntidad().setIdCategoria(rs.getInt("idCategoria"));
            dto.getEntidad().setNombreCategoria(rs.getString("nombreCategoria"));
            dto.getEntidad().setDescripcionCategoria(rs.getString("descripcionCategoria"));
            resultados.add(dto);
        }
        return resultados;
    }

    public static void main(String[] args) {
        CategoriaDTO dto = new CategoriaDTO();
        dto.getEntidad().setIdCategoria(1);
        dto.getEntidad().setNombreCategoria("c6");
        dto.getEntidad().setDescripcionCategoria("d6");
        //dto.getEntidad().setNombreCategoria("c8");
        //dto.getEntidad().setDescripcionCategoria("d8");
        //Para Update
        //dto.getEntidad().setIdCategoria(4);

        CategoriaDAO dao = new CategoriaDAO();
        try {
            //dao.create(dto);
            dao.update(dto);
            //dao.delete(dto);
            //System.out.println(dao.read(dto));
            System.out.println(dao.readAll());
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
