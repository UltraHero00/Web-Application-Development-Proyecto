package com.ipn.mx.modelo.entidades;

import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor  // Constructor
@Data   // Setters y Getters
public class Producto implements Serializable{
    private int idProducto;
    private String nombreProducto;
    private String descripcionProducto;
    private double precioProducto;
    private int existenciaProducto;
    private int idCategoria;
    
    
}
