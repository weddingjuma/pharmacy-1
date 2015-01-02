using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ManageTasks : System.Web.UI.Page
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
            TaskDB t = new TaskDB();
            DataSet ds = t.GetTasks ();
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        } 
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            TaskDB t = new TaskDB();
            t.AddUpdateTask(TaskID.Value, txtTask.Text);
            lblError.Text = "Transaction completed";
            lblError.CssClass = "success";
            TaskID.Value = "";
            txtTask.Text = "";
            DataSet ds = t.GetTasks();
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
        txtTask.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
        TaskID.Value = GridView1.SelectedDataKey.Value.ToString();
        lblError.Text = "";
    }
    protected void cmdDelete_Click(object sender, EventArgs e)
    {
        try
        {
            TaskDB t = new TaskDB();
            t.DeleteTask(TaskID.Value);
            lblError.Text = "Transaction completed";
            lblError.CssClass = "success";
            TaskID.Value = "";
            txtTask.Text = "";
            DataSet ds = t.GetTasks();
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
        lblError.Text = "";
        TaskID.Value = "";
        txtTask.Text = "";
        TaskDB t = new TaskDB();
        DataSet ds = t.GetTasks();
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }
}