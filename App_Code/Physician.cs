using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Physician
/// </summary>
public class Physician
{
	public Physician()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet GetPhysicians(string PhysicianID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetPhysicians", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        if (!string.IsNullOrEmpty(PhysicianID)) myCommand.SelectCommand.Parameters.Add("PhysicianID", SqlDbType.Int).Value = PhysicianID;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public void AddUpdatePhysicians(string PhysicianID, string SiteID, string PhysicianFirstName, string PhysicianLastName, string PhysicianPhone, string PhysicianEmail, Boolean Active)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlCommand myCommand = new SqlCommand("AddUpdatePhysician", myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;
        if (!string.IsNullOrEmpty(PhysicianID)) myCommand.Parameters.Add("PhysicianID", SqlDbType.Int).Value = PhysicianID;
        myCommand.Parameters.Add("SiteID", SqlDbType.Int).Value = SiteID;
        if (!string.IsNullOrEmpty(PhysicianFirstName)) myCommand.Parameters.Add("PhysicianFirstName", SqlDbType.VarChar, 50).Value = PhysicianFirstName;
        if (!string.IsNullOrEmpty(PhysicianLastName)) myCommand.Parameters.Add("PhysicianLastName", SqlDbType.VarChar, 50).Value = PhysicianLastName;
        if (!string.IsNullOrEmpty(PhysicianPhone)) myCommand.Parameters.Add("@PhysicianPhone", SqlDbType.VarChar, 50).Value = PhysicianPhone;
        if (!string.IsNullOrEmpty(PhysicianEmail)) myCommand.Parameters.Add("@PhysicianEmail", SqlDbType.VarChar, 50).Value = PhysicianEmail;
        myCommand.Parameters.Add("@Active", SqlDbType.Bit).Value = Active;
        myCommand.ExecuteNonQuery();

        myConnection.Close();
        myConnection = null;
    }
    public void DeletePhysician(string PhysicianID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlCommand myCommand = new SqlCommand("DeletePhysician", myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;
        if (!string.IsNullOrEmpty(PhysicianID)) myCommand.Parameters.Add("@PhysicianID", SqlDbType.Int).Value = PhysicianID;
        myCommand.ExecuteNonQuery();

        myConnection.Close();
        myConnection = null;
    }
    public DataSet GetPhysiciansBySiteID(string SiteID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetPhysiciansBySiteID", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        if (!string.IsNullOrEmpty(SiteID)) myCommand.SelectCommand.Parameters.Add("SiteID", SqlDbType.Int).Value = Convert.ToInt32(SiteID);
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
}