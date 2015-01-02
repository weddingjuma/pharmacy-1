using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
/// <summary>
/// Summary description for SiteDB
/// </summary>
public class SiteDB
{
	public SiteDB()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataSet GetSites()
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetSites", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetSite(string ID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetSites", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public void AddUpdateSite(string SiteID, string SiteName, Boolean Active, 
        Boolean Interventions, Boolean  TempTaskLog,
        Boolean AntibioticTracking,Boolean WarfarinTracking,
        Boolean TaskLogsTracking, Boolean CompoundingLog)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;


        if (!string.IsNullOrEmpty(SiteID)) cm.Parameters.Add("@ID", SqlDbType.Int ).Value = SiteID;
        cm.Parameters.Add("@SiteName", SqlDbType.VarChar, 250).Value = SiteName ;
        cm.Parameters.Add("@Active", SqlDbType.Bit).Value = Active;
        cm.Parameters.Add("@Interventions", SqlDbType.Bit).Value = Interventions;
        cm.Parameters.Add("@TempTaskLog", SqlDbType.Bit).Value = TempTaskLog;
        cm.Parameters.Add("@AntibioticTracking", SqlDbType.Bit).Value = AntibioticTracking;
        cm.Parameters.Add("@WarfarinTracking", SqlDbType.Bit).Value = WarfarinTracking;
        cm.Parameters.Add("@TaskLogsTracking", SqlDbType.Bit).Value = TaskLogsTracking;
        cm.Parameters.Add("@CompoundingLog", SqlDbType.Bit).Value = CompoundingLog;
        cm.CommandText = "AddUpdateSite";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }

}