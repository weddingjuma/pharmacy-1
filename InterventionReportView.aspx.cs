﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports;
using CrystalDecisions.CrystalReports.Engine;


public partial class InterventionReportView : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        GetInterventionsPerSiteByDate_Report();
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
    private void GetInterventionsPerSiteByDate_Report()
    {
        if ((Session["StartDate"] != null) && (Session["EndDate"] != null) && (Session["ReportPathName"] != null))
        {
            string startDate = Session["StartDate"].ToString();
            string endDate = Session["EndDate"].ToString();
            string selectedUser = "";
            if (Session["SelectedUser"] != null)
            {
                selectedUser = Session["SelectedUser"].ToString();
            }
            InterventionsDB i = new InterventionsDB();
            DataSet ds = i.GetInterventionsPerSiteByDate(Convert.ToInt32(Session["Site"]), startDate, endDate, selectedUser);
            ReportDocument RptDocument = new ReportDocument();
            RptDocument.Load(Server.MapPath(Session["ReportPathName"].ToString()));
            RptDocument.SetDataSource(ds.Tables[0]);
            CrystalReportViewer1.ReportSource = RptDocument;
            CrystalReportViewer1.DataBind();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/InterventionsReports.aspx");
    }
}