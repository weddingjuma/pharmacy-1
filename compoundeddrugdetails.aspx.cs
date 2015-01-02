using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class compoundeddrugdetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }
        if (Session["UserRole"].ToString() == "2" || Session["UserRole"].ToString() == "3")
        {
            cmdDelete.Visible = true;
        }
        else
        {
            cmdDelete.Visible = false;
        }

        //autorization for this option will go here
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["CompoundedDrugID"] != null)
            {
                CompoundedDrugID.Value = Request.QueryString["CompoundedDrugID"];
                CompounededDrugs co = new CompounededDrugs ();
                DataSet ds_cd = co.GetCompoundedDrugsByID(CompoundedDrugID.Value);
                lblCompoundedDrug.Text = ds_cd.Tables[0].Rows[0]["Drug"].ToString();
                DataSet ds = co.GetCompoundedDrugsDetails(CompoundedDrugID.Value);
                ViewState ["CompoundedDrugsDetails"]=ds.Tables[0];
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
                popupform.Attributes.Add("class", "divdisplaynone");
            }
        }
    }
    protected void cmdSave_Click(object sender, EventArgs e)
    {
        CompounededDrugs co = new CompounededDrugs();

        co.AddUpdateCompoundedDrugsDetails(ID.Value, CompoundedDrugID.Value, txtDrug.Text, txtStrength.Text, txtConcentration.Text, txtQty.Text, txtForm.Text, txtSize.Text, txtLot.Text, txtExpiryDate.Text, txtDrugManufacturer.Text);
        clearForm();
        DataSet ds = co.GetCompoundedDrugsDetails(CompoundedDrugID.Value);
        ViewState["CompoundedDrugsDetails"] = ds.Tables[0];
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
        popupform.Attributes.Add("class", "divdisplaynone");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        CompounededDrugs co = new CompounededDrugs();


        DataSet ds = co.GetCompoundedDrugsDetailsByID (GridView1.SelectedDataKey.Value.ToString());
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            ID.Value = GridView1.SelectedDataKey.Value.ToString();

            if (dr["Additive"] != DBNull.Value)
            {
                txtDrug.Text = dr["Additive"].ToString();
            }
            else
            {
                txtDrug.Text = "";
            }

            if (dr["Strength"] != DBNull.Value)
            {
                txtStrength.Text = dr["Strength"].ToString();
            }
            else
            {
                txtStrength.Text = "";
            }

            if (dr["Concentration"] != DBNull.Value)
            {
                txtConcentration.Text = dr["Concentration"].ToString();
            }
            else
            {
                txtConcentration.Text = "";
            }

            if (dr["Form"] != DBNull.Value)
            {
                txtForm.Text = dr["Form"].ToString();
            }
            else
            {
                txtQty.Text = "";
            }

            if (dr["Qty"] != DBNull.Value)
            {
                txtQty.Text = dr["Qty"].ToString();
            }
            else
            {
                txtQty.Text = "";
            }

            if (dr["Size"] != DBNull.Value)
            {
                txtSize.Text = dr["Size"].ToString();
            }
            else
            {
                txtSize.Text = "";
            }

            if (dr["Lot_Number"] != DBNull.Value)
            {
                txtLot.Text = dr["Lot_Number"].ToString();
            }
            else
            {
                txtLot.Text = "";
            }

            if (dr["Mfg_expiry_date"] != DBNull.Value)
            {
                txtExpiryDate.Text =Convert.ToDateTime ( dr["Mfg_expiry_date"].ToString()).ToShortDateString ();
            }
            else
            {
                txtExpiryDate.Text = "";
            }

            if (dr["Drug_Manufacturer"] != DBNull.Value)
            {
                txtDrugManufacturer.Text = dr["Drug_Manufacturer"].ToString();
            }
            else
            {
                txtDrugManufacturer.Text = "";
            }

            
            popupform.Attributes.Add("class", "taskLogsTracking");
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = (DataTable)ViewState["CompoundedDrugsDetails"];
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        popupform.Attributes.Add("class", "taskLogsTracking");
    }
    protected void clearForm()
    {
        ID.Value = "";
        txtDrug.Text = "";
        txtConcentration.Text = "";
        txtForm.Text = "";
        txtQty.Text = "";
        txtSize.Text = "";
        txtLot.Text = "";
        txtStrength.Text = "";
        txtExpiryDate.Text = "";
        txtDrugManufacturer.Text = "";
    }
    protected void cmdReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/compoundeddrug.aspx");
    }
    protected void cmdDelete_Click(object sender, EventArgs e)
    {
        try
        {
            CompounededDrugs co = new CompounededDrugs();
            co.DeleteCompoundedDrugsDetails(ID.Value);
            popupform.Attributes.Add("class", "divdisplaynone");
            ID.Value = "";
            DataSet ds = co.GetCompoundedDrugsDetails(CompoundedDrugID.Value);
            ViewState["CompoundedDrugsDetails"] = ds.Tables[0];
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
        catch (Exception ex)
        { 

        }
    }
}