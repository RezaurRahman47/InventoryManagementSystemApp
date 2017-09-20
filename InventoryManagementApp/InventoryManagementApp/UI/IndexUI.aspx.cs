using System;
using System.Collections.Generic;
using InventoryManagementApp.BLL;
using InventoryManagementApp.Models;
using InventoryManagementApp.Models.EntityModels;
using InventoryManagementApp.Models.ViewModels;

namespace InventoryManagementApp.UI
{
    public partial class IndexUI : System.Web.UI.Page
    {
        private ProductManager _productManager = new ProductManager();
        private ProductCategoryManager _productCategoryManager = new ProductCategoryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["code"] != null)
                {
                    string code = Request.QueryString["code"];
                    Product product = _productManager.GetByCode(code);
                    nameTextBox.Text = product.Name;
                    codeTextBox.Text = product.Code;
                    quantityTextBox.Text = product.Quantity.ToString();
                    unitPriceTextBox.Text = product.UnitPrice.ToString();
                    idHiddenField.Value = product.Id.ToString();
                    productCategoryDropDownList.SelectedValue = product.ProductCategoryId.ToString();
                    saveButton.Text = "Update";
                }
                LoadProductCategoryDropdownList();

            }
            LoadProductGridView();
        }

        private void LoadProductCategoryDropdownList()
        {
            List<ProductCategory> productCategories = _productCategoryManager.GetAll();
            productCategoryDropDownList.DataSource = productCategories;
            productCategoryDropDownList.DataValueField = "Id";
            productCategoryDropDownList.DataTextField = "Name";
            productCategoryDropDownList.DataBind();
        }

        private void LoadProductGridView()
        {
            List<ProductViewModel> products = _productManager.GetAllProductInformation();
            productGridView.DataSource = products;

            productGridView.DataBind();
        }
        protected void saveButton_Click(object sender, EventArgs e)
        {
            Product aproduct = new Product();
            aproduct.Name = nameTextBox.Text;
            aproduct.Code = codeTextBox.Text;
            aproduct.Quantity = Convert.ToInt32(quantityTextBox.Text);
            aproduct.UnitPrice = Convert.ToDouble(unitPriceTextBox.Text);
            aproduct.ProductCategoryId = Convert.ToInt32(productCategoryDropDownList.SelectedValue);
            if (saveButton.Text.Equals("Save"))
            {
                bool rowsAffected = _productManager.Save(aproduct);
                if (rowsAffected)
                {
                    messageLabel.Text = "Save successfull";
                    LoadProductGridView();
                }
                else
                {
                    messageLabel.Text = "Save failed";
                }
            }
            else
            {
                aproduct.Id = Convert.ToInt32(idHiddenField.Value);
                bool rowsAffected = _productManager.Update(aproduct);
                if (rowsAffected)
                {
                    messageLabel.Text = "Update successfull";
                    LoadProductGridView();
                }
                else
                {
                    messageLabel.Text = "Update failed";
                }
            }
            saveButton.Text = "Save";

        }

        
    }
}