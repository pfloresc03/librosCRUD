/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author Pablo Flores
 */
public class LibrosCRUD {
    public static List<Libro> getLibros() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("com.mycompany_librosCRUD_war_1.0-SNAPSHOTPU");
        EntityManager manager = factory.createEntityManager();
        String sql = "SELECT * FROM Libro";
        Query q = manager.createNativeQuery(sql,Libro.class); //método para consultas en SQL
        List<Libro> librosBD =  q.getResultList();

        return librosBD;        
    }
    
    public static int actualizaLibro(Libro miLibro) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("com.mycompany_librosCRUD_war_1.0-SNAPSHOTPU");
        EntityManager manager = factory.createEntityManager();
        String sql = "UPDATE Libro l SET l.titulo = :titulo, l.autor = :autor, l.cantidad = :cantidad WHERE l.id = :id";
        Query q = manager.createQuery(sql,Libro.class);
        q.setParameter("titulo", miLibro.getTitulo());
        q.setParameter("autor", miLibro.getAutor());
        q.setParameter("cantidad", miLibro.getCantidad());
        q.setParameter("id", miLibro.getId());
        manager.getTransaction().begin();
        int filasAfectadas = q.executeUpdate();
        manager.getTransaction().commit();
        //manager.close();
        return filasAfectadas;      
    }
    
    public static void insertaLibro(Libro libro) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("com.mycompany_librosCRUD_war_1.0-SNAPSHOTPU");
        EntityManager manager = factory.createEntityManager();
        manager.getTransaction().begin();
        manager.merge(libro);
        manager.getTransaction().commit();
    }

     public static int destroyLibro(int id) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("com.mycompany_librosCRUD_war_1.0-SNAPSHOTPU");
        EntityManager manager = factory.createEntityManager();
        String sql = "DELETE from Libro l WHERE l.id = " + id;
        Query q = manager.createQuery(sql);
        manager.getTransaction().begin();
        int filasAfectadas = q.executeUpdate(); //para las consultas de modif. datos se usa el método executeUpdate
        manager.getTransaction().commit();
        return filasAfectadas;  
    }
     
    public static Libro getLibro(int id) {  //devuelve un objeto de clase Libro
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("com.mycompany_librosCRUD_war_1.0-SNAPSHOTPU");
        EntityManager manager = factory.createEntityManager();
        String sql = "SELECT l FROM Libro l WHERE l.id=" + id;
        Query q = manager.createQuery(sql,Libro.class); //método para consultas en SQL
        Libro miLibro =  ( Libro ) q.getSingleResult(); //para un único registro
        manager.close();
        return  miLibro;
    } 
}
