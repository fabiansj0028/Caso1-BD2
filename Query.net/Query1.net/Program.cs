using System;
using System.Data.SqlClient;
using System.Threading;

namespace Query1.net
{
    class Program
    {
        static void Main(string[] args)
        {
            /*Array de Cantones donde se utilizan cantones que tienen 0,1,2 o 3 Entregables.
             * Por ejemplo el canton 15 tiene 3 mientras que el 9 tiene 0
             */
            int[] array = { 1, 2, 3, 4, 5, 6, 9, 15, 20, 14};
            //Llamado al Query1
            Query1 query1 = new Query1();
            query1.ComenzarQuery(array);

            Thread.Sleep(5000);

            //Llamado al Query2
            Query2 query2 = new Query2();
            query2.ComenzarQuery();
        }
    }
}
