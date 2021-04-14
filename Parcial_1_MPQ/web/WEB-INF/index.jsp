<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.Tarea"%>
<%@page import="com.emergentes.modelo.GestorTareas"%>
<%
    if (session.getAttribute("agenda") == null) {
           GestorTareas objeto1 = new GestorTareas();
           
           objeto1.insertarTarea(new Tarea(1, "BRUNO DIAZ", "25", "140","Si"));
           objeto1.insertarTarea(new Tarea(2, "JUANITO PINTO", "30", "152","No"));
           
           session.setAttribute("agenda", objeto1);
        }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP-Tareas</title>
    </head>
    <body>
        <h1>Registro de vacunas </h1>
        <a href="Controller?op=nuevo">Nuevo</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Peso</th>
                <th>Talla</th>
                <th>Vacuna</th>
                
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.nombre}</td>
                    <td>${item.peso}</td>
                    <td>${item.talla}</td>
                    <td>${item.vacuna}</td>
                    <td><a href="Controller?op=modificar&id=${item.id}">Modificar</a></td>
                    <td><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a></td>
                </tr>
            </c:forEach>
        </table>
        
    </body>
</html>
