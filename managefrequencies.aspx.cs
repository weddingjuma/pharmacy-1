using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class managefrequencies : System.Web.UI.Page
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
        txtFrequency.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
        txtDescription.Text =Server.HtmlDecode ( GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text).Trim ();
        FrequencyID.Value = GridView1.SelectedDataKey.Value.ToString();
        lblError.Text = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            frequencies d = new frequencies();
            d.AddUpdateFrequency(FrequencyID.Value, txtFrequency.Text, txtDescription.Text);
            FrequencyID.Value = "";
            txtFrequency.Text = "";
            txtDescription.Text = "";
            lblError.Text = "Transaction completed";
            lblError.CssClass = "success";
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = "Error";
            lblError.CssClass = "error";
        }
    }
    protected void cmDelete_Click(object sender, EventArgs e)
    {
        try
        {
            frequencies d = new frequencies();
            d.DeleteFrequency(FrequencyID.Value);
            FrequencyID.Value = "";
            txtFrequency.Text = "";
            txtDescription.Text = "";
            lblError.Text = "Transaction completed";
            lblError.CssClass = "success";
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
        FrequencyID.Value = "";
        txtFrequency.Text = "";
        txtDescription.Text = "";
        lblError.Text = "";
    }
}