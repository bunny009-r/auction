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
using System.Security.Policy;

namespace project
{
    public partial class signup : System.Web.UI.Page
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
            con.Open();
            string CheckEmailOnce = "select id from [users] where email ='" + email.Text.ToString() + "'";
            SqlCommand checkemailOnc = new SqlCommand(CheckEmailOnce, con);
            SqlDataReader readCheck = checkemailOnc.ExecuteReader();
            if (readCheck.HasRows)
            {
                lblErrorMsg.Text = "Email address is already exist. Please try with different email address.";
                lblErrorMsg.ForeColor = System.Drawing.Color.Red;
                con.Close();
            }
            else
            {
                con.Close();


                Random rnd = new Random();
                int myRandomNo = rnd.Next(10000000, 99999999);
                string activation_code = myRandomNo.ToString();

                con.Open();
                String insertQry = "insert into [users] (name,  email,number, password ) values (@name,@email,@number, @password)";
                SqlCommand insertCmd = new SqlCommand(insertQry, con);
                insertCmd.Parameters.AddWithValue("@name", name.Text.ToString());

                insertCmd.Parameters.AddWithValue("@email", email.Text.ToString());
                insertCmd.Parameters.AddWithValue("@password", MyEncrypt(pass.Text.ToString()));
                insertCmd.Parameters.AddWithValue("@number", number.Text.ToString());
                insertCmd.ExecuteNonQuery();
                con.Close();
                



                MailMessage mail = new MailMessage();
                mail.To.Add(email.Text.Trim());
                mail.From = new MailAddress("bidmasterauction@gmail.com");
                mail.Subject = "Thank you for registering with us.";
                string emailBody = "";

                // Add email body here
                emailBody += "<div style='color: #fff; background-color: #A02eff; padding: 20px;'>";
                emailBody += "<p style='text-align: center'><img src='https://thumbs.dreamstime.com/b/home-interior-logo-design-creative-modern-vector-image-ideas-inspiration-188864521.jpg' height='50px' width='50px'></p>";
                emailBody += "<p style='font-size: 18px; font-weight: 600; margin-top: 5px; text-align: center;'> MyAwesomeProject</p>";
                emailBody += "</div>";
                emailBody += "<div style='padding: 20px; border: 4px solid #A02eff; background-color: #fff;'>";
                emailBody += "<p style='font-size: 18px; font-weight: 600'> Hello " + name.Text.ToString() + "! </p>";
                emailBody += "<p> To activate your account click on the button below-</p>";
                emailBody += "<p style='text-align: center; margin: 24px 0;'><a href='" + "http://http://localhost:52301/Activate.aspx?activation_code=" + activation_code + "&email=" + Base64Encode(email.Text.Trim()) + "' style='border: 2px solid #A05eff; color: #fff; background-color: #A02eff; text-decoration: none; padding: 12px 20px;'> ACTIVATE ACCOUNT </a></p>";
                emailBody += "<p> Thank you for regestering with us.We will contact you ASAP.</p>";
                emailBody += "<p> If you have additional queries, please feel free to reach us at <span style='font-weight: 500;'> +91 XXXX XXX XXX </span> or drop us an email at <a href='#' style='text-decoration: none;'><span style='font-weight: 500; color: orange;'> project@support.com </span></a></p>";
                emailBody += "<p style='font-size: 18px; font-weight: 600'> Thanks </p>";
                emailBody += "<p> Project Admin </p>";
                emailBody += "</div>";
                emailBody += "<div style='color: #fff; background-color: #A02eff; padding: 20px;' >";
                emailBody += "<p style='text-align: center;'><a href='#'> Terms of use </a> | <a href='#'> Privacy Policy </a></p>";
                emailBody += "<p style='text-align: center;'><a href='#'> Unsubscribe </a></p>";
                emailBody += "</div>";

                mail.Body = emailBody;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Host = "smtp.gmail.com";   // Or your SMTP Server Address
                smtp.Credentials = new System.Net.NetworkCredential("bidmasterauction@gmail.com", "dmyuiiktpuqmnsia");    //SMTP username and password
                smtp.Send(mail);

                lblErrorMsg.Text = "You are Successfully registered.";
                lblErrorMsg.ForeColor = System.Drawing.Color.Red;
                con.Close();
            }
           
        }
        public static string Base64Encode(string plainText)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
            return System.Convert.ToBase64String(plainTextBytes);
        }
        public static string Base64Decode(string base64EncodedData)
        {
            var base64EncodedBytes = System.Convert.FromBase64String(base64EncodedData);
            return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
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