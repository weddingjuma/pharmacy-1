using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ManageAntibioticCostSavingsLookup : System.Web.UI.Page
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
        if (Page.IsPostBack)
        {
            return;
        }
        else
        {
            Antibiotic a = new Antibiotic();
            DataSet ds = a.GetAntibioticsCostSavingsDaysTherapy(Session["Site"].ToString());
            if (ds.Tables[0].Rows.Count > 0)
                txtDaysTherapy.Text = ds.Tables[0].Rows[0]["Description"].ToString();
        }

    }
    protected void cmdSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string FreqNumber = "";
            string description = txtDescription.Text;
            string type = ddlType.SelectedItem.Text;
            decimal conversion = 0.0m;
            if (type == "Frequency")
            {
                conversion = (decimal)24 / Convert.ToInt32(description);
                description = "q" + description + "h";
                FreqNumber = txtDescription.Text;
            }
            decimal cost = 0;
            if (txtCost.Text != String.Empty)
            {
                cost = Convert.ToDecimal(txtCost.Text);
                if (type != "Frequency")
                    FreqNumber = "0";
            }
            Antibiotic A = new Antibiotic();
            DataSet ds = new DataSet();
            if (type == "Frequency")
            {
                ds = A.GetAntibioticsCostSavingsDaysTherapyByDescriptionType(type, description);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblError.Text = description + " and " + type + " already exist!";
                    lblError.CssClass = "error";
                }
                else
                {
                    AddUpdate(FreqNumber, description, type, conversion, cost, A);
                }
            }
            else 
            {
                AddUpdate(FreqNumber, description, type, conversion, cost, A);
            }
            
        }
        catch (Exception ex)
        {
            lblError.CssClass = "error";
            lblError.Text = "Error";
        }
    }

    private void AddUpdate(string FreqNumber, string description, string type, decimal conversion, decimal cost, Antibiotic A)
    {
        A.AddUpdateAntibioticsCostSavingsLookup(ID.Value, description, type, conversion, cost, FreqNumber);
        lblError.Text = "Transaction Completed";
        lblError.CssClass = "success";
        txtDescription.Text = "";
        txtCost.Text = "";
        ID.Value = "";
        ddlType.SelectedIndex = 0;
        GridView1.DataBind();
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        ID.Value = "";
        txtDescription.Text = "";
        txtCost.Text = "";
        ddlType.SelectedIndex = 0;
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ID.Value = GridView1.SelectedDataKey.Value.ToString();
        int typeCnt = 0;
        foreach (ListItem item in ddlType.Items)
        {
            if (GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text.ToString() == item.ToString())
            {
                ddlType.SelectedIndex = typeCnt;
            }
            typeCnt++;
        }

        string description = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text.ToString();
        if (ddlType.SelectedItem.Text == "Frequency")
        {
            string[] split = description.Split('q');
            string[] split2 = split[1].Split('h');
            description = split2[0];
        }
        txtDescription.Text = description;
        
        txtCost.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text.ToString();
        lblError.Text = "";
    }
    protected void btnDaysTherapy_Click(object sender, EventArgs e)
    {
        try
        {
            Antibiotic a = new Antibiotic();
            a.AddUpdateAntibioticsCostSavingsDaysTherapy(Session["Site"].ToString(), txtDaysTherapy.Text);
            lblDaysTherapyMessage.CssClass = "success";
            lblDaysTherapyMessage.Text = "Updated.";
        }
        catch (Exception ex)
        {
            lblDaysTherapyMessage.CssClass = "error";
            lblDaysTherapyMessage.Text = "Error";
        }
    }
}