using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace project
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null)
                {
                    Label1.Visible = false;
                    Label2.Visible = true;
                }
                else
                {
                    Label1.Visible = true;
                    Label2.Visible = false;
                }
            }
        }
    }
}