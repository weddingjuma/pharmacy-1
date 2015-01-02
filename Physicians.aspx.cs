using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Physicians : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["UserRole"] != null)
        //{
        //    if (Session["UserRole"].ToString() != "3")
        //    {
        //        Response.Redirect("~/default.aspx");
        //    }
        //}
        //else
        //{
        //    Response.Redirect("~/default.aspx");
        //}
        //if (Page.IsPostBack) return;
        if (!Page.IsPostBack)
        {
            Support su = new Support();
            DataSet ds = su.GetSites("");
            ddSite.DataSource = ds.Tables[0];
            ddSite.DataTextField = "SiteName";
            ddSite.DataValueField = "ID";
            ddSite.DataBind();
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Physician ph = new Physician();
        DataSet ds = ph.GetPhysicians(GridView1.SelectedDataKey.Value.ToString());
        if (ds.Tables[0].Rows.Count > 0)
        {
            PhysicianID.Value = ds.Tables[0].Rows[0]["PhysicianID"].ToString();
            if (ds.Tables[0].Rows[0]["PhysicianFirstName"] != DBNull.Value)
            {
                txtFirstName.Text = ds.Tables[0].Rows[0]["PhysicianFirstName"].ToString();
            }
            if (ds.Tables[0].Rows[0]["PhysicianLastName"] != DBNull.Value)
            {
                txtLastName.Text = ds.Tables[0].Rows[0]["PhysicianLastName"].ToString();
            }
            if (ds.Tables[0].Rows[0]["SiteID"] != DBNull.Value)
            {
                ddSite.SelectedValue = ds.Tables[0].Rows[0]["SiteID"].ToString();
            }
            if (ds.Tables[0].Rows[0]["PhysicianPhone"] != DBNull.Value)
            {
                txtPhone.Text = ds.Tables[0].Rows[0]["PhysicianPhone"].ToString();
            }
            if (ds.Tables[0].Rows[0]["PhysicianEmail"] != DBNull.Value)
            {
                txtEmail.Text = ds.Tables[0].Rows[0]["PhysicianEmail"].ToString();
            }
            if (ds.Tables[0].Rows[0]["Active"] != DBNull.Value)
            {
                if (Convert.ToBoolean(ds.Tables[0].Rows[0]["Active"]))
                {
                    chkActive.Checked = true;
                }
                else
                {
                    chkActive.Checked = false;
                }
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            Physician ph = new Physician();
            ph.AddUpdatePhysicians(PhysicianID.Value, ddSite.SelectedValue, txtFirstName.Text, txtLastName.Text, txtPhone.Text, txtPhone.Text, chkActive.Checked);
            lblError.Text = "Transaction Completed";
            lblError.CssClass = "success";
            PhysicianID.Value = "";
            ddSite.ClearSelection();
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPhone.Text = "";
            txtPhone.Text = "";
            chkActive.Checked = false;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = "Error";
            lblError.CssClass = "error";
        }
    }
    protected void btnnew_Click(object sender, EventArgs e)
    {
        lblError.Text = "";
        PhysicianID.Value = "";
        ddSite.ClearSelection();
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtPhone.Text = "";
        txtPhone.Text = "";
        chkActive.Checked = false;
        GridView1.DataBind();
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            Physician ph = new Physician();
            ph.DeletePhysician(PhysicianID.Value);
            lblError.Text = "Transaction Completed";
            lblError.CssClass = "success";
            PhysicianID.Value = "";
            ddSite.ClearSelection();
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPhone.Text = "";
            txtPhone.Text = "";
            chkActive.Checked = false;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = "Error";
            lblError.CssClass = "error";
        }
    }
}