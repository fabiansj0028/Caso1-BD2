using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace Query1.net
{
    class ConexionBaseDatos
    {
        SqlConnection conexion;
        public ConexionBaseDatos()
        {
            SqlConnection conexionAux = new SqlConnection("Data Source = localhost; Initial Catalog = Aseni; user = sa; password = 1234");
            this.conexion = conexionAux;
        }

        public SqlConnection getConexion()
        {
            return this.conexion;
        }

    }
}
