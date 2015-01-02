using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Interventions
/// </summary>
public class InterventionsDB
{
	public InterventionsDB()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet GetInterventionTypesByName(string name, string siteId)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetInterventionTypesByName", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@Name", SqlDbType.VarChar, 250).Value = name;
        myCommand.SelectCommand.Parameters.Add("@SiteID", SqlDbType.Int).Value = Convert.ToInt32(siteId) ;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public string AddUpdateInterventions(string InterventionsID, string interventionType, string PatientID, string physician, string minutes, string userId)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "AddUpdateInterventions";

        if (!string.IsNullOrEmpty(InterventionsID)) cm.Parameters.Add("@InterventionsID", SqlDbType.Int).Value = Convert.ToInt32(InterventionsID);
        if (!string.IsNullOrEmpty(PatientID)) cm.Parameters.Add("@PatientID", SqlDbType.Int).Value = PatientID;
        cm.Parameters.Add("@Physician", SqlDbType.VarChar, 50).Value = physician;
        cm.Parameters.Add("@Minutes", SqlDbType.VarChar, 50).Value = minutes;
        cm.Parameters.Add("@InterventionType", SqlDbType.VarChar, 250).Value = interventionType;
        if (!string.IsNullOrEmpty(userId)) cm.Parameters.Add("@EnteredBy", SqlDbType.VarChar, 50).Value = userId;

        string interventionsId;
        interventionsId = cm.ExecuteScalar().ToString();

        cm.Dispose();
        cn.Close();
        cn = null;

        return interventionsId;
    }
    public string AddUpdateInterventionTypes(string ID, string InterventionType, string Cost, string SiteID)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "AddUpdateInterventionTypes";

        if (!string.IsNullOrEmpty(ID)) cm.Parameters.Add("@ID", SqlDbType.Int).Value = Convert.ToInt32(ID);
        cm.Parameters.Add("@InterventionType", SqlDbType.VarChar, 250).Value = InterventionType;
        cm.Parameters.Add("@Cost", SqlDbType.Decimal).Value = Convert.ToDecimal(Cost);
        cm.Parameters.Add("@SiteID", SqlDbType.Int).Value = Convert.ToInt32(SiteID);

        string interventionsId;
        interventionsId = cm.ExecuteScalar().ToString();

        cm.Dispose();
        cn.Close();
        cn = null;

        return interventionsId;
    }
    public void AddInterventionsIntervention(string IntervetionsId, string Intervention)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandText = "AddInterventionsIntervention";
        cm.CommandType = CommandType.StoredProcedure;
        cm.Parameters.Add("@InterventionsID", SqlDbType.Int).Value = Convert.ToInt32(IntervetionsId);
        cm.Parameters.Add("@Intervention", SqlDbType.VarChar, 100).Value = Intervention;

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn.Dispose();
    }
    public DataSet GetInterventionsInterventionsByInterventionsID(string InterventionsID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetInterventionsInterventionsByInterventionsID", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@InterventionsID", SqlDbType.Int).Value = Convert.ToInt32(InterventionsID);
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public void DeleteInterventionsIntervention(string InterventionsID, string Intervention)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandText = "DeleteInterventionsIntervention";
        cm.CommandType = CommandType.StoredProcedure;
        cm.Parameters.Add("@InterventionsID", SqlDbType.Int).Value = Convert.ToInt32(InterventionsID);
        cm.Parameters.Add("@Intervention", SqlDbType.VarChar, 100).Value = Intervention;

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn.Dispose();
    }
    public void DeleteInterventions(string InterventionsID)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandText = "DeleteInterventions";
        cm.CommandType = CommandType.StoredProcedure;
        cm.Parameters.Add("@InterventionsID", SqlDbType.Int).Value = Convert.ToInt32(InterventionsID);

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn.Dispose();
    }
    public void DeleteInterventionTypes(string ID)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandText = "DeleteInterventionTypes";
        cm.CommandType = CommandType.StoredProcedure;
        cm.Parameters.Add("@ID", SqlDbType.Int).Value = Convert.ToInt32(ID);

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn.Dispose();
    }
    public DataSet GetInterventionsByPatientName(string PatientName, int site)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetInterventionsByPatientName", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@PatientName", SqlDbType.VarChar, 100).Value = PatientName;
        myCommand.SelectCommand.Parameters.Add("@Site", SqlDbType.Int).Value = site;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetPatientsInerventions(int site)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetPatientsInerventions", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@SiteID", SqlDbType.Int).Value = site;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public void DeletePatient(int PatientID)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "DeletePatient";

        cm.Parameters.Add("@PatientID", SqlDbType.Int).Value = PatientID;

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn = null;
    }
    public DataSet GetInterventionsPerSiteByDate(int site, string startDate, string endDate, string selectedUser)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetInterventionsPerSiteByDate", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@SiteID", SqlDbType.Int).Value = site;
        myCommand.SelectCommand.Parameters.Add("@EnteredStartDateTime", SqlDbType.DateTime).Value = Convert.ToDateTime(startDate);
        myCommand.SelectCommand.Parameters.Add("@EnteredEndDateTime", SqlDbType.DateTime).Value = Convert.ToDateTime(endDate);
        if (!string.IsNullOrEmpty(selectedUser)) myCommand.SelectCommand.Parameters.Add("@EnteredBy", SqlDbType.VarChar, 50).Value = selectedUser;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet CheckInterventionTypesByName(string name)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("CheckInterventionTypesByName", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@Name", SqlDbType.VarChar, 250).Value = name;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetInterventionTypesBySite(string siteId)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetInterventionTypesBySite", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@SiteID", SqlDbType.Int).Value = Convert.ToInt32(siteId);
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
}