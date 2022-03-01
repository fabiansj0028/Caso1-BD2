package com.example;
import java.sql.Connection; 
import java.sql.DriverManager;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


public final class App {
    private App() {
    }

    public static void main(String[] args) {
        String connectionUrl = "jdbc:sqlserver://localhost;databaseName=Aseni;user=sa;password=1234";
        try {
            // Load SQL Server JDBC driver and establish connection.
            Connection connection = DriverManager.getConnection(connectionUrl);
            ExecutorService executor = Executors.newFixedThreadPool(4);
            for(int i = 0; i<10;i++){
                thread hilo = new thread(connection);
                executor.execute(hilo);
            }
            executor.shutdown();

        } catch (Exception e) {
            System.out.println();
            e.printStackTrace();
        }
    }
}
