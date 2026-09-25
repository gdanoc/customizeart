using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CustomizeArt
{
    public class Add
    {
        public int Id { get; set; }
        public string Product { get; set; }
        public string Quantity { get; set; }
        public string Price { get; set; }
        public string Date { get; set; }
        public string Description { get; set; }
        public string Category { get; set; }

        public string Size { get; set; }
        public string Color { get; set; }
        public string Image { get; set; }
        public Add() { }

        public Add(int PId, string pProduct, string pQuantity, string pPrice, string pDate, string pSize, string pColor, string pImage, string pDescription, string pCategory)

        {
            this.Id = PId;
            this.Product = pProduct;
            this.Quantity = pQuantity;
            this.Price = pPrice;
            this.Date = pDate;
            this.Description = pDescription;
            this.Category = pCategory;
            this.Size = pSize;
            this.Color = pColor;
            this.Image = pImage;

        }
    }
}