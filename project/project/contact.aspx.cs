using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Web.Caching;
using System.Xml.Linq;

namespace project
{
    public partial class contact : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            String insertQry = "insert into [contact] (name, email, subject, message) values (@name, @email, @subject, @message)";
            SqlCommand insertCmd = new SqlCommand(insertQry, con);
            insertCmd.Parameters.AddWithValue("@name", TextBox1.Text.ToString());
            insertCmd.Parameters.AddWithValue("@email", TextBox2.Text.ToString());
            insertCmd.Parameters.AddWithValue("@subject", TextBox3.Text.ToString());
            insertCmd.Parameters.AddWithValue("@message", TextBox4.Text.ToString());
            insertCmd.ExecuteNonQuery();
            con.Close();
        }
    }
}