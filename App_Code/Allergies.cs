using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Allergies
/// </summary>
public class Allergies
{
	public Allergies()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet GetAllergies()
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetAllergies", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetAllergiesByName(string name)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetAllergiesByName", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@Name", SqlDbType.VarChar, 50).Value = name;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public void AddPatientAllergies(string patientId, string allergy)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandText = "AddPatientAllergies";
        cm.CommandType = CommandType.StoredProcedure;
        cm.Parameters.Add("@PatientID", SqlDbType.Int).Value = Convert.ToInt32(patientId);
        cm.Parameters.Add("@Allergy", SqlDbType.VarChar, 100).Value = allergy;

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn.Dispose();
    }
    public void DeletePatientAllergies(string patientId, string allergy)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandText = "DeletePatientAllergies";
        cm.CommandType = CommandType.StoredProcedure;
        cm.Parameters.Add("@PatientID", SqlDbType.Int).Value = Convert.ToInt32(patientId);
        cm.Parameters.Add("@Allergy", SqlDbType.VarChar, 100).Value = allergy;

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn.Dispose();
    }
    public void DeleteAllergy(string ID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;


        cm.Parameters.Add("@ID", SqlDbType.Int).Value = ID;

        cm.CommandText = "DeleteAllergy";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }
    public void AddUpdateAllergy(string ID, string Allergy)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandText = "AddUpdateAllergy";
        cm.CommandType = CommandType.StoredProcedure;
        if (!string.IsNullOrEmpty(ID)) cm.Parameters.Add("@ID", SqlDbType.Int).Value = Convert.ToInt32(ID);
        cm.Parameters.Add("@Allergy", SqlDbType.VarChar, 50).Value = Allergy;

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn.Dispose();
    }
}