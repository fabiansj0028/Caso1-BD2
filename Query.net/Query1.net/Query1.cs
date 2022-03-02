using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Threading;
using System.Diagnostics;

namespace Query1.net
{
    class Query1
    {
        public Query1()
        {
        }

        public void ComenzarQuery(int[] array)
        {
            // Se crean 10 hilos y llaman al metodo pasandole el cantón
            for (int i = 0; i < 10; i++)
            {
                Thread hilo = new Thread(Query1.Metodo);
                hilo.Start(array[i]);
            }
        }

        public static void Metodo(Object data)
        {
            //Creacion del stopwatch para medir los ms
            Stopwatch reloj = new Stopwatch();
            reloj.Start();

            //Se crea la conexion con el driver de .net
            SqlConnection conexion = new SqlConnection("Data Source = localhost; Initial Catalog = Aseni; user = sa; password = 1234");
            //Se crea un comando para enviar a la base de datos
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandType = CommandType.StoredProcedure; // Se asigna al comando tipo Store Procedure
            cmd1.CommandText = "dbo.getEntregables"; // Nombre del Store Procedure
            cmd1.Connection = conexion; // Se le agrega la conexion al comando
            cmd1.Parameters.Add("@Canton", SqlDbType.Int).Value = Convert.ToInt32(data); // Se le envia el parametro al store procedure

            conexion.Open(); // Se abre la conexion
            SqlDataReader reader = cmd1.ExecuteReader(); // Lector del resultado
            while (reader.Read())
            {
                Console.WriteLine("Canton: " + Convert.ToInt32(data) + " " +
                                  String.Format("{0}", reader[0]) + " "+
                                  String.Format("{0}", reader[3])+ " "+
                                  String.Format("{0}", reader[4]) + " " +
                                  String.Format("{0}", reader[2]) + " "+ 
                                  String.Format("{0}", reader[1]));
            }
            conexion.Close(); // Se cierra la conexión
            reloj.Stop();
            Console.WriteLine($"Tiempo: {reloj.Elapsed.Milliseconds} ms");
        }
    }
}
