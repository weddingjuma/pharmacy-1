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

public partial class AntibioticReportView : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        GetAntibioticReportsPerSiteByDate_Report();
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
    private void GetAntibioticReportsPerSiteByDate_Report()
    {
        if ((Session["StartDate"] != null) && (Session["EndDate"] != null) && (Session["ReportPathName"] != null))
        {
            string startDate = Session["StartDate"].ToString();
            string endDate = Session["EndDate"].ToString();
            Antibiotic a = new Antibiotic();
            DataSet ds = new DataSet();
            if (Session["ReportName"].ToString() == "AntibioticPrescribedByDate.rpt")
            {
                ds = a.GetAntibioticPrescribedPerSiteByDate(Convert.ToInt32(Session["Site"]), startDate, endDate);
            }
            if (Session["ReportName"].ToString() == "AntibioticIndicationByDate.rpt")
            {
                ds = a.GetAntibioticIndicationPerSiteByDate(Convert.ToInt32(Session["Site"]), startDate, endDate);
            }
            if (Session["ReportName"].ToString() == "Potential Cost Savings.rpt")
            {
                ds = a.GetAntibioticsCostSavingsTrackingRecommendedPerSiteByDate(Convert.ToInt32(Session["Site"]), startDate, endDate);
            }
            if (Session["ReportName"].ToString() == "Antibiotic Cost Savings.rpt")
            {
                ds = a.GetAntibioticsCostSavingsTrackingAcceptedPerSiteByDate(Convert.ToInt32(Session["Site"]), startDate, endDate);
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
        Response.Redirect("~/AntibioticReports.aspx");
    }
}