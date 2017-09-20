using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryManagementApp.DAL;
using InventoryManagementApp.Models;
using InventoryManagementApp.Models.EntityModels;

namespace InventoryManagementApp.BLL
{
    public class ProductCategoryManager
    {
        private ProductCategoryGateway _productCategoryGateway = new ProductCategoryGateway();
        public List<ProductCategory> GetAll()
        {
            return _productCategoryGateway.GetAll();
        }
    }
}