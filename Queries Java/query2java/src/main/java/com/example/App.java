package com.example;
import java.sql.Connection; 
import java.sql.DriverManager;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


public final class App {
    private App() {
    }

    public static void main(String[] args) {
        //String de conexión
        String connectionUrl = "jdbc:sqlserver://localhost;databaseName=Aseni;user=sa;password=1234";
        try {
            // Se llama al driver a realizar la conexión
            Connection connection = DriverManager.getConnection(connectionUrl);

            //Se crea un fixed threadpool de 4.
            ExecutorService executor = Executors.newFixedThreadPool(4);
            
            // Se crean 10 hilos y se ejecutan en el threadpool
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
