using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryManagementApp.DAL;
using InventoryManagementApp.Models;
using InventoryManagementApp.Models.EntityModels;
using InventoryManagementApp.Models.ViewModels;

namespace InventoryManagementApp.BLL
{
    public class ProductManager
    {
        private  ProductGateway _productGateway = new ProductGateway();
        public bool Save(Product product)
        {
            if (ValidateSave(product) && IsCodeAvailable(product.Code))
            {
                return _productGateway.Save(product);
            }
            return false;
        }

        public bool ValidateSave(Product product)
        {
            if (!string.IsNullOrEmpty(product.Name) &&
                !string.IsNullOrEmpty(product.Code) &&
                product.Quantity > 0 &&
                product.UnitPrice > 0)
            {
                return true;
            }
            return false;
        }

        public Product GetByCode(string code)
        {
            return _productGateway.GetByCode(code);
        }

        public bool IsCodeAvailable(string code)
        {
            Product product = GetByCode(code);
            if (product == null)
            {
                return true;
            }
            return false;
        }

        public List<Product> GetAll()
        {
            return _productGateway.GetAll();
        }

        public bool Update(Product product)
        {
            return _productGateway.Update(product);
        }

        public List<ProductViewModel> GetAllProductInformation()
        {
            return _productGateway.GetAllProductInformation();
        }
    }
}