using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Warfarin
/// </summary>
public class Warfarin
{
	public Warfarin()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet GetWarfarinInrGoal()
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetWarfarinInrGoal", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public string AddUpdateWarfarinTracking(string PatientID, string WarfarinTrackingID, string dateStarted, string previousAdmitionDate,
        string previousHistoryWarfarin, string counselingCompletedDate, string user)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "AddUpdateWarfarinTracking";

        cm.Parameters.Add("@PatientID", SqlDbType.Int).Value = PatientID;
        if (!string.IsNullOrEmpty(WarfarinTrackingID)) cm.Parameters.Add("@WarfarinTrackingID", SqlDbType.Int).Value = WarfarinTrackingID;
        if (!string.IsNullOrEmpty(dateStarted)) cm.Parameters.Add("@DateStarted", SqlDbType.DateTime).Value = Convert.ToDateTime(dateStarted);
        if (!string.IsNullOrEmpty(previousAdmitionDate)) cm.Parameters.Add("@PrevAdmitionDate", SqlDbType.DateTime).Value = Convert.ToDateTime(previousAdmitionDate);
        if (!string.IsNullOrEmpty(previousHistoryWarfarin)) cm.Parameters.Add("@PreviousHistoryWarfarin", SqlDbType.Text).Value = previousHistoryWarfarin;
        if (!string.IsNullOrEmpty(counselingCompletedDate)) cm.Parameters.Add("@CounselingCompletedDate", SqlDbType.DateTime).Value = Convert.ToDateTime(counselingCompletedDate);
        if (!string.IsNullOrEmpty(user)) cm.Parameters.Add("@CounselingCompletedUser", SqlDbType.VarChar, 150).Value = user;
        cm.Parameters.Add("@EnteredBy", SqlDbType.VarChar, 50).Value = user;

        string warfarinTrackingId;
        warfarinTrackingId = cm.ExecuteScalar().ToString();

        cm.Dispose();
        cn.Close();
        cn = null;

        return warfarinTrackingId;
    }
    public void AddUpdateWarfarinWarfarinInrGoal(string WarfarinIndicationID, string WarfarinInrGoal)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "AddUpdateWarfarinWarfarinInrGoal";

        cm.Parameters.Add("@WarfarinIndicationID", SqlDbType.Int).Value = WarfarinIndicationID;
        cm.Parameters.Add("@WarfarinInrGoal", SqlDbType.VarChar, 50).Value = WarfarinInrGoal;

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn = null;
    }
    public string AddUpdateWarfarinIndication(string ID, string WarfarinTrackingID, string WarfarinIndicationText, string Anticoagulation,
        string WarfarinPastMedicalHistory, string CurrentMedications, string MedicationsInteractWarfarin, string DrugsEffect)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "AddUpdateWarfarinIndication";

        if (!string.IsNullOrEmpty(ID)) cm.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
        cm.Parameters.Add("@WarfarinTrackingID", SqlDbType.Int).Value = WarfarinTrackingID;
        if (!string.IsNullOrEmpty(WarfarinIndicationText)) cm.Parameters.Add("@WarfarinIndicationText", SqlDbType.Text).Value = WarfarinIndicationText;
        if (!string.IsNullOrEmpty(Anticoagulation)) cm.Parameters.Add("@Anticoagulation", SqlDbType.Text).Value = Anticoagulation;
        if (!string.IsNullOrEmpty(WarfarinPastMedicalHistory)) cm.Parameters.Add("@WarfarinPastMedicalHistory", SqlDbType.Text).Value = WarfarinPastMedicalHistory;
        if (!string.IsNullOrEmpty(CurrentMedications)) cm.Parameters.Add("@CurrentMedications", SqlDbType.Text).Value = CurrentMedications;
        if (!string.IsNullOrEmpty(MedicationsInteractWarfarin)) cm.Parameters.Add("@MedicationsInteractWarfarin", SqlDbType.Text).Value = MedicationsInteractWarfarin;
        if (!string.IsNullOrEmpty(DrugsEffect)) cm.Parameters.Add("@DrugsEffect", SqlDbType.Text).Value = DrugsEffect;

        string warfarinIndicationId;
        warfarinIndicationId = cm.ExecuteScalar().ToString();

        cm.Dispose();
        cn.Close();
        cn = null;

        return warfarinIndicationId;
    }
    public DataSet GetWarfarinTrackingByPatientID(string PatientID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetWarfarinTrackingByPatientID", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@PatientID", SqlDbType.Int).Value = PatientID;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetWarfarinIndicationByWarfarinTrackingID(string WarfarinTrackingID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetWarfarinIndicationByWarfarinTrackingID", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@WarfarinTrackingID", SqlDbType.Int).Value = WarfarinTrackingID;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetWarfarinWarfarinInrGoalByWarfarinIndicationID(string WarfarinIndicationID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetWarfarinWarfarinInrGoalByWarfarinIndicationID", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@WarfarinIndicationID", SqlDbType.Int).Value = WarfarinIndicationID;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public void DeleteWarfarinWarfarinInrGoal(string ID, string WarfarinInrGoal)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "DeleteWarfarinWarfarinInrGoal";

        cm.Parameters.Add("@WarfarinIndicationID", SqlDbType.Int).Value = ID;
        cm.Parameters.Add("@WarfarinInrGoal", SqlDbType.VarChar, 50).Value = WarfarinInrGoal;

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn = null;
    }
    public void AddUpdateWarfarinLab(string ID, string WarfarinTrackingID,
        string LabDate, string hemoglobin, string hematocrit, string platelets, string inr, string WarfarinDose, string enteredBy)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "AddUpdateWarfarinLab";

        if (!string.IsNullOrEmpty(ID)) cm.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
        cm.Parameters.Add("@WarfarinTrackingID", SqlDbType.Int).Value = WarfarinTrackingID;
        if (!string.IsNullOrEmpty(LabDate)) cm.Parameters.Add("@LabDate", SqlDbType.DateTime).Value = Convert.ToDateTime(LabDate);
        cm.Parameters.Add("@hemoglobin", SqlDbType.VarChar, 50).Value = hemoglobin;
        cm.Parameters.Add("@hematocrit", SqlDbType.VarChar, 50).Value = hematocrit;
        cm.Parameters.Add("@platelets", SqlDbType.VarChar, 50).Value = platelets;
        cm.Parameters.Add("@inr", SqlDbType.VarChar, 50).Value = inr;
        cm.Parameters.Add("@WarfarinDose", SqlDbType.VarChar, 50).Value = WarfarinDose;
        cm.Parameters.Add("@EnteredBy", SqlDbType.VarChar, 50).Value = enteredBy;
        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn = null;
    }
    public void DeleteAntibioticLab(string ID)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "DeleteWarfarinLab";

        cm.Parameters.Add("@ID", SqlDbType.Int).Value = Convert.ToInt32(ID);

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn = null;
    }
    public DataSet GetWarfarinTrackingByPatientName(string PatientName, int site)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetWarfarinTrackingByPatientName", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@PatientName", SqlDbType.VarChar, 100).Value = PatientName;
        myCommand.SelectCommand.Parameters.Add("@Site", SqlDbType.Int).Value = site;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetPatientsWarfarinTracking(int site)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetPatientsWarfarinTracking", myConnection);
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
    public void AddUpdateWarfarinInr(string ID, string inr_goal, string Description)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;

        if (!string.IsNullOrEmpty(ID)) cm.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
        cm.Parameters.Add("@inr_goal", SqlDbType.VarChar, 50).Value = inr_goal;
        if (!string.IsNullOrEmpty(Description)) cm.Parameters.Add("@Description", SqlDbType.VarChar, 150).Value = Description;
        cm.CommandText = "AddUpdateWarfarinInr";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;
    }
    public void DeleteWarfarinInr(string ID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;

        cm.Parameters.Add("@ID", SqlDbType.Int).Value = ID;

        cm.CommandText = "DeleteWarfarinInr";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }
    public DataSet GetWarfarinTrackingPerSiteByDate(int site, string startDate, string endDate)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetWarfarinTrackingPerSiteByDate", myConnection);
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
    public DataSet GetWarfarinIndicationPerSiteByDate(int site, string startDate, string endDate)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetWarfarinIndicationPerSiteByDate", myConnection);
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
    public DataSet GetWarfarinWarfarinInrGoalPerSiteByDate(int site, string startDate, string endDate)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetWarfarinWarfarinInrGoalPerSiteByDate", myConnection);
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
    public DataSet GetWarfarinLabsInrPerSiteByDate(int site, string startDate, string endDate)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetWarfarinLabsInrPerSiteByDate", myConnection);
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
    public DataSet GetWarfarinLabsByWarfarinTrackingID(int WarfarinTrackingID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetWarfarinLabsByWarfarinTrackingID", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@WarfarinTrackingID", SqlDbType.Int).Value = WarfarinTrackingID;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
}