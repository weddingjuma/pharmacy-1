using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class tasklog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }

        Boolean TempTaskLog = Convert.ToBoolean(Session["TempTaskLog"]);
        if (!TempTaskLog)
        {
            Session["NotEnrollmessage"] = "tasklog";
            Response.Redirect("dashboard.aspx");
        }

        if (Session["UserRole"] != null)
        {
            if ((Session["UserRole"].ToString() == "3") || (Session["UserRole"].ToString() == "2"))
            {
                lblSite.Visible = true;
                SiteID.Visible = true;
                txtEquipment.Visible = true;
                txtTask.Visible = true;
                lblEquipment.Visible = true;
                lblTask.Visible = true;
                cmdSave.Visible = true;
                btnReports.Visible = true;
            }
            else
            {
                lblSite.Visible = false;
                SiteID.Visible = false;
                txtEquipment.Visible = false;
                txtTask.Visible = false;
                lblEquipment.Visible = false;
                lblTask.Visible = false;
                cmdSave.Visible = false;
                btnReports.Visible = false;
            }

            if (Session["UserRole"].ToString() == "2")
            {
                lblSiteName.Visible = true;
                SiteDB s = new SiteDB();
                DataSet ds_s = s.GetSite(Session["Site"].ToString());
                lblSiteName.Text = ds_s.Tables[0].Rows[0]["SiteName"].ToString();
                SiteID.Visible = false;
            }
            else 
            {
                lblSiteName.Visible = false;
                SiteID.Visible = true;
            }
            
            if (Session["UserRole"].ToString() == "1")
            {
                lblSite.Visible = true;
                lblSiteName.Visible = true;
                SiteDB s = new SiteDB();
                DataSet ds_s = s.GetSite(Session["Site"].ToString());
                lblSiteName.Text = ds_s.Tables[0].Rows[0]["SiteName"].ToString();

                SiteID.Visible = false;
                txtEquipment.Visible = false;
                txtTask.Visible = false;
                lblEquipment.Visible = false;
                lblTask.Visible = false;
                cmdSave.Visible = false;
                btnReports.Visible = false;
            }
        }
        else
        {
            Response.Redirect("~/default.aspx");
        }
        if (!Page.IsPostBack)
        {
            SiteDB s = new SiteDB();
            DataSet ds = s.GetSites();
            SiteID.DataSource = ds.Tables[0];
            SiteID.DataTextField = "SiteName";
            SiteID.DataValueField = "ID";
            SiteID.DataBind();
            if (Session["UserRole"].ToString() != "3") SiteID.SelectedValue = Session["Site"].ToString();
        } 

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("~/tasklogdetails.aspx?id=" + GridView1.SelectedDataKey.Value.ToString());
    }
    protected void cmdSave_Click(object sender, EventArgs e)
    {
        TaskDB t = new TaskDB();
        t.AddUpdateTaskLog(TaskID.Value, txtTask.Text, txtEquipment.Text, SiteID.SelectedValue);
        txtEquipment.Text = "";
        txtTask.Text = "";
        TaskID.Value = "";
        lblError.Text = "Transaction completed";
        GridView1.DataBind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //((LinkButton)e.Row.Cells[0].Controls[2]).OnClientClick = "return confirm('Do you really want to delete?');";

            //if (Session["UserRole"] != null)
            //{
            //    if (Session["UserRole"].ToString() == "3")
            //    {
            //        e.Row.Cells[1].Visible = true;
            //    }
            //    else
            //    {
            //        e.Row.Cells[1].Visible = false;
            //    }
            //}
            

        
        }
        //if (e.Row.Cells.Count > 1)
        //{
        //    if (Session["UserRole"].ToString() == "3")
        //    {

        //        e.Row.Cells[1].Visible = true;
        //    }
        //    else
        //    {
        //        e.Row.Cells[1].Visible = false;
        //    }
        //}
    }
    protected void btnReports_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/TaskLogsReports.aspx");
    }
}