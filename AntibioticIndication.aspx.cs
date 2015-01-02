using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AntibioticIndication : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserRole"] != null)
        {
            if (Session["UserRole"].ToString() != "3")
            {
                Response.Redirect("~/login.aspx");
            }
        }
        else
        {
            Response.Redirect("~/login.aspx");
        }
        if (Page.IsPostBack) return;
    }
    protected void cmdSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            Antibiotic an = new Antibiotic();
            an.AddUpdateAntibioticIndications(ID.Value, txtAntibioticIndication.Text);
            lblError.Text = "Transaction Completed";
            lblError.CssClass = "success";
            ID.Value = "";
            txtAntibioticIndication.Text = "";
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = "Error";
            lblError.CssClass = "error";
        }
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        ID.Value = "";
        txtAntibioticIndication.Text = "";
        lblError.Text = "";
        GridView1.DataBind();
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            Antibiotic an = new Antibiotic();
            an.DeleteAntibioticIndications(ID.Value);
            ID.Value = "";
            txtAntibioticIndication.Text = "";
            GridView1.DataBind();
            lblError.Text = "Transaction Completed";
            lblError.CssClass = "success";
        }
        catch (Exception ex)
        {
            lblError.Text = "Error deleteting";
            lblError.CssClass = "error";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ID.Value = GridView1.SelectedDataKey.Value.ToString();
        txtAntibioticIndication.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text.ToString();
        lblError.Text = "";
    }
}