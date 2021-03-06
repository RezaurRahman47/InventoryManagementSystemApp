﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryManagementApp.Models.ViewModels
{
    public class ProductViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public double Quantity { get; set; }
        public double UnitPrice { get; set; }
        public int ProductCategoryId { get; set; }
        public string ProductCategoryName { get; set; }
    }
}