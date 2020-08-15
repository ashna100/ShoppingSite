using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ShoppingSite.DataLayer
{
    public class DataAccess
    {
        public static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["shopping"].ToString()
;            }
        }

        public static  SqlParameter AddParameter(string ParameterName, object value, SqlDbType DbType, int size)
        {
            SqlParameter param = new SqlParameter();
            param.ParameterName = ParameterName;
            param.Value = value.ToString();
            param.SqlDbType = DbType;
            param.Size = size;
            param.Direction = ParameterDirection.Input;
            return param;
        }

        public static DataTable ExecuteDTByProcedure(string ProcedureName, SqlParameter[] Params)
        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = ProcedureName;
            cmd.Parameters.AddRange(Params);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                adp.Fill(dt);
            }
            catch(Exception ex) {
                ex.Message.ToString();
            }
            finally
            {
                adp.Dispose();
                cmd.Parameters.Clear();
                cmd.Dispose();
                conn.Dispose();
            }
            return dt;
        }
    }
}