<%-- 
    Document   : listar
    Created on : 05-mar-2021, 20:53:28
    Author     : DAW-A
--%>

<%@page import="java.util.List"%>
<%@page import="Modelo.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <h1>Listado de Productos</h1>
        <% 
            List<Productos> misProductos = (List<Productos>) request.getAttribute("misProductos");
        %>
        <table border="1">
            <tr>
                <th>id</th>
                <th>Nombre</th>
                <th>Imagen</th>
                <th>Categoria</th>
                <th>Precio</th>
                <th>Borrar</th>
            </tr>
            <% for (Productos p: misProductos){ 
                String cadenaBorrar = "<a href='ServletProductos?op=borrar&id="+ p.getId() +"' onclick='return Confirmation()'>Borrar</a>";
            %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getNombre() %></td>
                <td><%= p.getImagen() %></td>
                <td><%= p.getCategoria() %></td>
                <td><%= p.getPrecio() %></td>
                <td><%= cadenaBorrar %></td>
            </tr>
            <% } %>
        </table>
        <script type="text/javascript">
            function Confirmation(){
                if (confirm('Está seguro de eliminar el producto?')==true){
                    alert('El registro se ha sido eliminado correctamente!!!');
                    return true;
                } else {
                    alert('Operación cancelada');
                    return false;
                }
            }
        </script>
    </body>
</html>
