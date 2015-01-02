using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Interventions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }

        if (Session["UserRole"].ToString() == "3" || Session["UserRole"].ToString() == "2")
        {
            btnReports.Visible = true;
        }

        Boolean Interventions = Convert.ToBoolean(Session["Interventions"]);
        if (!Interventions)
        {
            Session["NotEnrollmessage"] = "NoInterventions";
            Response.Redirect("dashboard.aspx");
        }

        if (!Page.IsPostBack)
        {
            InterventionsDB I = new InterventionsDB();
            DataSet ds = I.GetPatientsInerventions(Convert.ToInt32(Session["Site"]));
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string patientId = GridView1.SelectedDataKey.Values["PatientID"].ToString();
        //string interventionsId = GridView1.SelectedDataKey.Values["InterventionsID"].ToString();
        Response.Redirect("~/InterventionsDetails.aspx?patientId=" + patientId);
    }
    protected void btnWizard_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/WizardPatient.aspx");
    }
    protected void btnAddNewPatientIntervention_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AddNewPatient.aspx");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        InterventionsDB I = new InterventionsDB();
        DataSet ds = I.GetInterventionsByPatientName(txtSearchName.Text, Convert.ToInt32(Session["Site"]));
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = (int)GridView1.DataKeys[e.RowIndex].Value;
        InterventionsDB I = new InterventionsDB();
        I.DeletePatient(id);
        DataSet ds = I.GetPatientsInerventions(Convert.ToInt32(Session["Site"]));
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        InterventionsDB I = new InterventionsDB();
        DataSet ds = I.GetPatientsInerventions(Convert.ToInt32(Session["Site"]));
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
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        InterventionsDB I = new InterventionsDB();
        GridView1.PageIndex = e.NewPageIndex;
        DataSet ds = I.GetPatientsInerventions(Convert.ToInt32(Session["Site"]));
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }
    protected void btnReports_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/InterventionsReports.aspx");
    }
}