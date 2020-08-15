using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using ShoppingSite.DataLayer;


namespace ShoppingSite.BusinessLayer
{
    public class ShoppingCart
    {
        public string CategoryName;
        public int CategoryID;
        public int ProductID;

        public string ProductName;
        public string ProductImage;
        public string ProductPrice;
        public string ProductDescription;
        public int TotalProducts;

        public string CustomerID;
        public string CustomerName;
        public string CustomerEmailID;
        public string CustomerPhoneNo;
        public string CustomerAddress;
        public string ProductList;
        public string PaymentMethod;

        public int TotalPrice;

        public string OrderStatus;
        public string OrderNo;
        
        public int StockType;
        public int Flag;
             


        public void AddNewCategory()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@CategoryName", CategoryName, SqlDbType.VarChar,200);
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_AddNewCategory", parameters);
        } 
        public void AddNewProduct()
        {
            SqlParameter[] parameters = new SqlParameter[6];
            parameters[0] = DataAccess.AddParameter("@Name", ProductName, SqlDbType.VarChar, 500);
            parameters[1] = DataAccess.AddParameter("@Description", ProductDescription, SqlDbType.VarChar, 500);
            parameters[2] = DataAccess.AddParameter("@Price", ProductPrice, SqlDbType.VarChar, 50);
            parameters[3] = DataAccess.AddParameter("@ImageUrl", ProductImage, SqlDbType.VarChar, 500);
            parameters[4] = DataAccess.AddParameter("@CategoryID", CategoryID, SqlDbType.Int, 100);
            parameters[5] = DataAccess.AddParameter("@ProductQuantity", TotalProducts, SqlDbType.Int, 100);
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_AddNewProduct", parameters);
        }
        public  DataTable GetCategories()
        {
            SqlParameter[] parameters = new SqlParameter[0];
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_GetAllCategories", parameters);
            return dt;
        }

        public DataTable GetAllProducts()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataLayer.DataAccess.AddParameter("@CategoryID", CategoryID, SqlDbType.Int, 20);
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_GetAllProducts", parameters);
            return dt;
        }

        internal DataTable SaveCustomerDetails()
        {
            SqlParameter[] parameters = new SqlParameter[7];
            parameters[0] = DataAccess.AddParameter("@CustomerName", CustomerName, SqlDbType.VarChar, 100);
            parameters[1] = DataAccess.AddParameter("@CustomerEmailID", CustomerEmailID, SqlDbType.VarChar, 100);
            parameters[2] = DataAccess.AddParameter("@CustomerPhoneNo", CustomerPhoneNo, SqlDbType.VarChar, 10);
            parameters[3] = DataAccess.AddParameter("@CustomerAddress", CustomerAddress, SqlDbType.VarChar, 100);
            parameters[4] = DataAccess.AddParameter("@TotalProducts", TotalProducts, SqlDbType.Int, 100);
            parameters[5] = DataAccess.AddParameter("@TotalPrice", TotalPrice, SqlDbType.Int, 100);
            parameters[6] = DataAccess.AddParameter("@PaymentMethod", PaymentMethod, SqlDbType.VarChar, 100);
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_SaveCustomerDetails", parameters);
            return dt;

        }

        internal void SaveCustomerProducts()
        {

            SqlParameter[] parameters = new SqlParameter[3];
            parameters[0] = DataAccess.AddParameter("@CustomerID", CustomerID, SqlDbType.Int, 20);
            parameters[1] = DataAccess.AddParameter("@ProductID", ProductID, SqlDbType.Int, 20);
            parameters[2] = DataAccess.AddParameter("@TotalProduct", TotalProducts, SqlDbType.Int, 20);
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_SaveCustomerProducts", parameters);
        }

        internal DataTable GetOrdersList()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@Flag", Flag, SqlDbType.Int, 20);
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_GetOrdersList", parameters);
            return dt;
        }

        internal DataTable GetAailableStock()
        {
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = DataAccess.AddParameter("@StockType", StockType, SqlDbType.Int,10);
            parameters[1] = DataAccess.AddParameter("@CategoryID", CategoryID, SqlDbType.Int,10);
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_GetAailableStock", parameters);
            return dt;
        }

        internal DataTable GetIncomeReport()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@ReportType", Flag, SqlDbType.Int, 10);
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_GetIncomeReport", parameters);
            return dt;
        }

        internal DataTable GetTransactionDetails()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@TransactionNo", Flag, SqlDbType.Int, 20);
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_GetTransactionDetails", parameters);
            return dt;
        }

        internal DataTable GetSetOrderStatus()
        {
            SqlParameter[] parameters = new SqlParameter[3];
            parameters[0] = DataAccess.AddParameter("@TransactionNo", Convert.ToInt32(OrderNo), SqlDbType.Int, 20);
            parameters[1] = DataAccess.AddParameter("@OrderStatus", OrderStatus, SqlDbType.VarChar, 300);
            parameters[2] = DataAccess.AddParameter("@Flag", Flag, SqlDbType.Int, 20);
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_GetSetOrderStatus", parameters);
            return dt;
        }
    }
}