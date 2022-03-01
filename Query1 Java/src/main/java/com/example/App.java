package com.example;
import java.sql.Connection; 
import java.sql.DriverManager;


public final class App{
    private App() {
    }
    public static void main(String[] args) {
        String connectionUrl = "jdbc:sqlserver://localhost;databaseName=Aseni;user=sa;password=1234";
        try {
            // Load SQL Server JDBC driver and establish connection.
            Connection connection = DriverManager.getConnection(connectionUrl);
            int[] array = {1,2,3,4,5,6,8,15,20,14};

            long inicio = System.currentTimeMillis();
            for(int i = 0; i<10;i++){
                System.out.println("Numero de canton: "+ array[i]);  
                thread hilo = new thread(connection,array[i]);
                hilo.run();
            }
            long fin  = System.currentTimeMillis();
            System.out.println(fin-inicio+"ms.");
            
        } catch (Exception e) {
            System.out.println();
            e.printStackTrace();
        }
    }
}
