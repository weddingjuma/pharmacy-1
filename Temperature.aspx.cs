using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Temperature : System.Web.UI.Page
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
            TemperatureDB tdb = new TemperatureDB();
            DataSet ds = tdb.GetTemperatures();
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        } 
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            TemperatureDB tdb = new TemperatureDB();
            tdb.AddUpdateTemperature(TemperatureID.Value, txtTemperature.Text);
            TemperatureID.Value = "";
            txtTemperature.Text = "";
            lblError.Text = "Transaction completed";
            lblError.CssClass = "success";
            DataSet ds = tdb.GetTemperatures();
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = "Error Updating!";
            lblError.CssClass = "error";
        }
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        TemperatureID.Value = "";
        txtTemperature.Text = "";
        lblError.Text = "";
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            TemperatureDB tdb = new TemperatureDB();
            tdb.DeleteTemperature(TemperatureID.Value);
            TemperatureID.Value = "";
            txtTemperature.Text = "";
            lblError.Text = "Transaction completed";
            lblError.CssClass = "success";
            DataSet ds = tdb.GetTemperatures();
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = "Error deleting!";
            lblError.CssClass = "error";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtTemperature.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
        TemperatureID.Value = GridView1.SelectedDataKey.Value.ToString();
        lblError.Text = "";
    }
}