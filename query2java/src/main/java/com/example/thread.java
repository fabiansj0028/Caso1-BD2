package com.example;
import java.sql.Statement;
import java.sql.Connection; 
import java.sql.ResultSet;


public class thread extends Thread {

    Connection connection;

    public thread(Connection con){
        this.connection = con;
    }
    public void run() {  
        long inicio = System.currentTimeMillis();
        String query = "SELECT COUNT(E.ID) as 'Entregables', C.Nombre FROM Entregables E, (SELECT C.* FROM Cantones C , (SELECT C.ID, COUNT(P.ID) as 'CantPartidos' FROM Cantones C, Entregables E, Partidos P, Acciones A, Planes PL WHERE E.IdCanton = C.ID and E.IdAccion = A.ID AND E.IdPlan = PL.ID AND E.IdPartido = P.ID Group by C.ID) CP WHERE C.ID = CP.ID AND CP.CantPartidos <= (SELECT(SELECT COUNT(ID) FROM Partidos) / 4)) C WHERE E.IdCanton = C.ID Group by C.Nombre";
        try(Statement stmt = this.connection.createStatement() ) {  
            ResultSet rs = stmt.executeQuery(query);  
            while (rs.next()) { 
                System.out.println("Entregables: " + rs.getString("Entregables"));  
                System.out.println("Canton: " + rs.getString("Nombre"));  
                System.out.println();  
            }
        }
        catch (Exception e) {
            System.out.println();
            e.printStackTrace();
        }
        long fin  = System.currentTimeMillis();
        System.out.println(fin-inicio + "ms.");
        try{Thread.sleep(2000);}catch(InterruptedException e){e.printStackTrace();}
    }
}
