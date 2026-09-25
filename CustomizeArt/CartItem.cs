using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CustomizeArt
{
    public class CartItem
    {
        public int ItemId { get; set; }
        public int ProductID { get; set; }
        public int UserId { get; set; }
        public string Quantity { get; set; }
        public double UnitPrice { get; set; }
        public string CartId { get; set; }
        public int customizeId { get; set; }
    }
}