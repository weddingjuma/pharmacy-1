using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

public partial class AntibioticReports : System.Web.UI.Page
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

        string location = Server.MapPath("Reports/Antibiotics/");
        string[] fileList = Directory.GetFiles(location, "*.rpt", SearchOption.TopDirectoryOnly);
        List<string> files = new List<string>();
        foreach (string file in fileList)
        {
            files.Add(file.Replace(location, ""));
        }
        ddlReportName.DataSource = files;
        ddlReportName.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string location = "Reports/Antibiotics/";
        Session["StartDate"] = txtStartDate.Text;
        Session["EndDate"] = txtEndDate.Text;
        Session["ReportPathName"] = location + ddlReportName.SelectedItem.Value;
        Session["ReportName"] = ddlReportName.SelectedItem.Value;
        Response.Redirect("~/AntibioticReportView.aspx");
    }
}