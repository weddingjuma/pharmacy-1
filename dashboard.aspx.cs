using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }

        if (Session["NotEnrollmessage"] != null)
        {
            if (Session["NotEnrollmessage"].ToString() == "NoInterventions")
            {
                lblMessage.Text = "You not enrolled in Interventions";
                lblMessage.CssClass = "error";
            }
            if (Session["NotEnrollmessage"].ToString() == "tasklog")
            {
                lblMessage.Text = "You not enrolled in Temp/Tasklog";
                lblMessage.CssClass = "error";
            }
            if (Session["NotEnrollmessage"].ToString() == "tasklogtracking")
            {
                lblMessage.Text = "You not enrolled in Task Logs Tracking";
                lblMessage.CssClass = "error";
            }
            if (Session["NotEnrollmessage"].ToString() == "NoAntibioticTracking")
            {
                lblMessage.Text = "You not enrolled in Antibiotic Tracking";
                lblMessage.CssClass = "error";
            }
            if (Session["NotEnrollmessage"].ToString() == "NoWarfarinTracking")
            {
                lblMessage.Text = "You not enrolled in Warfarin Tracking";
                lblMessage.CssClass = "error";
            }
            if (Session["NotEnrollmessage"].ToString() == "NoCompoundingLog")
            {
                lblMessage.Text = "You not enrolled in Compounding Log";
                lblMessage.CssClass = "error";
            }
        }
    }
}