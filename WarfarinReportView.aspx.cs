using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports;
using CrystalDecisions.CrystalReports.Engine;

public partial class WarfarinReportView : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        GetWarfarinReportsPerSiteByDate_Report();
    }
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
    }
    private void GetWarfarinReportsPerSiteByDate_Report()
    {
        if ((Session["StartDate"] != null) && (Session["EndDate"] != null) && (Session["ReportPathName"] != null))
        {
            string startDate = Session["StartDate"].ToString();
            string endDate = Session["EndDate"].ToString();
            Warfarin w = new Warfarin();
            DataSet ds = new DataSet();
            if (Session["ReportName"].ToString() == "WarfarinIndicationByDate.rpt")
            {
                ds = w.GetWarfarinIndicationPerSiteByDate(Convert.ToInt32(Session["Site"]), startDate, endDate);
            }
            if (Session["ReportName"].ToString() == "WarfarinTrackingByDate.rpt")
            {
                ds = w.GetWarfarinTrackingPerSiteByDate(Convert.ToInt32(Session["Site"]), startDate, endDate);
            }
            if (Session["ReportName"].ToString() == "WarfarinInrGoalByDate.rpt")
            {
                ds = w.GetWarfarinWarfarinInrGoalPerSiteByDate(Convert.ToInt32(Session["Site"]), startDate, endDate);
            }
            if (Session["ReportName"].ToString() == "WarfarinInrByDate.rpt")
            {
                ds = w.GetWarfarinLabsInrPerSiteByDate(Convert.ToInt32(Session["Site"]), startDate, endDate);
            }
            ReportDocument RptDocument = new ReportDocument();
            RptDocument.Load(Server.MapPath(Session["ReportPathName"].ToString()));
            RptDocument.SetDataSource(ds.Tables[0]);
            CrystalReportViewer1.ReportSource = RptDocument;
            CrystalReportViewer1.DataBind();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/WarfarinReports.aspx");
    }
}