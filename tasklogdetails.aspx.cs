using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class tasklogdetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }

        Boolean TempTaskLog = Convert.ToBoolean(Session["TempTaskLog"]);
        if (!TempTaskLog)
        {
            Response.Redirect("dashboard.aspx");
        }

        if (Session["UserRole"] != null)
        {
            if ((Session["UserRole"].ToString() == "3") || (Session["UserRole"].ToString() == "2"))
            {
                btnReports.Visible = true;
            }
            else
            {
                btnReports.Visible = false;
            }
        }
        if (!Page.IsPostBack)
        {
            if (Request.QueryString ["id"]==null) return;
            TaskID.Value=Request.QueryString ["id"].ToString ();
            TaskDB t = new TaskDB();
            DataSet ds = t.GetTaskLog (TaskID.Value );
            if (ds.Tables[0].Rows.Count>0){
                SiteID.Value =ds.Tables[0].Rows[0]["SiteID"].ToString ();
            }


            if(ds.Tables[0].Rows[0]["Equipment"]!=DBNull.Value )
            {
                lblEquipment.Text = ds.Tables[0].Rows[0]["Equipment"].ToString();
            }

            if (ds.Tables[0].Rows[0]["Task"] != DBNull.Value)
            {
                lblTask.Text = ds.Tables[0].Rows[0]["Task"].ToString();
            }
            DataSet dstaskdetails=t.GetTaskLogDetails (TaskID.Value );
            GridView1.DataSource = dstaskdetails.Tables[0];
            GridView1.DataBind();

            //Users u = new Users();
            //DataSet dsUsers = u.GetUsersBySite(SiteID.Value);
            //ddlUser.DataSource = ds.Tables[0];
            //ddlUser.DataTextField = "FullName";
            //ddlUser.DataValueField = "userid";
            //ddlUser.DataBind ();

            //TemperatureDB tdb = new TemperatureDB();
            //DataSet dsTemp = tdb.GetTemperatures();
            //ddlTemp.DataSource = dsTemp.Tables[0];
            //ddlTemp.DataTextField = "Temperature";
            //ddlTemp.DataValueField = "ID";
            //ddlTemp.DataBind();

            //ActionsDB adb = new ActionsDB();
            //DataSet dsActions = adb.GetCorrectiveActions();
            //ddlAction.DataSource = dsActions.Tables[0];
            //ddlAction.DataTextField = "CorrectiveAction";
            //ddlAction.DataValueField = "CorrectiveActionID";
            //ddlAction.DataBind();

            //Users u = new Users();
            //DataSet dsUsers = u.GetSitesUsers(SiteID.Value);
            //ddlCompletedBy.DataSource = dsUsers.Tables[0];
            //ddlCompletedBy.DataTextField = "FullName";
            //ddlCompletedBy.DataValueField = "FullName";
            //ddlCompletedBy.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            TaskDB t = new TaskDB();
            t.AddUpdateTaskLogDetail(TaskLogDetailID.Value, TaskID.Value, txtDateCompleted.Text, txtTemperature.Text, txtAction.Text, Session["FullName"].ToString(), txtStatus.Text);
            lblError.Text = "Transaction completed";
            lblError.CssClass = "success";
            TaskLogDetailID.Value = "";
            txtDateCompleted.Text = "";
            txtStatus.Text = "";
            txtTemperature.Text = "";
            txtAction.Text = "";
            TaskLogDetailID.Value = "";
            DataSet ds = t.GetTaskLogDetails(TaskID.Value);
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
        string Id = GridView1.SelectedDataKey.Values["ID"].ToString();
        TaskDB t = new TaskDB();
        DataSet ds = t.GetTaskLogDetailsByID(Id);
        txtDateCompleted.Text = String.Format("{0:d}",ds.Tables[0].Rows[0][3]);

        txtTemperature.Text = ds.Tables[0].Rows[0][2].ToString();
        //string temp = ds.Tables[0].Rows[0][2].ToString();
        //int itemCount=0;
        //foreach (ListItem item in ddlTemp.Items)
        //{    
        //    if (temp == item.Text)
        //    {
        //        ddlTemp.SelectedIndex = itemCount;             
        //    }
        //    itemCount++;
        //}

        txtStatus.Text = ds.Tables[0].Rows[0][6].ToString();
        //string status = ds.Tables[0].Rows[0][6].ToString();
        //int statusItemCnt = 0;
        //foreach (ListItem statusItem in ddlStatus.Items)
        //{
        //    if (status == statusItem.Text)
        //    {
        //        ddlStatus.SelectedIndex = statusItemCnt;
        //    }
        //    statusItemCnt++;
        //}

        txtAction.Text = ds.Tables[0].Rows[0][5].ToString();
        //string action = ds.Tables[0].Rows[0][5].ToString();
        //int actionItemCnt = 0;
        //foreach (ListItem actionItem in ddlAction.Items)
        //{
        //    if (action == actionItem.Text)
        //    {
        //        ddlAction.SelectedIndex = actionItemCnt;
        //    }
        //    actionItemCnt++;
        //}

        string completedBy = ds.Tables[0].Rows[0][7].ToString();
        //int completedByCnt = 0;
        //foreach (ListItem completedByItem in ddlCompletedBy.Items)
        //{
        //    if (completedBy == completedByItem.Text)
        //    {
        //        ddlCompletedBy.SelectedIndex = completedByCnt;
        //    }
        //    completedByCnt++;
        //}

        TaskLogDetailID.Value = ds.Tables[0].Rows[0][0].ToString();
        TaskID.Value = ds.Tables[0].Rows[0][1].ToString();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        txtDateCompleted.Text = "";
        txtAction.Text = "";
        txtTemperature.Text = "";
        TaskLogDetailID.Value = "";
        txtStatus.Text = "";
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        TaskDB t = new TaskDB();
        DataSet dstaskdetails = t.GetTaskLogDetails(TaskID.Value);
        DataTable dt = dstaskdetails.Tables[0]; 
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
        TaskDB t = new TaskDB();
        GridView1.PageIndex = e.NewPageIndex;
        DataSet dstaskdetails = t.GetTaskLogDetails(TaskID.Value);
        GridView1.DataSource = dstaskdetails.Tables[0];
        GridView1.DataBind();
    }
    protected void btnReports_Click(object sender, EventArgs e)
    {
        Session["TaskLogDetailTaskID"] = Request.QueryString["id"].ToString();
        Response.Redirect("~/TaskLogDetailsReports.aspx");
    }
}