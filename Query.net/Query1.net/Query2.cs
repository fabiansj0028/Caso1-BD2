using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Threading;
using System.Diagnostics;

namespace Query1.net
{
    class Query2
    {
        public void ComenzarQuery()
        {
            // Se crea ciclo para los 10 hilos
            for (int i = 0; i < 10; i++)
            {
                // Se asigna el hilo al threadpool que tiene .net por defecto 
                ThreadPool.QueueUserWorkItem(Proceso);
                Thread.Sleep(500); //Sleep para que todos puedan completar sus tareas.
            }
        }

        public static void Proceso(Object obj)
        {
            //Creacion del stopwatch para medir los ms
            Stopwatch reloj = new Stopwatch();
            reloj.Start();

            //Se crea la conexion con el driver de .net
            SqlConnection conexion = new SqlConnection("Data Source = localhost; Initial Catalog = Aseni; user = sa; password = 1234");
           
            //inlineQuery a usar
            String Query = "SELECT COUNT(E.ID) as 'Entregables', C.Nombre FROM Entregables E, (SELECT C.* FROM Cantones C , (SELECT C.ID, COUNT(P.ID) as 'CantPartidos' FROM Cantones C, Entregables E, Partidos P, Acciones A, Planes PL WHERE E.IdCanton = C.ID and E.IdAccion = A.ID AND E.IdPlan = PL.ID AND E.IdPartido = P.ID Group by C.ID) CP WHERE C.ID = CP.ID AND CP.CantPartidos <= (SELECT(SELECT COUNT(ID) FROM Partidos) / 4)) C WHERE E.IdCanton = C.ID Group by C.Nombre";
            
            //Se crea un comando para enviar a la base de datos y se le pasa el Query y la Conexión
            SqlCommand cmd1 = new SqlCommand(Query, conexion);

            //Se abre la conexion
            conexion.Open();
            SqlDataReader reader = cmd1.ExecuteReader();//Lector del resultado
            while (reader.Read())
            {
                Console.WriteLine("Entregables: " + String.Format("{0}", reader[0]) + " Cantón: " +
                                  String.Format("{0}", reader[1]));
                
            }
            conexion.Close();
            reloj.Stop();
            Console.WriteLine($"Tiempo: {reloj.Elapsed.Milliseconds} ms");
        }
    }
}
