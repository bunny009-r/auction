using System;
using System.IO;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Web.Caching;
using System.Xml.Linq;
using System.Runtime.Remoting.Contexts;
using System.Drawing;
namespace project
{
    public partial class types : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            string type = Request.QueryString["type"].ToString();

            con.Open();
            SqlCommand selectCmd = new SqlCommand("SELECT * FROM [product] WHERE type = @type", con);
            selectCmd.Parameters.AddWithValue("@type", type);
            SqlDataReader dr = selectCmd.ExecuteReader();

            while (dr.Read())
            {
                Literal1.Text += "<div class='card' style='width: 18rem;'>";
                Literal1.Text += "<img CssClass = 'card-img-top' src=" + GetImageUrl(dr["img"]) + " style='height: 200px; object-fit: cover;' />";
                Literal1.Text += "<div class='card-body'>";
                Literal1.Text += "<h5 class='card-title'>" + dr["name"] + "</h5>";
                Literal1.Text += "<h3>" + dr["amount"] + "</h3>";
                Literal1.Text += "<a CssClass = 'btn btn-outline-dark' href='view.aspx?id=" + dr["id"] + "'>View Details</a>";
                Literal1.Text += "</div>";
                Literal1.Text += "</div>";
            }
            con.Close();
        }
        protected string GetImageUrl(object img)
        {
            if (img != null)
            {
                // Assuming img is a byte array representing the image data
                byte[] imageData = (byte[])img;

                // Convert the byte array to a base64 string
                string base64String = Convert.ToBase64String(imageData);

                // Return the data URI for the image
                return "data:image/jpeg;base64," + base64String;
            }
            else
            {
                // If img is null, return a placeholder image URL or an empty string
                return ""; // Replace with a placeholder image URL or an empty string
            }
        }
    }
}