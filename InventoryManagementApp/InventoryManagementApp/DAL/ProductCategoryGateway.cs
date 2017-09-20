using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using InventoryManagementApp.Models;
using InventoryManagementApp.Models.EntityModels;

namespace InventoryManagementApp.DAL
{
    public class ProductCategoryGateway : CommonGateway
    {
        public List<ProductCategory> GetAll()
        {
           //query
            string query = "SELECT * FROM ProductCategory";
            Connection.Open();
            //query execuite
            Command.CommandText = query;
            SqlDataReader reader = Command.ExecuteReader();
            List<ProductCategory> productCategories = new List<ProductCategory>();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    ProductCategory productCategory = new ProductCategory();
                    productCategory.Id = (int)reader["Id"];
                    productCategory.Name = reader["Name"].ToString();
                    productCategories.Add(productCategory);
                }

            }
            reader.Close();
            Connection.Close();
            return productCategories;
        }
    }
}