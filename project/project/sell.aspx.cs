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

namespace project
{
    public partial class sell : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            // Check if the user is authenticated
            if (!User.Identity.IsAuthenticated)
            {
                // User is not logged in, redirect to the login page with the return URL
                Response.Redirect("~/login.aspx?ReturnUrl=" + Server.UrlEncode(Request.Url.PathAndQuery));
            }
            else
            {
                con.Open();
                String insertQry = "insert into [product] (name, type, img, amount, detail ) values (@name,@type, @img,@amount,@detail)";
                SqlCommand insertCmd = new SqlCommand(insertQry, con);
                insertCmd.Parameters.AddWithValue("@name", TextBox1.Text.ToString());
                insertCmd.Parameters.AddWithValue("@img", FileUpload1.FileContent);
                insertCmd.Parameters.AddWithValue("@type", DropDownList1.SelectedValue.ToString());
                insertCmd.Parameters.AddWithValue("@amount", TextBox2.Text.ToString());
                insertCmd.Parameters.AddWithValue("@detail", TextBox3.Text.ToString());

                insertCmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("home.aspx");
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}