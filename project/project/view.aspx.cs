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
using System.Reflection.Emit;

namespace project
{
    public partial class view : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            var product_id = Request.QueryString["id"].ToString();

            con.Open();
            SqlCommand selectCmd = new SqlCommand("SELECT * FROM [product] WHERE id = @id", con);
            selectCmd.Parameters.AddWithValue("@id", product_id);
            SqlDataAdapter selectCmdAdapter = new SqlDataAdapter(selectCmd);
            DataSet productDataset = new DataSet();
            selectCmdAdapter.Fill(productDataset);
            con.Close();
            var img = productDataset.Tables[0].Rows[0]["img"];
            Image1.ImageUrl = GetImageUrl(img);
            Label1.Text = productDataset.Tables[0].Rows[0]["name"].ToString();
            Label2.Text = productDataset.Tables[0].Rows[0]["amount"].ToString();
            Label3.Text = productDataset.Tables[0].Rows[0]["detail"].ToString();
            Label4.Text = productDataset.Tables[0].Rows[0]["type"].ToString();
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            //HttpCookie email = new HttpCookie("email");
            var email = Response.Cookies.Get("email").Value.ToString();
            if (email != "" || email != null)
            {
                con.Open();
                String insertQry = "insert into [bidamount] (amount, email ) values (@amount, @email)";
                SqlCommand insertCmd = new SqlCommand(insertQry, con);
                insertCmd.Parameters.AddWithValue("@amount", amount.Text.ToString());
                insertCmd.Parameters.AddWithValue("@email", email);


                insertCmd.ExecuteNonQuery();
                con.Close();
                litBidSuccessful.Text = "<script>showBidSuccessfulAlert();</script>";
                Response.Redirect("home.aspx");
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

    }
}