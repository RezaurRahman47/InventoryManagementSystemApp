using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using InventoryManagementApp.Models;
using InventoryManagementApp.Models.EntityModels;
using InventoryManagementApp.Models.ViewModels;

namespace InventoryManagementApp.DAL
{
    public class ProductGateway : CommonGateway
    {
       public bool Save(Product aProduct)
        {
            //query
            string query = "INSERT INTO Product (Name,Code,Quantity,UnitPrice,ProductCategoryId) VALUES ('" + aProduct.Name + "','" + aProduct.Code + "','" + aProduct.Quantity + "'," + aProduct.UnitPrice + ","+aProduct.ProductCategoryId+")";
            Connection.Open();
            //query execuite
            Command.CommandText = query;

            //result
            int rowsAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowsAffected > 0;
        }

        public Product GetByCode(string code)
        {
            
            //query
            string query = "SELECT * FROM Product WHERE Code =" +code+"";
            Connection.Open();
            //query execuite
            Command.CommandText = query;
            SqlDataReader reader = Command.ExecuteReader();
            Product product = null;
            if (reader.HasRows)
            {
                reader.Read();
                product = new Product();
                product.Id = (int)reader["Id"];
                product.Quantity = (double)reader["Quantity"];
                product.Code = reader["Code"].ToString();
                product.Name = reader["Name"].ToString();
                product.ProductCategoryId = Convert.ToInt32(reader["ProductCategoryId"]);
                product.UnitPrice = (double) reader["UnitPrice"];

            }
            reader.Close();
            Connection.Close();
            return product;
        }

        public List<Product> GetAll()
        {
            //query
            string query = "SELECT * FROM Product";
            Connection.Open();
            //query execuite
            Command.CommandText = query;
            SqlDataReader reader = Command.ExecuteReader();
            List<Product> products = new List<Product>();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Product product = new Product();
                    product = new Product();
                    product.Id = (int)reader["Id"];
                    product.Quantity = (double)reader["Quantity"];
                    product.Code = reader["Code"].ToString();
                    product.Name = reader["Name"].ToString();
                    product.ProductCategoryId = Convert.ToInt32(reader["ProductCategoryId"]);
                    product.UnitPrice = (double)reader["UnitPrice"];
                    products.Add(product);
                }

            }
            reader.Close();
            Connection.Close();
            return products;
        }

        public bool Update(Product product)
        {
            //query
            string query = "UPDATE Product SET Name='" + product.Name + "', Code='" + product.Code + "', Quantity=" +
                           product.Quantity + ", UnitPrice=" + product.UnitPrice + ", ProductCategoryId="+ product.ProductCategoryId+" WHERE Id=" +product.Id+"";
            Connection.Open();
            //query execuite
            Command.CommandText = query;

            //result
            int rowsAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowsAffected > 0;
        }

        public List<ProductViewModel> GetAllProductInformation()
        {
            //query
            string query = "SELECT * FROM VW_GetAllProductInformation";
            Connection.Open();
            //query execuite
            Command.CommandText = query;
            SqlDataReader reader = Command.ExecuteReader();
            List<ProductViewModel> productViewModels = new List<ProductViewModel>();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    ProductViewModel productViewModel = new ProductViewModel();
                    productViewModel.Id = (int)reader["Id"];
                    productViewModel.Quantity = (double)reader["Quantity"];
                    productViewModel.Code = reader["Code"].ToString();
                    productViewModel.Name = reader["Name"].ToString();
                    productViewModel.ProductCategoryId = Convert.ToInt32(reader["ProductCategoryId"]);
                    productViewModel.UnitPrice = (double)reader["UnitPrice"];
                    productViewModel.ProductCategoryName = reader["ProductCategoryName"].ToString();
                    productViewModels.Add(productViewModel);
                }

            }
            reader.Close();
            Connection.Close();
            return productViewModels;
        }
    }
}