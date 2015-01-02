using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class manageequipment : System.Web.UI.Page
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
            EquipmentDB eq = new EquipmentDB();
            DataSet ds = eq.GetEquipment();
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        } 
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtEquipment.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
        EquipmentID.Value = GridView1.SelectedDataKey.Value.ToString();
        lblError.Text = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            EquipmentDB eq = new EquipmentDB();
            eq.AddUpdateEquipment(EquipmentID.Value, txtEquipment.Text);
            EquipmentID.Value = "";
            txtEquipment.Text = "";
            lblError.Text = "Transaction completed";
            lblError.CssClass = "success";
            DataSet ds = eq.GetEquipment();
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = "Error";
            lblError.CssClass = "error";
        }
        GridView1.DataBind();
    }
    protected void cmdDelete_Click(object sender, EventArgs e)
    {
        try
        {
            EquipmentDB eq = new EquipmentDB();
            eq.DeleteEquipment(EquipmentID.Value);
            EquipmentID.Value = "";
            txtEquipment.Text = "";
            lblError.Text = "Transaction completed";

            DataSet ds = eq.GetEquipment();
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
        EquipmentID.Value = "";
        txtEquipment.Text = "";
        lblError.Text = "";
    }
}