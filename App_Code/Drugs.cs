using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Drugs
/// </summary>
public class Drugs
{
	public Drugs()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet GetDrugs()
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetDrugs", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetDrug(string ID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetDrugs", myConnection);

        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public void AddUpdateDrugs(string DrugID, string Drug)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;


        if (!string.IsNullOrEmpty(DrugID )) cm.Parameters.Add("@DrugID", SqlDbType.Int).Value = DrugID;
        cm.Parameters.Add("@Drug", SqlDbType.VarChar, 150).Value = Drug ;
        
        
        cm.CommandText = "AddUpdateDrugs";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }
    public void DeleteDrugs(string DrugID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;


        cm.Parameters.Add("@DrugID", SqlDbType.Int).Value = DrugID;

        cm.CommandText = "DeleteDrugs";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }
}