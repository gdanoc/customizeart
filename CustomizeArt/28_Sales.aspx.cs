using iTextSharp.text.pdf;
using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _28_Sales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Load_Sales();
        }
        protected void Load_Sales()
        {
            DataTable myTable = metodos.Get_Sales();
            Sale.DataSource = myTable;
            Sale.DataBind();
        }

        protected void btonlogout_Click(object sender, EventArgs e)
        {
            string script = "Swal.fire('Logged Out', 'You logged out', 'info').then(function() { window.location.href = '01_Login.aspx'; });";
            ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
            Session.Clear();
        }

        protected void btonPDF_Click(object sender, EventArgs e)
        {
            // Obtener los datos del DataGridView
            DataTable dataTable = (DataTable)Sale.DataSource;

            // Crear el documento PDF
            Document document = new Document(PageSize.A4, 25, 25, 30, 30);
            PdfWriter writer = PdfWriter.GetInstance(document, Response.OutputStream);
            document.Open();

            // Crear la tabla PDF
            PdfPTable table = new PdfPTable(dataTable.Columns.Count);
            table.WidthPercentage = 100;

            // Agregar los encabezados de la tabla
            foreach (DataColumn column in dataTable.Columns)
            {
                PdfPCell cell = new PdfPCell(new Phrase(column.ColumnName));
                cell.BackgroundColor = new iTextSharp.text.BaseColor(240, 240, 240);
                table.AddCell(cell);
            }

            // Agregar los datos de la tabla
            foreach (DataRow row in dataTable.Rows)
            {
                foreach (object item in row.ItemArray)
                {
                    table.AddCell(new Phrase(item.ToString()));
                }
            }

            // Agregar la tabla al documento PDF
            document.Add(table);
            document.Close();

            // Descargar el PDF
            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Disposition", "attachment; filename=SellingReport.pdf");
            Response.Flush();
            Response.End();
        }
    }
}