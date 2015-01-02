using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class allergies : System.Web.UI.Page
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
        if (Page.IsPostBack) return;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        AllergyID.Value = GridView1.SelectedDataKey.Value.ToString();
        txtAllergy.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text.ToString();
        lblError.Text = "";
    }
    protected void cmdSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            Allergies al = new Allergies();
            al.AddUpdateAllergy(AllergyID.Value, txtAllergy.Text);
            lblError.Text = "Transaction Completed";
            lblError.CssClass = "success";
            AllergyID.Value = "";
            txtAllergy.Text = "";
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
        AllergyID.Value = "";
        txtAllergy.Text = "";
        lblError.Text = "";
        GridView1.DataBind();
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            Allergies al = new Allergies();
            al.DeleteAllergy(AllergyID.Value);
            AllergyID.Value = "";
            txtAllergy.Text = "";
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
}