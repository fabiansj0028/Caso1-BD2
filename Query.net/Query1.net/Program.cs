using System;
using System.Data.SqlClient;


namespace Query1.net
{
    class Program
    {
        static void Main(string[] args)
        {
            /*int[] array = { 1, 2, 3, 4, 5, 6, 8, 15, 20, 14};
            Query1 query1 = new Query1();
            query1.ComenzarQuery(array);*/

            Query2 query2 = new Query2();
            query2.ComenzarQuery();
        }
    }
}
