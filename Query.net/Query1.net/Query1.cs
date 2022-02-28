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

        public void runQuery(int[] array)
        {
            for (int i = 0; i < 10; i++)
            {
                Thread hilo = new Thread(() => this.metodo(array[i],i));
                hilo.Start();
            }

        }

        public void metodo(int id, int threadid)
        {
            SqlConnection conexion = new SqlConnection("Data Source = localhost; Initial Catalog = Aseni; user = sa; password = 1234");
            Stopwatch reloj = new Stopwatch();
            reloj.Start();
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.CommandText = "dbo.getEntregables";
            cmd1.Connection = conexion;
            cmd1.Parameters.Add("@Canton", SqlDbType.Int).Value = id;

            conexion.Open();
            SqlDataReader reader = cmd1.ExecuteReader();
            while (reader.Read())
            {
                Console.WriteLine(String.Format("{0}", reader[0]) + " "+
                                  String.Format("{0}", reader[3])+ " "+
                                  String.Format("{0}", reader[4]) + " " +
                                  String.Format("{0}", reader[2]) + " "+ 
                                  String.Format("{0}", reader[1]));
            }
            conexion.Close();
            reloj.Stop();
            Console.WriteLine($"Thread : {threadid} Tiempo: {reloj.Elapsed.TotalMilliseconds} ms");
        }
    }
}
