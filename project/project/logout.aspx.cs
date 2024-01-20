using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project.js
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //HttpCookie email = Response.Cookies.Get("email");
            Response.Cookies.Clear();
            Session.Clear();
            Session.Abandon();
            Session.Clear();
            Response.Redirect("login.aspx");
        }
    }
}