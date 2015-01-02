using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageTaskLogSatus : System.Web.UI.Page
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
            TaskDB t = new TaskDB();
            t.AddUpdateTaskLogStatus(StatusID.Value, txtStatus.Text);
            StatusID.Value = "";
            txtStatus.Text = "";
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
        StatusID.Value = "";
        txtStatus.Text = "";
        lblError.Text = "";
    }
    protected void CmdDelete_Click(object sender, EventArgs e)
    {
        try
        {
            TaskDB t = new TaskDB();
            t.DeleteTaskLogStatus(StatusID.Value);
            StatusID.Value = "";
            txtStatus.Text = "";
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
        txtStatus.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
        StatusID.Value = GridView1.SelectedDataKey.Value.ToString();
        lblError.Text = "";
    }
}