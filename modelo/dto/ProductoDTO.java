package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.Producto;
import java.io.Serializable;
import lombok.Data;


@Data
public class ProductoDTO implements Serializable{
    private Producto entidad;
    
    public ProductoDTO(){
        entidad = new Producto();
    }
    
    @Override
    public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append("Clave Producto").append(getEntidad().getIdProducto()).append("\n");
        sb.append("Nombre Producto").append(getEntidad().getNombreProducto()).append("\n");
        sb.append("Descripción Producto").append(getEntidad().getDescripcionProducto()).append("\n");
        sb.append("Precio Producto").append(getEntidad().getPrecioProducto()).append("\n");
        sb.append("Existencia Producto").append(getEntidad().getExistenciaProducto()).append("\n");
        sb.append("Clave Categoria").append(getEntidad().getIdCategoria()).append("\n");
        
        return sb.toString();
    }
}
