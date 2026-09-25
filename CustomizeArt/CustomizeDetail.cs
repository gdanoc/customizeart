using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CustomizeArt
{
    public class CustomizeDetail
    {
        public int Id { get; set; }
        public string Size { get; set; }
        public string CustomizeImage { get; set; }
        public string Face { get; set; }
        public string Color { get; set; }
        public int ProductId { get; set; }
    }
}