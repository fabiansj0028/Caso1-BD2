package com.example;
import java.sql.Connection; 
import java.util.Scanner;
import java.sql.DriverManager;


public final class App{
    private App() {
    }
    public static void main(String[] args) {
        String connectionUrl = "jdbc:sqlserver://localhost;databaseName=Aseni;user=sa;password=1234";
        Scanner reader = new Scanner(System.in); 
        try {

            // Load SQL Server JDBC driver and establish connection.
            Connection connection = DriverManager.getConnection(connectionUrl);
            
            for(int i = 0; i<10;i++){
                System.out.println("Numero de canton: ");
                int n = reader.nextInt();
                
                thread hilo = new thread(connection,n);
                hilo.run();
                
            }
            

        } catch (Exception e) {
            System.out.println();
            e.printStackTrace();
        }
        reader.close();
    }
}
