using System;
using System.Collections.Generic;
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
using System.IO;
using System.Text;
using System.Web.SessionState;

namespace project
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null)
                {
                    Response.Redirect("home.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpCookie email = new HttpCookie("email");
            

            if (con.State == ConnectionState.Closed)
                con.Open();
            
            String selectQry = "select email from [users] where email='" + TextBox1.Text.ToString() + "' and password='" + MyEncrypt(TextBox2.Text.ToString()) + "'";
            SqlCommand selectCmd = new SqlCommand(selectQry, con);
            SqlDataReader selectReader = selectCmd.ExecuteReader();
            if (selectReader.Read())
            {
                Session["user"] = selectReader.GetValue(0).ToString();
                con.Close();
                Label1.Text = "";
                email.Value = TextBox1.Text.ToString();
                Response.Cookies.Add(email);
                //ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(),
                //      "onLogIn('" + TextBox1.Text.ToString() + "');", true);
                Response.Redirect("home.aspx");
            }
            else
            {
                Label1.Text = "Invalid credentials";
                con.Close();
            }
        }
        private string MyEncrypt(string returnText)
        {
            string EncryptionKey = "E5C2B81A3B2B2";
            byte[] clearBytes = Encoding.Unicode.GetBytes(returnText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    returnText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return returnText;
        }
    }
}