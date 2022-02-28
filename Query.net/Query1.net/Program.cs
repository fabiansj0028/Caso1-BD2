using System;
using System.Data.SqlClient;


namespace Query1.net
{
    class Program
    {
        static void Main(string[] args)
        {
            ConexionBaseDatos conexion = new ConexionBaseDatos();
            int[] array = { 1, 2, 3, 4, 5, 15, 16, 17, 18, 6, 11};
            Query1 query1 = new Query1();
            query1.runQuery(array);
        }
    }
}
