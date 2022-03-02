package com.example;
import java.sql.Connection; 
import java.sql.DriverManager;


public final class App{
    private App() {
    }

    public static void main(String[] args) {

        //String de conexion para la base de datos
        String connectionUrl = "jdbc:sqlserver://localhost;databaseName=Aseni;user=sa;password=1234";
        try {
            //Llamado al Driver para realizar la conexión
            Connection connection = DriverManager.getConnection(connectionUrl);

            // En este array de cantones se utilizan cantones que tienen 0, 1, 2 o 3 Entregables, por ejemplo el canton 15 tiene 3 mientras que el 9 tiene 0.
            int[] arrayCantones= {1,2,3,4,5,6,9,15,20,14};

            // Creacion de los 10 Hilos
            for(int i = 0; i<10;i++){
                System.out.println("Numero de canton: "+ arrayCantones[i]);  
                thread hilo = new thread(connection,arrayCantones[i]);
                hilo.run();
            }    
            
        } catch (Exception e) {
            System.out.println();
            e.printStackTrace();
        }
    }
}
