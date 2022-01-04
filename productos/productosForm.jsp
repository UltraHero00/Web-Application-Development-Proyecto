<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" charset=UTF-8">
        <title>Producto Form</title>
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
                            <a class="nav-link" href="CategoriaController?accion=listaDeCategorias">Lista de Editorial</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ProductoController?accion=listaDeProductos">Lista de Comics</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="card border-primary">
                <div class="card-header">
                    <h1> Datos del producto</h1>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${empty param.id}">
                            <form method="post" action="ProductoController?accion=guardar"  accept-charset="UTF-8">
                        </c:when>
                        <c:otherwise>
                            <form method="post" action="ProductoController?accion=guardar&v_id=<c:out value="${param.id}"/>"  accept-charset="UTF-8">
                        </c:otherwise>
                    </c:choose>
                    
                            <div class="form-group row">
                                <label class="col-form-label col-sm-2">Nombre</label>
                                <input type="text" name="txtNombreProducto" id="txtNombreProducto" maxlength="50"
                                       placeholder="Nombre del Producto" class="form-control" required="required" 
                                       value="<c:out value="${producto.entidad.nombreProducto}"/>"/>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-2">Descripción</label>
                                <input type="text" name="txtDescripcionProducto" id="txtDescripcionProducto" maxlength="100"
                                       placeholder="Descripción del Producto" class="form-control" required="required" 
                                       value="<c:out value="${producto.entidad.descripcionProducto}"/>"/>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-2">Precio</label>
                                <input type="number" step=".01" name="txtPrecioProducto" id="txtPrecioProducto" maxlength="100"
                                       placeholder="Precio del Producto" class="form-control" required="required" 
                                       value="<c:out value="${producto.entidad.precioProducto}"/>"/>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-2">Inventario</label>
                                <input type="number" name="txtExistenciaProducto" id="txtExistenciaProducto" maxlength="100"
                                       placeholder="Existencia del Producto" class="form-control" required="required" 
                                       value="<c:out value="${producto.entidad.existenciaProducto}"/>"/>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-2">Id Editorial</label>
                                <input type="text" name="txtIdCategoria" id="txtIdCategoria" maxlength="100"
                                       placeholder="ID de la Categoría" class="form-control" required="required" 
                                       value="<c:out value="${producto.entidad.idCategoria}"/>"/>
                            </div>
                            <div class="mb-3"></div>
                            <div class="form-group row">
                                <input type="submit" value="Enviar" class="btn btn-primary"/>
                            </div>
                        </form>
                </div>
            </div>
        </div>
    </body>
</html>
