using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for TaskLogsTarckingDB
/// </summary>
public class TaskLogsTarckingDB
{
	public TaskLogsTarckingDB()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet GetTaskLogsTracking(int site)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetTaskLogsTracking", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@SiteID", SqlDbType.Int).Value = site;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetTaskLogsTracking(int site, string startDate, string endDate)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetTaskLogsTracking", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@SiteID", SqlDbType.Int).Value = site;
        if (!string.IsNullOrEmpty(startDate)) myCommand.SelectCommand.Parameters.Add("@startDate", SqlDbType.DateTime).Value = Convert.ToDateTime(startDate);
        if (!string.IsNullOrEmpty(endDate)) myCommand.SelectCommand.Parameters.Add("@endDate", SqlDbType.DateTime).Value = Convert.ToDateTime(endDate);
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public string AddUpdateTaskLogsTracking(string id, string SiteID, string TaskDescription, string Status,
        string DueDate, string DueTime, string AssignedTo, string IsRequrring,
        string Frequency, string WeeklyFrequency, string MonthlyFrequency, string EmailFrequency,
        string Comments, string EnteredDateTime, string EnteredBy, string UpdatedDateTime, string UpdatedBy,
        string CompletedDateTime, string CompletedBy)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "AddUpdateTaskLogsTracking";

        if (!string.IsNullOrEmpty(id)) cm.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(id);
        if (!string.IsNullOrEmpty(SiteID)) cm.Parameters.Add("@SiteID", SqlDbType.Int).Value = Convert.ToInt32(SiteID);
        if (!string.IsNullOrEmpty(TaskDescription)) cm.Parameters.Add("@TaskDescription", SqlDbType.VarChar, 150).Value = TaskDescription;
        if (!string.IsNullOrEmpty(Status)) cm.Parameters.Add("@Status", SqlDbType.VarChar, 50).Value = Status;
        if (!string.IsNullOrEmpty(DueDate)) cm.Parameters.Add("@DueDate", SqlDbType.DateTime).Value = Convert.ToDateTime(DueDate);
        if (!string.IsNullOrEmpty(DueTime)) cm.Parameters.Add("@DueTime", SqlDbType.VarChar, 50).Value = DueTime;
        if (!string.IsNullOrEmpty(AssignedTo)) cm.Parameters.Add("@AssignedTo", SqlDbType.VarChar, 150).Value = AssignedTo;
        if (!string.IsNullOrEmpty(IsRequrring)) cm.Parameters.Add("@IsRequrring", SqlDbType.Bit).Value = Convert.ToInt32(IsRequrring);
        if (!string.IsNullOrEmpty(Frequency)) cm.Parameters.Add("@Frequency", SqlDbType.VarChar, 150).Value = Frequency;
        if (!string.IsNullOrEmpty(WeeklyFrequency)) cm.Parameters.Add("@WeeklyFrequency", SqlDbType.VarChar, 150).Value = WeeklyFrequency;
        if (!string.IsNullOrEmpty(MonthlyFrequency)) cm.Parameters.Add("@MonthlyFrequency", SqlDbType.VarChar, 150).Value = MonthlyFrequency;
        if (!string.IsNullOrEmpty(EmailFrequency)) cm.Parameters.Add("@EmailFrequency", SqlDbType.VarChar, 250).Value = EmailFrequency;
        if (!string.IsNullOrEmpty(Comments)) cm.Parameters.Add("@Comments", SqlDbType.Text).Value = Comments;
        if (!string.IsNullOrEmpty(EnteredDateTime)) cm.Parameters.Add("@EnteredDateTime", SqlDbType.DateTime).Value = Convert.ToDateTime(EnteredDateTime);
        if (!string.IsNullOrEmpty(EnteredBy)) cm.Parameters.Add("@EnteredBy", SqlDbType.VarChar, 50).Value = EnteredBy;
        if (!string.IsNullOrEmpty(UpdatedDateTime)) cm.Parameters.Add("@UpdatedDateTime", SqlDbType.DateTime).Value = Convert.ToDateTime(UpdatedDateTime);
        if (!string.IsNullOrEmpty(UpdatedBy)) cm.Parameters.Add("@UpdatedBy", SqlDbType.VarChar, 50).Value = UpdatedBy;
        if (!string.IsNullOrEmpty(CompletedDateTime)) cm.Parameters.Add("@CompletedDateTime", SqlDbType.DateTime).Value = Convert.ToDateTime(CompletedDateTime);
        if (!string.IsNullOrEmpty(CompletedBy)) cm.Parameters.Add("@CompletedBy", SqlDbType.VarChar, 50).Value = CompletedBy;

        string Id;
        Id = cm.ExecuteScalar().ToString();

        cm.Dispose();
        cn.Close();
        cn = null;

        return Id;
    }
    public DataSet GetTaskLogsTrackingById(int id)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetTaskLogsTrackingById", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(id);
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public void DeleteTaskLogsTracking(string id)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;

        cm.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(id);

        cm.CommandText = "DeleteTaskLogsTracking";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;
    }
    public void AddTaskLogsTrackingEmail(string TaskLogsTrackingId, string email)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandText = "AddTaskLogsTrackingEmail";
        cm.CommandType = CommandType.StoredProcedure;
        cm.Parameters.Add("@TaskLogsTrackingId", SqlDbType.Int).Value = Convert.ToInt32(TaskLogsTrackingId);
        cm.Parameters.Add("@Email", SqlDbType.VarChar, 250).Value = email;

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn.Dispose();
    }
    public void DeleteTaskLogsTrackingEmail(string TaskLogsTrackingId, string email)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandText = "DeleteTaskLogsTrackingEmail";
        cm.CommandType = CommandType.StoredProcedure;
        cm.Parameters.Add("@TaskLogsTrackingId", SqlDbType.Int).Value = Convert.ToInt32(TaskLogsTrackingId);
        cm.Parameters.Add("@Email", SqlDbType.VarChar, 250).Value = email;

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn.Dispose();
    }
}