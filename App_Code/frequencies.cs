using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


/// <summary>
/// Summary description for frequencies
/// </summary>
public class frequencies
{
	public frequencies()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet Getfrequencies()
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("Getfrequencies", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetFrequency(string FrequencyID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("Getfrequencies", myConnection);
        myCommand.SelectCommand.Parameters.Add("@FrequencyID", SqlDbType.Int).Value = FrequencyID;
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public void AddUpdateFrequency(string FrequencyID, string Frequency, string Description)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;


        if (!string.IsNullOrEmpty(FrequencyID)) cm.Parameters.Add("@FrequencyID", SqlDbType.Int).Value = FrequencyID;
        cm.Parameters.Add("@Frequency", SqlDbType.VarChar, 150).Value = Frequency;
        if (!string.IsNullOrEmpty(Description)) cm.Parameters.Add("@Description", SqlDbType.VarChar, 150).Value = Description;
        cm.CommandText = "AddUpdateFrequency";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }
    public void DeleteFrequency(string FrequencyID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;


        cm.Parameters.Add("@FrequencyID", SqlDbType.Int).Value = FrequencyID;
        cm.CommandText = "DeleteFrequency";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }
}