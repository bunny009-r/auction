using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace project
{
    /// <summary>
    /// Summary description for PhotoHandler
    /// </summary>
    public class PhotoHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);

            string user_id = context.Request.QueryString["user_id"].ToString();

            con.Open();
            SqlCommand sqlCommand = new SqlCommand("select mem_photo from [memberinfo] where user_id=" + user_id + "", con);
            SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            con.Close();
            context.Response.ContentType = "application/Image";
            context.Response.AddHeader("Content-Disposition", "attachment; filename=" + context.Request.QueryString["user_id"].ToString());
            byte[] myphoto = (byte[])ds.Tables[0].Rows[0]["mem_photo"];
            context.Response.BinaryWrite(myphoto);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}