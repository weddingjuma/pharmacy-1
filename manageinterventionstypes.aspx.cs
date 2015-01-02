using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class manageinterventionstypes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserRole"] != null)
        {
            if (Session["UserRole"].ToString() != "3")
            {
                Response.Redirect("~/default.aspx");
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
            ddlSites.Items.Clear();
            ddlSites.DataSource = ds.Tables[0];
            ddlSites.DataValueField = "ID";
            ddlSites.DataTextField = "SiteName";
            ddlSites.DataBind();
            int siteItemsCount = 0;
            foreach (ListItem item in ddlSites.Items)
            {
                if (item.Value == Session["Site"].ToString())
                {
                    ddlSites.SelectedIndex = siteItemsCount;
                }
                siteItemsCount++;
            }
            
            InterventionsDB i = new InterventionsDB();
            DataSet ds_i = i.GetInterventionTypesBySite(Session["Site"].ToString());
            GridView1.DataSource = ds_i.Tables[0];
            GridView1.DataBind();
            
            hdnSite.Value = Session["Site"].ToString();
        }
        
        if (Page.IsPostBack) return;
    }
    protected void cmdSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            InterventionsDB I = new InterventionsDB();
            I.AddUpdateInterventionTypes(InterventionID.Value, txtIntervention.Text, txtCost.Text, hdnSite.Value);
            lblMessage.Text = "Transaction Completed";
            lblMessage.CssClass = "success";
            txtCost.Text = "";
            txtIntervention.Text = "";
            InterventionID.Value = "";
            InterventionsDB i = new InterventionsDB();
            DataSet ds_i = i.GetInterventionTypesBySite(hdnSite.Value);
            GridView1.DataSource = ds_i.Tables[0];
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error";
            lblMessage.CssClass = "error";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        InterventionID.Value = GridView1.SelectedDataKey.Value.ToString();
        txtIntervention.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text.ToString();
        txtCost.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text.ToString();
        lblMessage.Text = "";
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        lblMessage.CssClass = "success";
        txtCost.Text = "";
        txtIntervention.Text = "";
        InterventionID.Value = "";
        InterventionsDB i = new InterventionsDB();
        DataSet ds_i = i.GetInterventionTypesBySite(hdnSite.Value);
        GridView1.DataSource = ds_i.Tables[0];
        GridView1.DataBind();
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            InterventionsDB I = new InterventionsDB();
            I.DeleteInterventionTypes(InterventionID.Value);
            lblMessage.Text = "Transaction Completed";
            lblMessage.CssClass = "success";
            txtCost.Text = "";
            txtIntervention.Text = "";
            InterventionID.Value = "";
            InterventionsDB i = new InterventionsDB();
            DataSet ds_i = i.GetInterventionTypesBySite(hdnSite.Value);
            GridView1.DataSource = ds_i.Tables[0];
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error";
            lblMessage.CssClass = "error";
        }
    }
    protected void ddlSites_SelectedIndexChanged(object sender, EventArgs e)
    {
        hdnSite.Value = ddlSites.SelectedItem.Value;
        InterventionsDB i = new InterventionsDB();
        DataSet ds_i = i.GetInterventionTypesBySite(hdnSite.Value);
        GridView1.DataSource = ds_i.Tables[0];
        GridView1.DataBind();
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        InterventionsDB i = new InterventionsDB();
        DataSet ds_i = i.GetInterventionTypesBySite(hdnSite.Value);
        DataTable dt = ds_i.Tables[0];
        dt.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    private string GetSortDirection(string column)
    {

        // By default, set the sort direction to ascending.
        string sortDirection = "ASC";

        // Retrieve the last column that was sorted.
        string sortExpression = ViewState["SortExpression"] as string;

        if (sortExpression != null)
        {
            // Check if the same column is being sorted.
            // Otherwise, the default value can be returned.
            if (sortExpression == column)
            {
                string lastDirection = ViewState["SortDirection"] as string;
                if ((lastDirection != null) && (lastDirection == "ASC"))
                {
                    sortDirection = "DESC";
                }
            }
        }

        // Save new values in ViewState.
        ViewState["SortDirection"] = sortDirection;
        ViewState["SortExpression"] = column;

        return sortDirection;
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        InterventionsDB i = new InterventionsDB();
        GridView1.PageIndex = e.NewPageIndex;
        DataSet ds_i = i.GetInterventionTypesBySite(hdnSite.Value);
        GridView1.DataSource = ds_i.Tables[0];
        GridView1.DataBind();
    }
}