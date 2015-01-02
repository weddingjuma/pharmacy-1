using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class TaskLogsTracking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }

        Boolean TaskLogsTracking = Convert.ToBoolean(Session["TaskLogsTracking"]);
        if (!TaskLogsTracking)
        {
            Session["NotEnrollmessage"] = "tasklogtracking";
            Response.Redirect("dashboard.aspx");
        }

        if (!Page.IsPostBack)
        {
            newTaskLogsTracking.Attributes.Add("class", "divdisplaynone");
            confirmAnotherTaskPopUp.Attributes.Add("class", "divdisplaynone");

            string userRole = Session["UserRole"].ToString();
            if (userRole == "3")
            {
                Session["Site"] = "0";
                SiteDB sites = new SiteDB();
                DataSet dsSites = sites.GetSites();
                ddlSites.DataSource = dsSites.Tables[0];
                ddlSites.DataTextField = "SiteName";
                ddlSites.DataValueField = "ID";
                ddlSites.DataBind();
                ddlSites.Items.Insert(0, new ListItem("All", "0"));
                ddlSites.Visible = true;
                lblSite.Visible = true;
            }
            else
            {
                Session["Site"] = Session["Site"].ToString();
            }

            TaskLogsTarckingDB t = new TaskLogsTarckingDB();
            DataSet ds = t.GetTaskLogsTracking(Convert.ToInt32(Session["Site"]));
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }

        //GridView1.Attributes.Add("style", "word-break:break-all; word-wrap:break-word");    
    }
    protected void btnAddNewTaskLogsTracking_Click(object sender, EventArgs e)
    {
        newTaskLogsTracking.Attributes.Add("class", "taskLogsTracking");
        btnDeleteTaskLogs.Visible = false;

        //bind dropdowns
        BindDropDowns();
    }
    private void ClearAssignDefaultValues()
    {
        lblPastDueMessage.Text = "";
        txtTask.Text = "";
        txtAssignedTo.Text = "";
        txtComments.Text = "";
        txtDueDate.Text = "";
        ddlAmPM.SelectedIndex = 1;
        ddlEmailFrequency.SelectedIndex = 0;
        ddlFrequency.SelectedIndex = 0;
        ddlFrequency.Enabled = false;
        ddlHour.SelectedIndex = 0;
        ddlIsRecurring.SelectedIndex = 0;
        ddlMinutes.SelectedIndex = 0;
        ddlStatus.SelectedIndex = 1;
        ddlMonthlyFrequency.SelectedIndex = 0;
        ddlMonthlyFrequency.Enabled = false;
        ddlWeeklyFrequency.SelectedIndex = 0;
        ddlWeeklyFrequency.Enabled = false;
        rfvFrequency.Enabled = false;
        rfvMonthlyFrequency.Enabled = false;
        rfvWeeklyFrequency.Enabled = false;
        txtEmail.Text = "";
        lstEmailList.Items.Clear();
        lblCompletedBy.Text = "N/A";
        lblCompletedDate.Text = "N/A";
        hdnTaskLogsTrackingID.Value = "";
        if (Session["UserRole"].ToString() == "3")
        {
            ddlSitesNewTask.SelectedIndex = 0;
        }
    }
    private void BindDropDowns()
    {
        ddlHour.Items.Clear();
        for (int i = 1; i <= 12; i++)
        {
            ddlHour.Items.Add(new ListItem(i.ToString("00"),i.ToString()));
        }

        ddlMinutes.Items.Clear();
        for (int i = 0; i <= 59; i++)
        {
            ddlMinutes.Items.Add(new ListItem(i.ToString("00"), i.ToString()));
        }

        ddlMonthlyFrequency.Items.Clear();
        ddlMonthlyFrequency.Items.Add(new ListItem("Select","0"));
        for (int i = 1; i <= 31; i++)
        {
            ddlMonthlyFrequency.Items.Add(new ListItem(i.ToString("00"), i.ToString()));
        }

        if (Session["UserRole"].ToString() == "3")
        {
            ddlSitesNewTask.Items.Clear();
            SiteDB sites = new SiteDB();
            DataSet dsSites = sites.GetSites();
            ddlSitesNewTask.DataSource = dsSites.Tables[0];
            ddlSitesNewTask.DataTextField = "SiteName";
            ddlSitesNewTask.DataValueField = "ID";
            ddlSitesNewTask.DataBind();
            ddlSitesNewTask.Visible = true;
            lblSitesNewTask.Visible = true;
        }
    }
    protected void btnNewTaskLogsPopUpClose_Click(object sender, EventArgs e)
    {
        newTaskLogsTracking.Attributes.Add("class", "divdisplaynone");
        ClearAssignDefaultValues();
    }
    protected void btnDeleteTaskLogs_Click(object sender, EventArgs e)
    {
        try
        {
            TaskLogsTarckingDB t = new TaskLogsTarckingDB();
            t.DeleteTaskLogsTracking(hdnTaskLogsTrackingID.Value);
            newTaskLogsTracking.Attributes.Add("class", "divdisplaynone");
            ClearAssignDefaultValues();

            DataSet ds = t.GetTaskLogsTracking(Convert.ToInt32(Session["Site"]));
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblPopUpMessage.Text = "Error";
            lblPopUpMessage.CssClass = "error";
        }
    }
    protected void btnCloseTaskLogs_Click(object sender, EventArgs e)
    {
        newTaskLogsTracking.Attributes.Add("class", "divdisplaynone");
        ClearAssignDefaultValues();
    }
    protected void btnSaveTaskLogs_Click(object sender, EventArgs e)
    {
        string enteredDateTime = "";
        string enteredBy = "";
        string updatedDateTime = "";
        string updatedBy = "";
        string completedDateTime = "";
        string completedBy = "";
        string user = Session["FullName"].ToString();

        string siteId = "";
        if (Session["UserRole"].ToString() == "3")
        {
            siteId = ddlSitesNewTask.SelectedItem.Value;
        }
        else
        {
            siteId = Session["Site"].ToString();
        }

        string taskDescription = txtTask.Text;
        string status = ddlStatus.SelectedItem.Value;
        
        string dueDate = txtDueDate.Text;
        string dueTime = ddlHour.SelectedItem.Value + ":" + ddlMinutes.SelectedItem.Text + " " + ddlAmPM.SelectedItem.Value;
        DateTime temp_duedate = Convert.ToDateTime(dueDate);
        string strDueDate = temp_duedate.ToShortDateString();
        DateTime duedatetime = Convert.ToDateTime(strDueDate + " " + dueTime);

        string assignedTo = txtAssignedTo.Text;
        string isRequrring = ddlIsRecurring.SelectedItem.Value;
        string frequency = ddlFrequency.SelectedItem.Value;
        string weeklyFrequency = ddlWeeklyFrequency.SelectedItem.Value;
        string monthlyFrequency = ddlMonthlyFrequency.SelectedItem.Value;
        string emailFrequency = ddlEmailFrequency.SelectedItem.Value;
        string comments = txtComments.Text;

        //determine status
        if (hdnTaskLogsTrackingID.Value != String.Empty)
        {
            if (status == "Complete")
            {
                completedBy = user;
                completedDateTime = DateTime.Now.ToString();
            }
            else
            {
                updatedBy = user;
                updatedDateTime = DateTime.Now.ToString();
            }
        }
        else
        {
            enteredBy = user;
            enteredDateTime = DateTime.Now.ToString();
        }

        try
        {
            TaskLogsTarckingDB t = new TaskLogsTarckingDB();
            string taskLogTrackingId = t.AddUpdateTaskLogsTracking(hdnTaskLogsTrackingID.Value, siteId, taskDescription, status, duedatetime.ToString(),
                dueTime, assignedTo, isRequrring, frequency, weeklyFrequency, monthlyFrequency, emailFrequency,
                comments, enteredDateTime, enteredBy, updatedDateTime, updatedBy, completedDateTime, completedBy);

            foreach (ListItem email in lstEmailList.Items)
            {
                if (email.ToString() != String.Empty)
                {
                    if (taskLogTrackingId != String.Empty)
                    {
                        t.AddTaskLogsTrackingEmail(taskLogTrackingId, email.ToString());
                    }
                    else
                    {
                        t.AddTaskLogsTrackingEmail(hdnTaskLogsTrackingID.Value, email.ToString());
                    }
                }
            }

            DataSet ds = t.GetTaskLogsTracking(Convert.ToInt32(Session["Site"]));
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();

            newTaskLogsTracking.Attributes.Add("class", "divdisplaynone");

            if (isRequrring == "1" && ddlStatus.SelectedItem.Text == "Complete")
            {
                lblPastDueMessage.Text = "";
                confirmAnotherTaskPopUp.Attributes.Add("class", "confirmAnotherTaskPopUp");
            }
            else 
            {
                ClearAssignDefaultValues();
            }
        }
        catch (Exception ex)
        {
            lblPopUpMessage.Text = "Error creating a new task.";
            lblPopUpMessage.CssClass = "error";
        }

    }

    private void CalculateRecurringDate()
    {
        if (ddlFrequency.SelectedItem.Text == "Daily")
        {
            DateTime duedate = Convert.ToDateTime(txtDueDate.Text);
            duedate = duedate.AddDays(1);
            txtDueDate.Text = duedate.ToShortDateString();
        }
        if (ddlFrequency.SelectedItem.Text == "Every Other Day")
        {
            DateTime duedate = Convert.ToDateTime(txtDueDate.Text);
            duedate = duedate.AddDays(2);
            txtDueDate.Text = duedate.ToShortDateString();
        }
        if (ddlFrequency.SelectedItem.Text == "Every Third Day")
        {
            DateTime duedate = Convert.ToDateTime(txtDueDate.Text);
            duedate = duedate.AddDays(2);
            txtDueDate.Text = duedate.ToShortDateString();
        }
        if (ddlFrequency.SelectedItem.Text == "Weekly")
        {
            DateTime duedate = Convert.ToDateTime(txtDueDate.Text);
            duedate = duedate.AddDays(7);
            txtDueDate.Text = duedate.ToShortDateString();
        }
        if (ddlFrequency.SelectedItem.Text == "Monthly")
        {
            DateTime duedate = Convert.ToDateTime(txtDueDate.Text);
            duedate = duedate.AddDays(30);
            txtDueDate.Text = duedate.ToShortDateString();
        }
    }
    protected void ddlIsRecurring_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlIsRecurring.SelectedItem.Value == "1")
        {
            ddlFrequency.Enabled = true;
            ddlFrequency.Focus();
            rfvFrequency.Enabled = true;
        }
        else 
        {
            ddlFrequency.SelectedIndex = 0;
            ddlIsRecurring.Focus();
            ddlFrequency.Enabled = false;
            rfvFrequency.Enabled = false;
            
            ddlWeeklyFrequency.SelectedIndex = 0;
            ddlWeeklyFrequency.Enabled = false;
            rfvWeeklyFrequency.Enabled = false;

            ddlMonthlyFrequency.SelectedIndex = 0;
            ddlMonthlyFrequency.Enabled = false;
            rfvMonthlyFrequency.Enabled = false;
        }
    }
    protected void ddlFrequency_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlFrequency.SelectedItem.Text == "Weekly")
        {
            ddlWeeklyFrequency.Enabled = true;
            ddlWeeklyFrequency.Focus();
            rfvWeeklyFrequency.Enabled = true;
        }
        else
        {
            ddlWeeklyFrequency.SelectedIndex = 0;
            ddlFrequency.Focus();
            ddlWeeklyFrequency.Enabled = false;
            rfvWeeklyFrequency.Enabled = false;
        }

        if (ddlFrequency.SelectedItem.Text == "Monthly")
        {
            ddlMonthlyFrequency.Enabled = true;
            ddlMonthlyFrequency.Focus();
            rfvMonthlyFrequency.Enabled = true;
        }
        else
        {
            ddlMonthlyFrequency.SelectedIndex = 0;
            ddlFrequency.Focus();
            ddlMonthlyFrequency.Enabled = false;
            rfvMonthlyFrequency.Enabled = false;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        newTaskLogsTracking.Attributes.Add("class", "taskLogsTracking");
        btnDeleteTaskLogs.Visible = true;
        BindDropDowns();

        hdnTaskLogsTrackingID.Value = GridView1.SelectedDataKey.Value.ToString();
        TaskLogsTarckingDB t = new TaskLogsTarckingDB();
        DataSet ds = t.GetTaskLogsTrackingById(Convert.ToInt32(GridView1.SelectedDataKey.Value));

        //bind past due
        BindPastDue(ds);

        txtTask.Text = ds.Tables[0].Rows[0]["TaskDescription"].ToString();
        
        //Bind Status dropdown
        BindStatusDD(ds);
        
        //Bind due date
        DateTime dueDate = Convert.ToDateTime(ds.Tables[0].Rows[0]["Duedate"]);
        txtDueDate.Text = dueDate.ToShortDateString();
        
        //Bind due time
        BindDueTime(ds);

        txtAssignedTo.Text = ds.Tables[0].Rows[0]["AssignedTo"].ToString();

        //Bind Recurring
        BindRcurringDD(ds);

        //Bind frequency
        BindFrequency(ds);

        ddlWeeklyFrequency.SelectedIndex = Convert.ToInt32(ds.Tables[0].Rows[0]["WeeklyFrequency"]);
        ddlMonthlyFrequency.SelectedIndex = Convert.ToInt32(ds.Tables[0].Rows[0]["MonthlyFrequency"]);
        ddlEmailFrequency.SelectedIndex = Convert.ToInt32(ds.Tables[0].Rows[0]["EmailFrequency"]);
        txtComments.Text = ds.Tables[0].Rows[0]["Comments"].ToString();

        if (Session["UserRole"].ToString() == "3")
        {
            int itemCount = 0;
            foreach(ListItem siteId in ddlSitesNewTask.Items)
            {
                if (siteId.Value == ds.Tables[0].Rows[0]["SiteID"].ToString())
                {
                    ddlSitesNewTask.SelectedIndex = itemCount;
                }
                itemCount++;
            }
        }

        //bind email
        foreach (DataRow dr in ds.Tables[1].Rows)
        {
            lstEmailList.Items.Add(dr["Email"].ToString());
        }

        //bind completedBy
        BindCompletedBy(ds);
    }

    private void BindCompletedBy(DataSet ds)
    {
        if (ds.Tables[0].Rows[0]["CompletedBy"].ToString() != String.Empty)
        {
            lblCompletedBy.Text = ds.Tables[0].Rows[0]["CompletedBy"].ToString();
            lblCompletedDate.Text = ds.Tables[0].Rows[0]["CompletedDateTime"].ToString();
        }
        else
        {
            lblCompletedBy.Text = "N/A";
            lblCompletedDate.Text = "N/A";
        }
    }

    private void BindFrequency(DataSet ds)
    {
        ddlFrequency.SelectedIndex = Convert.ToInt32(ds.Tables[0].Rows[0]["Frequency"]);
        if (Convert.ToInt32(ds.Tables[0].Rows[0]["Frequency"]) == 4)
        {
            ddlMonthlyFrequency.Enabled = true;
        }
        else
        {
            ddlMonthlyFrequency.Enabled = false;
        }
        if (Convert.ToInt32(ds.Tables[0].Rows[0]["Frequency"]) == 5)
        {
            ddlWeeklyFrequency.Enabled = true;
        }
        else
        {
            ddlWeeklyFrequency.Enabled = false;
        }
    }

    private void BindRcurringDD(DataSet ds)
    {
        bool recurring = Convert.ToBoolean(ds.Tables[0].Rows[0]["IsRequrring"]);
        if (recurring)
        {
            ddlIsRecurring.SelectedIndex = 1;
            ddlFrequency.Enabled = true;
        }
        else
        {
            ddlIsRecurring.SelectedIndex = 0;
            ddlFrequency.Enabled = false;
        }
    }

    private void BindDueTime(DataSet ds)
    {
        string[] split = ds.Tables[0].Rows[0]["DueTime"].ToString().Split(':');
        string hour = split[0];
        split = split[1].Split(' ');
        string minutes = split[0];
        string amPm = split[1];
        ddlHour.SelectedIndex = Convert.ToInt32(hour) - 1;
        ddlMinutes.SelectedIndex = Convert.ToInt32(minutes) - 1;
        if (amPm == "AM")
        {
            ddlAmPM.SelectedIndex = 0;
        }
        if (amPm == "PM")
        {
            ddlAmPM.SelectedIndex = 1;
        }
    }

    private void BindStatusDD(DataSet ds)
    {
        if (ds.Tables[0].Rows[0]["Status"].ToString() == "Pending")
        {
            ddlStatus.SelectedIndex = 1;
        }
        if (ds.Tables[0].Rows[0]["Status"].ToString() == "Complete")
        {
            ddlStatus.SelectedIndex = 0;
        }
    }

    private void BindPastDue(DataSet ds)
    {
        string status = ds.Tables[0].Rows[0]["Status"].ToString();
        string duedate = ds.Tables[0].Rows[0]["DueDate"].ToString();
        DateTime temp_duedate = Convert.ToDateTime(duedate);
        string strDueDate = temp_duedate.ToShortDateString();
        string duetime = ds.Tables[0].Rows[0]["DueTime"].ToString();
        DateTime duedatetime = Convert.ToDateTime(strDueDate + " " + duetime);
        if (DateTime.Now > duedatetime && status == "Pending")
        {
            lblPastDueMessage.Text = "The task is past due, please complete the task.";
        }
    }
    protected void btnAddEmail_Click(object sender, EventArgs e)
    {
        if (txtEmail.Text.Trim() != string.Empty)
        {
            lstEmailList.Items.Add(txtEmail.Text);
            txtEmail.Text = "";
            txtEmail.Focus();
        }
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        try
        {
            string taskLogsTrackingId = hdnTaskLogsTrackingID.Value;
            TaskLogsTarckingDB t = new TaskLogsTarckingDB();

            if (lstEmailList.SelectedValue != "")
            {
                string selecteditem = lstEmailList.SelectedItem.Text;
                lstEmailList.Items.Remove(selecteditem);
                t.DeleteTaskLogsTrackingEmail(taskLogsTrackingId, selecteditem);
            }
            txtEmail.Focus();
        }
        catch (Exception ex)
        {
            lblPopUpMessage.Text = "Error saving";
            lblPopUpMessage.CssClass = "error";
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //compare if pastdue
            string status = e.Row.Cells[1].Text;
            string duedate = e.Row.Cells[2].Text;
            string duetime = e.Row.Cells[3].Text;
            DateTime duedatetime = Convert.ToDateTime(duedate + " " + duetime);
            if (DateTime.Now > duedatetime && status == "Pending")
            {
                //e.Row.BackColor = System.Drawing.Color.Red;
                //e.Row.Cells[1].Text = "<i>" + e.Row.Cells[1].Text + "</i>";
                e.Row.CssClass = "data-table-pastdue";
            }   
        }
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        TaskLogsTarckingDB t = new TaskLogsTarckingDB();
        DataSet ds = t.GetTaskLogsTracking(Convert.ToInt32(Session["Site"]), txtStartDate.Text, txtEndDate.Text);
        DataTable dt = ds.Tables[0];
        dt.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        TaskLogsTarckingDB t = new TaskLogsTarckingDB();
        GridView1.PageIndex = e.NewPageIndex;
        DataSet ds = t.GetTaskLogsTracking(Convert.ToInt32(Session["Site"]), txtStartDate.Text, txtEndDate.Text);
        GridView1.DataSource = ds.Tables[0];
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
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["Site"] = ddlSites.SelectedItem.Value;
        TaskLogsTarckingDB t = new TaskLogsTarckingDB();
        DataSet ds = t.GetTaskLogsTracking(Convert.ToInt32(Session["Site"]), txtStartDate.Text, txtEndDate.Text);
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }
    protected void btnYesRepeatTask_Click(object sender, EventArgs e)
    {
        newTaskLogsTracking.Attributes.Add("class", "taskLogsTracking");
        confirmAnotherTaskPopUp.Attributes.Add("class", "divdisplaynone");
        btnDeleteTaskLogs.Visible = false;
        hdnTaskLogsTrackingID.Value = "";
        ddlStatus.SelectedIndex = 1;

        //bind dropdowns
        //BindDropDowns();

        CalculateRecurringDate();
    }
    protected void btnNoRepeatTask_Click(object sender, EventArgs e)
    {
        confirmAnotherTaskPopUp.Attributes.Add("class", "divdisplaynone");
        ClearAssignDefaultValues();
    }
}