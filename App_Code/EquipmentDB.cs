using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for EquipmentDB
/// </summary>
public class EquipmentDB
{
	public EquipmentDB()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet GetEquipment()
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetEquipment", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetEquipment(string EquipmentID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetEquipment", myConnection);
        myCommand.SelectCommand.Parameters.Add("@EquipmentID", SqlDbType.Int).Value = EquipmentID;
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetEquipmentByName(string Name)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetEquipmentByName", myConnection);
        myCommand.SelectCommand.Parameters.Add("@Name", SqlDbType.VarChar,250).Value = Name;
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public void AddUpdateEquipment(string EquipmentID, string Equipment)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;


        if (!string.IsNullOrEmpty(EquipmentID)) cm.Parameters.Add("@EquipmentID", SqlDbType.Int).Value = EquipmentID;
        cm.Parameters.Add("@Equipment", SqlDbType.VarChar, 150).Value = Equipment;

        cm.CommandText = "AddUpdateEquipment";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }

    public void DeleteEquipment(string EquipmentID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;


        cm.Parameters.Add("@EquipmentID", SqlDbType.Int).Value = EquipmentID;

        cm.CommandText = "DeleteEquipment";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }

}