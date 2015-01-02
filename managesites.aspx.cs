using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class managesites : System.Web.UI.Page
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
            SiteDB s = new SiteDB();
            DataSet ds = s.GetSites();
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SiteID.Value = GridView1.SelectedDataKey.Value.ToString();
        SiteDB s = new SiteDB();
        DataSet ds = s.GetSite(SiteID.Value);
        lblError.Text = "";
        if (ds.Tables[0].Rows.Count > 0)
        {
            if (ds.Tables[0].Rows[0]["SiteName"] != DBNull.Value)
            {
                txtSiteName.Text = ds.Tables[0].Rows[0]["SiteName"].ToString();
            }
            else
            {
                txtSiteName.Text = "";
            }

            if (ds.Tables[0].Rows[0]["Active"] != DBNull.Value)
            {
                chkActive.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["Active"].ToString());
            }
            else
            {
                chkActive.Checked = false;
            }

            if (ds.Tables[0].Rows[0]["Interventions"] != DBNull.Value)
            {
                chInterventions.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["Interventions"].ToString());
            }
            else
            {
                chInterventions.Checked = false;
            }

            if (ds.Tables[0].Rows[0]["TempTaskLog"] != DBNull.Value)
            {
                chTempTaskLog.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["TempTaskLog"].ToString());
            }
            else
            {
                chTempTaskLog.Checked = false;
            }

            if (ds.Tables[0].Rows[0]["WarfarinTracking"] != DBNull.Value)
            {
                chWarfarinTracking.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["WarfarinTracking"].ToString());
            }
            else
            {
                chWarfarinTracking.Checked = false;
            }

            if (ds.Tables[0].Rows[0]["AntibioticTracking"] != DBNull.Value)
            {
                chAntibioticTracking.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["AntibioticTracking"].ToString());
            }
            else
            {
                chAntibioticTracking.Checked = false;
            }

            if (ds.Tables[0].Rows[0]["TaskLogsTracking"] != DBNull.Value)
            {
                chTaskLogsTracking.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["TaskLogsTracking"].ToString());
            }
            else
            {
                chTaskLogsTracking.Checked = false;
            }

            if (ds.Tables[0].Rows[0]["CompoundingLog"] != DBNull.Value)
            {
                chCompoundingLog.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["CompoundingLog"].ToString());
            }
            else
            {
                chCompoundingLog.Checked = false;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SiteDB s = new SiteDB();
            s.AddUpdateSite(SiteID.Value, txtSiteName.Text,
                chkActive.Checked, chInterventions.Checked,
                chTempTaskLog.Checked, chAntibioticTracking.Checked,
                chWarfarinTracking.Checked, chTaskLogsTracking.Checked, chCompoundingLog.Checked);
            lblError.Text = "Transaction Completed";
            lblError.CssClass = "success";
            txtSiteName.Text = "";
            SiteID.Value = "";
            chkActive.Checked = false;
            chAntibioticTracking.Checked = false;
            chInterventions.Checked = false;
            chTempTaskLog.Checked = false;
            chWarfarinTracking.Checked = false;
            chTaskLogsTracking.Checked = false;
            chCompoundingLog.Checked = false;
            DataSet ds = s.GetSites();
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
        SiteDB s = new SiteDB();
        txtSiteName.Text = "";
        SiteID.Value = "";
        lblError.Text = "";
        chkActive.Checked = false;
        chAntibioticTracking.Checked = false;
        chInterventions.Checked = false;
        chTempTaskLog.Checked = false;
        chWarfarinTracking.Checked = false;
        DataSet ds = s.GetSites();
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }
}