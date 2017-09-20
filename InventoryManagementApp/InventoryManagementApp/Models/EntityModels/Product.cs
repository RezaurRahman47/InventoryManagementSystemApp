namespace InventoryManagementApp.Models.EntityModels
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public double Quantity { get; set; }
        public double UnitPrice { get; set; }
        public int ProductCategoryId { get; set; }
       
    }
}