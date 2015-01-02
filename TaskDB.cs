using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for TaskDB
/// </summary>
public class TaskDB
{
	public TaskDB()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet GetTasks()
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetTasks", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    
    public DataSet GetTaskLogDetails(string TaskID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetTaskLogDetails", myConnection);
        myCommand.SelectCommand.Parameters.Add("@TaskID", SqlDbType.Int).Value = TaskID;
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }
    public DataSet GetTaskLogDetailsByID(string ID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetTaskLogDetailsByID", myConnection);
        myCommand.SelectCommand.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }
    public DataSet GetTask(string TaskID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetTasks", myConnection);
        myCommand.SelectCommand.Parameters.Add("@TaskID", SqlDbType.Int).Value = TaskID;
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }
    public DataSet GetTasksByName(string Name)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetTasksByName", myConnection);
        myCommand.SelectCommand.Parameters.Add("@Name", SqlDbType.VarChar ,250).Value = Name;
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }
    public void AddUpdateTask(string TaskID, string Task)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;


        if (!string.IsNullOrEmpty(TaskID)) cm.Parameters.Add("@TaskID", SqlDbType.Int).Value = TaskID;
        cm.Parameters.Add("@Task", SqlDbType.VarChar, 150).Value = Task;

        cm.CommandText = "AddUpdateTask";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }
    public void AddUpdateTaskLog(string TaskLogID, string Task,string Equipment,string SiteID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;


        if (!string.IsNullOrEmpty(TaskLogID)) cm.Parameters.Add("@TaskLogID", SqlDbType.Int).Value = TaskLogID;
        cm.Parameters.Add("@Task", SqlDbType.VarChar, 150).Value = Task;
        cm.Parameters.Add("@Equipment", SqlDbType.VarChar, 150).Value = Equipment;
        cm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID;

        cm.CommandText = "AddUpdateTaskLog";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }
    public void AddUpdateTaskLogDetail(string TaskLogID,string TaskID,string DueDate, string Degree, string ActionTaken, string CompletedBy, string Status)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;


        if (!string.IsNullOrEmpty(TaskLogID)) cm.Parameters.Add("@ID", SqlDbType.Int).Value = TaskLogID;
        cm.Parameters.Add("@TaskID", SqlDbType.Int).Value = TaskID;

        if (!string.IsNullOrEmpty(Degree)) cm.Parameters.Add("@Degree", SqlDbType.VarChar, 50).Value = Degree;
        cm.Parameters.Add("@DueDate", SqlDbType.DateTime ).Value = DueDate;
        cm.Parameters.Add("@ActionTaken", SqlDbType.VarChar, 250).Value = ActionTaken;
        cm.Parameters.Add("@Status", SqlDbType.VarChar, 50).Value = @Status;
        cm.Parameters.Add("@UserID", SqlDbType.VarChar, 50).Value = CompletedBy ;


        cm.CommandText = "AddUpdateTaskLogDetails";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }

    public DataSet GetTaskLog(string TaskID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetTaskLog", myConnection);
        myCommand.SelectCommand.Parameters.Add("@TaskID", SqlDbType.Int).Value = TaskID;
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }
    public void DeleteTask(string TaskID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;


        cm.Parameters.Add("@TaskID", SqlDbType.Int).Value = TaskID;

        cm.CommandText = "DeleteTask";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }
    public void DeleteTaskLog(string TaskLogID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;


        cm.Parameters.Add("@TaskLogID", SqlDbType.Int).Value = TaskLogID;

        cm.CommandText = "DeleteDrugs";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }
    public DataSet GetTaskLogStatus()
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetTaskLogStatus", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public void AddUpdateTaskLogStatus(string ID, string Status)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;


        if (!string.IsNullOrEmpty(ID)) cm.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
        cm.Parameters.Add("@Status", SqlDbType.VarChar, 150).Value = Status;

        cm.CommandText = "AddUpdateTaskLogStatus";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;
    }
    public void DeleteTaskLogStatus(string ID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;


        cm.Parameters.Add("@ID", SqlDbType.Int).Value = ID;

        cm.CommandText = "DeleteTaskLogStatus";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }
    public DataSet GetTaskLogDetailsPerSiteByDate(int site, string startDate, string endDate)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetTaskLogDetailsPerSiteByDate", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@SiteID", SqlDbType.Int).Value = site;
        myCommand.SelectCommand.Parameters.Add("@EnteredStartDateTime", SqlDbType.DateTime).Value = Convert.ToDateTime(startDate);
        myCommand.SelectCommand.Parameters.Add("@EnteredEndDateTime", SqlDbType.DateTime).Value = Convert.ToDateTime(endDate);
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetTaskLogDetailsByIDByDate(int TaskID, string startDate, string endDate)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetTaskLogDetailsByIDByDate", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@TaskID", SqlDbType.Int).Value = TaskID;
        myCommand.SelectCommand.Parameters.Add("@EnteredStartDateTime", SqlDbType.DateTime).Value = Convert.ToDateTime(startDate);
        myCommand.SelectCommand.Parameters.Add("@EnteredEndDateTime", SqlDbType.DateTime).Value = Convert.ToDateTime(endDate);
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
}