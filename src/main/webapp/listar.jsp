<%-- 
    Document   : listar
    Created on : 05-mar-2021, 20:53:28
    Author     : DAW-A
--%>

<%@page import="java.util.List"%>
<%@page import="Modelo.Libro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            #capa{
                padding: 30px
            }
        </style>      
    </head>
    <body>
        <nav class="navbar navbar-expand-md bg-light navbar-light">
        <!-- Brand -->
        <a class="navbar-brand" href="#">Libros CRUD</a>

        <!-- Toggler/collapsibe Button -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar links -->
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="ServletLibros?op=listar">Listar libros</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="ServletLibros?op=insert1">Insertar libros</a>
            </li>
          </ul>
        </div>
      </nav>
        <div id="capa">
            <h1>Listado de Libros</h1>
            <% 
                List<Libro> misLibros = (List<Libro>) request.getAttribute("misLibros");
            %>
            <table class="table table-bordered">
                <tr class="thead-light">
                    <th>id</th>
                    <th>Titulo</th>
                    <th>Autor</th>
                    <th>Cantidad</th>
                    <th>Borrar</th>
                    <th>Actualizar</th>
                </tr>
                <% for (Libro l: misLibros){ 
                    String cadenaBorrar = "<a href='ServletLibros?op=borrar&id="+ l.getId() +"' onclick='return Confirmation()'><i class='fas fa-trash-alt'></i></a>";
                    String cadenaActualizar = "<a href='ServletLibros?op=update1&id="+ l.getId() +"'><i class='fas fa-edit'></i></a>";
                %>
                <tr>
                    <td><%= l.getId() %></td>
                    <td><%= l.getTitulo() %></td>
                    <td><%= l.getAutor() %></td>
                    <td><%= l.getCantidad() %></td>
                    <td><%= cadenaBorrar %></td>
                    <td><%= cadenaActualizar %></td>
                </tr>
                <% } %>
            </table>

            <script type="text/javascript">
                function Confirmation(){
                    if (confirm('Está seguro de eliminar el libro?')==true){
                        alert('El registro ha sido eliminado correctamente!!!');
                        return true;
                    } else {
                        alert('Operación cancelada');
                        return false;
                    }
                }
            </script>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        </div>
    </body>
</html>
