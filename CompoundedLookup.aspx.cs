using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CompoundedLookup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserRole"] != null)
        {
            if (Session["UserRole"].ToString() != "3")
            {
                Response.Redirect("~/dashboard.aspx");
            }
        }
        else
        {
            Response.Redirect("~/login.aspx");
        }
        if (!Page.IsPostBack)
        {
            //Support su = new Support();
            CompounededDrugs co = new CompounededDrugs();
            DataSet ds = co.GetCompoundedLookup("","");
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        CompounededDrugs co = new CompounededDrugs ();
        DataSet ds = co.GetCompoundedLookupByID(GridView1.SelectedDataKey.Value.ToString ());
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            if (dr["name"] != DBNull.Value)
            {
                txtname.Text = dr["name"].ToString();
            }
            else
            {
                txtname.Text = "";
            }
            if (dr["type"] != DBNull.Value)
            {
                ddltype.SelectedValue  = dr["type"].ToString();
            }
            else
            {
                ddltype.ClearSelection();
            }
        }
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        txtname.Text = "";
        ddltype.ClearSelection();
        ID.Value = "";
    }
    protected void cmdSave_Click(object sender, EventArgs e)
    {
        CompounededDrugs co = new CompounededDrugs();
        co.AddLookup(ID.Value, txtname.Text, ddltype.SelectedValue);
        lblError.Text = "Transaction completed";
        DataSet ds = co.GetCompoundedLookup("","");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        CompounededDrugs co = new CompounededDrugs();
        co.DeleteLookup( GridView1.DataKeys[ e.RowIndex].Value.ToString () );
        DataSet ds = co.GetCompoundedLookup("","");
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }
}