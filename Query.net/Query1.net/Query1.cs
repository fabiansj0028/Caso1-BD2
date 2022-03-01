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
            for (int i = 0; i < 10; i++)
            {
                Thread hilo = new Thread(Query1.Metodo);
                hilo.Start(array[i]);
            }
        }

        public static void Metodo(Object data)
        {
            Stopwatch reloj = new Stopwatch();
            reloj.Start();
            SqlConnection conexion = new SqlConnection("Data Source = localhost; Initial Catalog = Aseni; user = sa; password = 1234");
            
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.CommandText = "dbo.getEntregables";
            cmd1.Connection = conexion;
            cmd1.Parameters.Add("@Canton", SqlDbType.Int).Value = Convert.ToInt32(data);

            conexion.Open();
            SqlDataReader reader = cmd1.ExecuteReader();
            while (reader.Read())
            {
                Console.WriteLine("Canton: " + Convert.ToInt32(data) + " " +
                                  String.Format("{0}", reader[0]) + " "+
                                  String.Format("{0}", reader[3])+ " "+
                                  String.Format("{0}", reader[4]) + " " +
                                  String.Format("{0}", reader[2]) + " "+ 
                                  String.Format("{0}", reader[1]));
            }
            conexion.Close();
            reloj.Stop();
            Console.WriteLine($"Tiempo: {reloj.Elapsed.Milliseconds} ms");
        }
    }
}
