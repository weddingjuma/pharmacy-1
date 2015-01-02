using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Patients
/// </summary>
public class Patients
{
	public Patients()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet GetPatients()
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetPatients", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }

    public DataSet GetPatient(string PatientID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetPatient", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@PatientID", SqlDbType.Int).Value = PatientID;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetPatientByIN(string PatientIN,string SiteID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetPatient", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add ("@PatientIN",SqlDbType.VarChar ,50).Value=PatientIN ;
        myCommand.SelectCommand.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public string AddUpdatePatient(string PatientID,string PatientIN, string SiteID, string FirstName , string LastName, string Age,string DOB,string Height,string Weight,string Sex,string Room, string userId)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "AddUpdatePatient";

        if (!string.IsNullOrEmpty(PatientID)) cm.Parameters.Add("@PatientID", SqlDbType.Int).Value = PatientID ;
        if (!string.IsNullOrEmpty(PatientIN)) cm.Parameters.Add("@PatientIN", SqlDbType.VarChar, 50).Value = PatientIN;
        cm.Parameters.Add("@SiteID", SqlDbType.VarChar, 50).Value = SiteID;
        if (!string.IsNullOrEmpty(FirstName)) cm.Parameters.Add("@FirstName", SqlDbType.VarChar, 50).Value = FirstName;
        if (!string.IsNullOrEmpty(LastName)) cm.Parameters.Add("@LastName", SqlDbType.VarChar, 50).Value = LastName;
        if (!string.IsNullOrEmpty(Age )) cm.Parameters.Add("@Age", SqlDbType.VarChar, 50).Value = Age;
        if (!string.IsNullOrEmpty(DOB )) cm.Parameters.Add("@DOB", SqlDbType.DateTime ).Value = DOB ;
        if (!string.IsNullOrEmpty(Height)) cm.Parameters.Add("@Height", SqlDbType.VarChar, 50).Value = Height;
        if (!string.IsNullOrEmpty(Weight)) cm.Parameters.Add("@Weight", SqlDbType.VarChar, 10).Value = Weight;
        if (!string.IsNullOrEmpty(Sex)) cm.Parameters.Add("@Sex", SqlDbType.VarChar, 50).Value = Sex;
        if (!string.IsNullOrEmpty(Room)) cm.Parameters.Add("@Room", SqlDbType.VarChar, 50).Value = Room;
        if (!string.IsNullOrEmpty(userId)) cm.Parameters.Add("@EnteredBy", SqlDbType.VarChar, 50).Value = userId;
        
        string patientId;
        patientId = cm.ExecuteScalar().ToString();

        cm.Dispose();
        cn.Close();
        cn = null;

        return patientId;
    }
    public void DeletePatient(string PatientID)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandText = "DeletePatient";
        cm.CommandType = CommandType.StoredProcedure;
        cm.Parameters.Add("@PateintID", SqlDbType.Int).Value = Convert.ToInt32(PatientID);

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn.Dispose();
    }
}