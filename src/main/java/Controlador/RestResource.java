/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Libro;
import Modelo.LibrosCRUD;
import java.util.List;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author Pablo Flores
 */
@Path("rest")
public class RestResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of RestResource
     */
    public RestResource() {
    }

    /**
     * Retrieves representation of an instance of Controlador.RestResource
     * @return an instance of java.lang.String
     */
    @GET
   @Path("/libro/{id}")
   @Produces(MediaType.APPLICATION_JSON)
    public Libro getLibroJson(@PathParam("id") int id  ) {
        Libro miLibro = LibrosCRUD.getLibro(id); 
        return miLibro;
    }
    
    @GET
    @Path("/libros")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Libro> getLibroJson() {
        List <Libro> misLibros = LibrosCRUD.getLibros(); 
        return misLibros;
    }
    
    @PUT
    @Path("/libro")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Libro updateLibroJson(Libro lib) {
        LibrosCRUD.actualizaLibro(lib); 
        return lib;
    }
    
    @POST
    @Path("/libro")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Libro insertaLibroJson(Libro lib) {
        LibrosCRUD.insertaLibro(lib); 
        return lib;
    }
    
    @DELETE
    @Path("/libro/{id}")
    public void borraLibroJson(@PathParam("id") int id) {
        LibrosCRUD.destroyLibro(id); 
    }

    /**
     * PUT method for updating or creating an instance of RestResource
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_XML)
    public void putXml(String content) {
    }
}
