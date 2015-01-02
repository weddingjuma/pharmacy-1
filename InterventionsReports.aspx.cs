using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

public partial class InterventionsReports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }
        if (Session["UserRole"].ToString() != "3" && Session["UserRole"].ToString() != "2")
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }

        if (!Page.IsPostBack)
        {
            string location = Server.MapPath("Reports/Interventions/");
            string[] fileList = Directory.GetFiles(location, "*.rpt", SearchOption.TopDirectoryOnly);
            List<string> files = new List<string>();
            foreach (string file in fileList)
            {
                files.Add(file.Replace(location, ""));
            }
            ddlReportName.DataSource = files;
            ddlReportName.DataBind();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string location = "Reports/Interventions/";
        Session["StartDate"] = txtStartDate.Text;
        Session["EndDate"] = txtEndDate.Text;
        Session["ReportPathName"] = location + ddlReportName.SelectedItem.Value;
        if (ddlUserList.SelectedItem.Value != "All")
        {
            Session["SelectedUser"] = ddlUserList.SelectedItem.Value;
        }
        Response.Redirect("~/InterventionReportView.aspx");
    }
    protected void ddlReportName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlReportName.SelectedItem.Text == "InterventionsByUser.rpt")
        {
            ddlUserList.Enabled = true;
            Users u = new Users();
            DataSet ds = u.GetSitesUsers(Session["Site"].ToString());
            ddlUserList.DataSource = ds.Tables[0];
            ddlUserList.DataTextField = "FullName";
            ddlUserList.DataValueField = "FullName";
            ddlUserList.DataBind();
        }
        else
        {
            ddlUserList.Enabled = false;
            ddlUserList.Items.Clear();
            ddlUserList.Items.Add("All");
            Session["SelectedUser"] = null;
        }
    }
}