using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class compoundeddrug : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }

        Boolean CompoundingLog = Convert.ToBoolean(Session["CompoundingLog"]);
        if (!CompoundingLog)
        {
            Session["NotEnrollmessage"] = "NoCompoundingLog";
            Response.Redirect("dashboard.aspx");
        }

        if (!Page.IsPostBack)
        {
            CompounededDrugs co = new CompounededDrugs ();
            DataSet ds = co.GetCompoundedDrugs(Session["Site"].ToString(), txtStartDate.Text, txtEndDate.Text);
            ViewState["GridData"] = ds.Tables[0];
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
            popupform.Attributes.Add("class", "divdisplaynone");
            CheckedBy.Attributes.Add("class", "divdisplaynone");
        }

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        CompounededDrugs co = new CompounededDrugs();
        DataSet ds = co.GetCompoundedDrugs(Session["Site"].ToString(), txtStartDate.Text, txtEndDate.Text);
        ViewState["GridData"] = ds.Tables[0];
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
        popupform.Attributes.Add("class", "divdisplaynone");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = (DataTable)ViewState["GridData"];
        GridView1.DataBind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblCheckedBy = (Label)e.Row.FindControl("lblCheckedBy");
            Label lblPreparedBy = (Label)e.Row.FindControl("lblPreparedBy");
            //CheckBox chkGridCheckedBy = (CheckBox)e.Row.FindControl("chkGridCheckedBy");
            Button btnSaveStatus = (Button)e.Row.FindControl("btnSaveStatus");
            if (lblCheckedBy.Text == String.Empty)
            {
                e.Row.CssClass = "data-table-pastdue";
            }
            else
            {
                //chkGridCheckedBy.Checked = true;
                btnSaveStatus.Visible = false;
            }
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        CompounededDrugs co = new CompounededDrugs();

        
        DataSet ds = co.GetCompoundedDrugsByID(GridView1.SelectedDataKey.Value.ToString ());
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            ID.Value = GridView1.SelectedDataKey.Value.ToString();

            DateTime dateEntered = Convert.ToDateTime(dr["Date_entered"].ToString());
            lblDateEntered.Text = dateEntered.ToShortDateString();

            if (dr["Drug"] != DBNull.Value)
            {
                txtDrug.Text = dr["Drug"].ToString();
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

            if (dr["Internal_Lot_Number"] != DBNull.Value)
            {
                txtLot.Text = dr["Internal_Lot_Number"].ToString();
            }
            else
            {
                txtLot.Text = "";
            }

            if (dr["Expiry_Date"] != DBNull.Value)
            {
                txtExpiryDate.Text  = Convert.ToDateTime (dr["Expiry_Date"].ToString()).ToShortDateString ();
            }
            else
            {
                txtExpiryDate.Text = "";
            }

            if (dr["Expiry_Time"] != DBNull.Value)
            {
                txtExpiryTime.Text = dr["Expiry_Time"].ToString();
            }
            else
            {
                txtExpiryTime.Text = "";
            }

            if (dr["PreparedBy"] != DBNull.Value)
            {
                lblEnteredBy.Text = dr["PreparedBy"].ToString();
            }
            else
            {
                lblEnteredBy.Text = "NA";
            }

            if (dr["CheckedBy"] != DBNull.Value)
            {
                lblCheckedBy.Text = dr["CheckedBy"].ToString();
            }
            else
            {
                lblCheckedBy.Text = "NA";
            }
            popupform.Attributes.Add("class", "taskLogsTracking");
        }
        
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        CompounededDrugs co = new CompounededDrugs();
        DataSet ds = co.GetCompoundedDrugs(Session["Site"].ToString(), txtStartDate.Text, txtEndDate.Text);
        DataTable dt = ds.Tables[0];
        dt.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    private string GetSortDirection(string column)
    {

        // By default, set the sort direction to ascending.
        string sortDirection = "ASC";

        // Retrieve the last column that was sorted.
        string sortExpression = ViewState["SortExpression"] as string;

        if (sortExpression != null)
        {
            // Check if the same column is being sorted.
            // Otherwise, the default value can be returned.
            if (sortExpression == column)
            {
                string lastDirection = ViewState["SortDirection"] as string;
                if ((lastDirection != null) && (lastDirection == "ASC"))
                {
                    sortDirection = "DESC";
                }
            }
        }

        // Save new values in ViewState.
        ViewState["SortDirection"] = sortDirection;
        ViewState["SortExpression"] = column;

        return sortDirection;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        popupform.Attributes.Add("class", "taskLogsTracking");
    }

    protected void ClearForm()
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
        txtExpiryTime.Text = "";
        lblEnteredBy.Text = "";
        lblCheckedBy.Text = "";
    }

    protected void cmdSave_Click(object sender, EventArgs e)
    {
        try
        {
            CompounededDrugs co = new CompounededDrugs();
            co.AddUpdateCompoundedDrugs(ID.Value, Session["Site"].ToString(), txtDrug.Text, txtStrength.Text, txtConcentration.Text, txtQty.Text, txtForm.Text, txtSize.Text, txtLot.Text, txtExpiryDate.Text, txtExpiryTime.Text, Session["FullName"].ToString());
            ClearForm();
            DataSet ds = co.GetCompoundedDrugs(Session["Site"].ToString(), txtStartDate.Text, txtEndDate.Text);
            ViewState["GridData"] = ds.Tables[0];
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
            popupform.Attributes.Add("class", "divdisplaynone");
        }
        catch
        {
            lblError.Text = "Error";
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Details")
        {
            Response.Redirect("~/compoundeddrugdetails.aspx?CompoundedDrugID=" + e.CommandArgument);
        }
        if (e.CommandName == "SaveActivity")
        {
            CheckedBy.Attributes.Add("class", "CheckedBy");
            string[] split = e.CommandArgument.ToString().Split(';');
            hdnCompoundedDrugID.Value = split[0];
            if (split[1] != String.Empty)
            {
                chkCheckBy.Checked = true;
            }
            else
            {
                chkCheckBy.Checked = false;
            }
        }
    }
    protected  string  FormatDate(string input)
    {
        return Convert.ToDateTime ( input).ToShortDateString ();
    }
    protected void btnCheckedByClose_Click(object sender, EventArgs e)
    {
        CheckedBy.Attributes.Add("class", "divdisplaynone");
        chkCheckBy.Checked = false;
    }
    protected void btnSaveCheckedBy_Click(object sender, EventArgs e)
    {
        CompounededDrugs co = new CompounededDrugs();
        co.UpdateCompoundedDrugsCheckedBy(hdnCompoundedDrugID.Value, Session["FullName"].ToString());
        DataSet ds = co.GetCompoundedDrugs(Session["Site"].ToString(), txtStartDate.Text, txtEndDate.Text);
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
        CheckedBy.Attributes.Add("class", "divdisplaynone");
        chkCheckBy.Checked = false;
    }
    protected void btnCloseCheckedBy_Click(object sender, EventArgs e)
    {
        CheckedBy.Attributes.Add("class", "divdisplaynone");
        chkCheckBy.Checked = false;
    }
    protected void PopUpClose_Click(object sender, EventArgs e)
    {
        ClearForm();
        popupform.Attributes.Add("class", "divdisplaynone");
    }
    protected void CmdCancel_Click(object sender, EventArgs e)
    {
        ClearForm();
        popupform.Attributes.Add("class", "divdisplaynone");
    }
}