using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class manageactions : System.Web.UI.Page
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
            DataSet ds = ac.GetActions();
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        } 
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            ActionsDB ac = new ActionsDB();
            ac.AddUpdateAction(ActionID.Value, txtAction.Text);
            ActionID.Value = "";
            txtAction.Text = "";
            lblError.Text = "Transaction completed";
            lblError.CssClass = "success";
            DataSet ds = ac.GetActions();
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = "Error Updating!";
            lblError.CssClass = "error";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtAction.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
        ActionID.Value = GridView1.SelectedDataKey.Value.ToString();
        lblError.Text = "";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            ActionsDB ac = new ActionsDB();
            ac.DeleteAction(ActionID.Value);
            ActionID.Value = "";
            txtAction.Text = "";
            lblError.Text = "Transaction completed";
            lblError.CssClass = "success";
            DataSet ds = ac.GetActions();
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = "Error deleting!";
            lblError.CssClass = "error";
        }

    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        ActionID.Value = "";
        txtAction.Text = "";
        lblError.Text = "";
    }
}