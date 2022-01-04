<%-- 
    Document   : datosProducto
    Created on : 3 ene. 2022, 20:28:53
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Producto</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.html">
                    <img src="./img/miles.jpg" alt="" width="30" height="24" class="d-inline-block align-text-top">
                    Itadaima Comics
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CategoriaController?accion=listaDeCategorias">Lista de Editoriales</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ProductoController?accion=listaDeProductos">Lista de Comics</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="card bg-light">
                <div class="card-header">
                    <h3 class="card-tittle">Datos Comics</h3>
                </div>
                <div class="card-body">
                    <img src="./img/miles.jpg" alt="" width="30" height="24" class="d-inline-block align-text-top text-center">
                    <ul class="list-group">
                        <li class="list-group-item">
                        <c:out value="${producto.entidad.idProducto}"/>
                        </li>
                        <li class="list-group-item">
                        <c:out value="${producto.entidad.nombreProducto}"/>
                        </li>
                        <li class="list-group-item">
                        <c:out value="${producto.entidad.descripcionProducto}"/>
                        </li>
                        <li class="list-group-item">
                        <c:out value="${producto.entidad.precioProducto}"/>
                        </li>
                        <li class="list-group-item">
                        <c:out value="${producto.entidad.inventarioProducto}"/>
                        </li>
                        <li class="list-group-item">
                        <c:out value="${producto.entidad.descripcionProducto}"/>
                        </li>
                    </ul>
                </div>
            </div>
        </div>  
    </body>
</html>
