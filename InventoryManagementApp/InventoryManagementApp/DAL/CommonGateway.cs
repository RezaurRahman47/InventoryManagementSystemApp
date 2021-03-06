﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace InventoryManagementApp.DAL
{
    public class CommonGateway
    {
        public string connectionString =
            WebConfigurationManager
            .ConnectionStrings["InventoryManagementConnectionString"]
            .ConnectionString;
        public SqlConnection Connection { get; set; }
        public SqlCommand Command { get; set; }



        public CommonGateway()
        {
            Connection = new SqlConnection(connectionString);
            Command = new SqlCommand();
            Command.Connection = Connection;
        }
    }
}