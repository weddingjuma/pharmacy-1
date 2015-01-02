using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageInrGoal : System.Web.UI.Page
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
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Warfarin w = new Warfarin();
            w.AddUpdateWarfarinInr(InrID.Value, txtInrGoal.Text, txtDescription.Text);
            InrID.Value = "";
            txtInrGoal.Text = "";
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
        InrID.Value = "";
        txtInrGoal.Text = "";
        txtDescription.Text = "";
        lblError.Text = "";
    }
    protected void CmdDelete_Click(object sender, EventArgs e)
    {
        try
        {
            Warfarin w = new Warfarin();
            w.DeleteWarfarinInr(InrID.Value);
            InrID.Value = "";
            txtInrGoal.Text = ""; 
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
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtInrGoal.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
        txtDescription.Text = Server.HtmlDecode(GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text);
        InrID.Value = GridView1.SelectedDataKey.Value.ToString();
        lblError.Text = "";
    }
}