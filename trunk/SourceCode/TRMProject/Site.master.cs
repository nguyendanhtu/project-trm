using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccounLogin"] != null)
        {
            if (Session["AccounLogin"].ToString().Equals("Y"))
            {
                m_lhk_user_name.Text = "Xin chào: "+Session["UserName"].ToString();
            }
            else
            {
                Response.Redirect("/TRMProject/Account/Login.aspx");
            }
        }
        else
        {
            Response.Redirect("/TRMProject/Account/Login.aspx");
        }
    }
}
