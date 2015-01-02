using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblCurrentYear.Text = DateTime.Now.Year.ToString();

        adminmenu.Visible = false;

        if (Session["UserRole"] != null)
        {
            if (Session["UserRole"].ToString() == "3")
            {
                adminmenu.Visible = true;
            }
            else
            {
                adminmenu.Visible = false;
            }

            if ((Session["UserRole"].ToString() == "3") || (Session["UserRole"].ToString() == "2"))
            {
                btnReports.Visible = true;
            }
            else
            {
                btnReports.Visible = false;
            }
        }
        else
        {
            Response.Redirect("~/login.aspx");
        }

        if (Session["FullName"] != null)
        {
            lblFullName.Text = Session["FullName"].ToString();
        }

        if (Session["UserRole"].ToString() == "3")
        {
            return;
        }
    }
    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Users us = new Users();
        us.AddUserLog(Session["UserID"].ToString (), "Login");
        Session.Abandon();
        Response.Redirect("~/login.aspx");
    }
    protected void cmdProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/profile.aspx");
    }
    protected void btnReports_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UserLogReport.aspx");
    }
}
