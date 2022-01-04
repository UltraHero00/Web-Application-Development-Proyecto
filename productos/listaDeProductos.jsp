<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Productos</title>
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
            <div class="card border-primary">
                <div class="card-header">
                    <h1 class="text-center">Lista de Comics</h1>
                </div>
                <div class="card-body">
                    <div class="d-flex justify-content-around">
                        <h4 class="card-tittle bd-highlight">
                            <a href="ProductoController?accion=nuevo" class="btn btn-success">Crear Comic</a>
                        </h4>
                        <h4 class="card-tittle bd-highlight">
                            <a href="ProductoController?accion=graficar" class="btn btn-warning" target="_blank">Estadisticas de Popularidad</a>
                        </h4>
                        <h4 class="card-tittle bd-highlight">
                            <a href="ProductoController?accion=verReporte" class="btn btn-danger" target="_blank">Reporte General de Comics</a>
                        </h4>
                    </div>
                </div>
            </div>

            <c:if test="${mensaje != null}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>${mensaje}</strong>
                </div>
            </c:if>

            <table class="table table-striped text-center">
                <thead>
                    <tr>
                        <th>Id Comic</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                        <th>Invetario</th>
                        <th>Id Editorial</th>
                        <th>Eliminar</th>
                        <th>Actualizar</th>
                        <th>Reporte</th>
                    </tr>
                </thead>
                <c:forEach var="dto" items="${listaDeProductos}">
                    <tbody>
                        <tr>
                            <td> 
                                <a href="ProductoController?accion=ver&id=<c:out value="${dto.entidad.idProducto}"/>" class="btn btn-outline-success">
                                    <c:out value="${dto.entidad.idProducto}"/>
                                </a>
                            </td>
                            <td> 
                                <c:out value="${dto.entidad.nombreProducto}"/>
                            </td>

                            <td> 
                                <c:out value="${dto.entidad.descripcionProducto}"/>
                            </td>

                            <td> 
                                <c:out value="${dto.entidad.precioProducto}"/>
                            </td>

                            <td> 
                                <c:out value="${dto.entidad.existenciaProducto}"/>
                            </td>

                            <td> 
                                <c:out value="${dto.entidad.idCategoria}"/>
                            </td>
                                    
                            <td> 
                                <a href="ProductoController?accion=eliminar&id=<c:out value="${dto.entidad.idProducto}"/>" class="btn btn-outline-danger">
                                    Eliminar
                                </a>
                            </td>
                            <td> 
                                <a href="ProductoController?accion=actualizar&id=<c:out value="${dto.entidad.idProducto}"/>" class="btn btn-outline-info">
                                    Actualizar
                                </a>
                            </td>
                            <td> 
                                <a href="ProductoController?accion=verReporte&v_id=<c:out value="${dto.entidad.idProducto}"></c:out>" class="btn btn-outline-warning">
                                    Reporte
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
    </body>
</html>

