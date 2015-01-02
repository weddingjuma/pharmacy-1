using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class managecorrectiveactions : System.Web.UI.Page
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
            ActionsDB ac = new ActionsDB();
            DataSet ds = ac.GetCorrectiveActions();
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        } 
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            ActionsDB ac = new ActionsDB();
            ac.AddUpdateCorrectiveAction(CorrectiveActionID.Value, txtCorrectiveAction.Text);
            CorrectiveActionID.Value = "";
            txtCorrectiveAction.Text = "";
            lblError.Text = "Transaction completed";
            lblError.CssClass = "success";
            DataSet ds = ac.GetCorrectiveActions();
            GridView1.DataSource = ds.Tables[0];
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
        txtCorrectiveAction.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
        CorrectiveActionID.Value = GridView1.SelectedDataKey.Value.ToString();
        lblError.Text = "";
    }
    protected void cmdDelete_Click(object sender, EventArgs e)
    {
        try
        {
            ActionsDB ac = new ActionsDB();
            ac.DeleteCorrectiveAction(CorrectiveActionID.Value);
            CorrectiveActionID.Value = "";
            txtCorrectiveAction.Text = "";
            lblError.Text = "Transaction completed";
            lblError.CssClass = "success";
            DataSet ds = ac.GetCorrectiveActions();
            GridView1.DataSource = ds.Tables[0];
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
        CorrectiveActionID.Value = "";
        txtCorrectiveAction.Text = "";
        lblError.Text = "";
    }
}