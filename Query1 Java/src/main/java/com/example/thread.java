package com.example;
import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class thread extends Thread {
    Connection connection;
    int idCanton;

    public thread(Connection con, int id){
        this.connection = con;
        this.idCanton = id;
    }
    public void run() {  

        //Inicia el cronometro
        long inicio = System.currentTimeMillis();

        //Statement para llamar al Store Procedure
        try(PreparedStatement pstmt = this.connection.prepareStatement("{call dbo.getEntregables(?)}"); ) {  

            //Parametro para el Store Procedure
            pstmt.setInt(1, this.idCanton);  

            //Ejecución del Store Procedure
            ResultSet rs = pstmt.executeQuery();  
    
            while (rs.next()) { 
                 
                System.out.println("Partido: " + rs.getString("Nombre"));  
                System.out.println("Descripcion: " + rs.getString("Descripcion"));  
                System.out.println("Fecha: "+ rs.getString("Fecha"));
                System.out.println("KpiValue: "+ rs.getString("kpivalue"));
                System.out.println("KpiType: "+ rs.getString("kpitype"));
                System.out.println();  
            }
             
        }
        catch (Exception e) {
            System.out.println();
            e.printStackTrace();
        }
        long fin  = System.currentTimeMillis();
        System.out.println(fin-inicio + "ms.");
    }
}
