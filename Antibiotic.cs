using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Antibiotic
/// </summary>
public class Antibiotic
{
	public Antibiotic()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet GetAntibioticTrackingByPatientID(string PatientID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetAntibioticTrackingByPatientID", myConnection);
        myCommand.SelectCommand.Parameters.Add("@PatientID", SqlDbType.Int).Value = Convert.ToInt32(PatientID);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }
    public DataSet GetAntibioticAntibioticPrescribedByAntibioticTrackingID(string AntibioticTrackingID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetAntibioticAntibioticPrescribedByAntibioticTrackingID", myConnection);
        myCommand.SelectCommand.Parameters.Add("@AntibioticTrackingID", SqlDbType.Int).Value = Convert.ToInt32(AntibioticTrackingID);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }
    public DataSet GetAntibioticLabsByAntibioticTrackingID(string AntibioticTrackingID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetAntibioticLabsByAntibioticTrackingID", myConnection);
        myCommand.SelectCommand.Parameters.Add("@AntibioticTrackingID", SqlDbType.Int).Value = Convert.ToInt32(AntibioticTrackingID);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }
    public DataSet GetAntibiotcIndications()
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetAntibioticIndications", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public string AddUpdateAntibioticTracking(string AntibioticTrackingID, string PatientID, string medHistory, string otherInfo)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "AddUpdateAntibioticTracking";

        if (!string.IsNullOrEmpty(AntibioticTrackingID)) cm.Parameters.Add("@AntibioticTrackingID", SqlDbType.Int).Value = AntibioticTrackingID;
        cm.Parameters.Add("@PatientID", SqlDbType.Int).Value = PatientID;
        cm.Parameters.Add("@MedHistory", SqlDbType.Text).Value = medHistory;
        cm.Parameters.Add("@OtherInfo", SqlDbType.Text).Value = otherInfo;

        string antibioticTrackingId;
        antibioticTrackingId = cm.ExecuteScalar().ToString();

        cm.Dispose();
        cn.Close();
        cn = null;

        return antibioticTrackingId;
    }
    public void AddUpdateAntibioticStewardshipChecklist(string ID, string AntibioticTrackingID, string Cultures, string CulturesDate,
        string AntibioticsAppropriate, string AntibioticsAppropriateComments, string OralAntibiotics, string OralAntibioticsComments,
        string otherInformation)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "AddUpdateAntibioticStewardshipChecklist";

        if (!string.IsNullOrEmpty(ID)) cm.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
        cm.Parameters.Add("@AntibioticTrackingID", SqlDbType.Int).Value = AntibioticTrackingID;
        cm.Parameters.Add("@Cultures", SqlDbType.VarChar, 50).Value = Cultures;
        if (!string.IsNullOrEmpty(CulturesDate)) cm.Parameters.Add("@CulturesDate", SqlDbType.DateTime).Value = Convert.ToDateTime(CulturesDate);
        cm.Parameters.Add("@AntibioticsAppropriate", SqlDbType.VarChar, 50).Value = AntibioticsAppropriate;
        if (!string.IsNullOrEmpty(AntibioticsAppropriateComments)) cm.Parameters.Add("@AntibioticsAppropriateComments", SqlDbType.Text).Value = AntibioticsAppropriateComments;
        cm.Parameters.Add("@OralAntibiotics", SqlDbType.VarChar, 50).Value = OralAntibiotics;
        if (!string.IsNullOrEmpty(OralAntibioticsComments)) cm.Parameters.Add("@OralAntibioticsComments", SqlDbType.Text).Value = OralAntibioticsComments;
        if (!string.IsNullOrEmpty(otherInformation)) cm.Parameters.Add("@OtherInformation", SqlDbType.Text).Value = otherInformation;

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn = null;
    }
    public DataSet GetAntibioticStewardshipChecklist(string AntibioticTrackingID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetAntibioticStewardshipChecklist", myConnection);
        myCommand.SelectCommand.Parameters.Add("@AntibioticTrackingID", SqlDbType.Int).Value = Convert.ToInt32(AntibioticTrackingID);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }
    public void AddUpdateAntibioticAntibioticIndication(string AntibioticTrackingID, string AntibioticIndicationName)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "AddUpdateAntibioticAntibioticIndication";

        cm.Parameters.Add("@AntibioticTrackingID", SqlDbType.Int).Value = AntibioticTrackingID;
        cm.Parameters.Add("@AntibioticIndicationName", SqlDbType.VarChar, 100).Value = AntibioticIndicationName;

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn = null;
    }
    public void AddUpdateAntibioticIndications(string AntibioticIndicationID, string AntibioticIndication)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "AddUpdateAntibioticIndications";

        if (!string.IsNullOrEmpty(AntibioticIndicationID)) cm.Parameters.Add("@AntibioticIndicationID", SqlDbType.Int).Value = Convert.ToInt32(AntibioticIndicationID);
        cm.Parameters.Add("@AntibioticIndication", SqlDbType.VarChar, 150).Value = AntibioticIndication;

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn = null;
    }
    public void DeleteAntibioticIndications(string AntibiotcIndicationID)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "DeleteAntibioticIndications";

        cm.Parameters.Add("@AntibiotcIndicationID", SqlDbType.Int).Value = Convert.ToInt32(AntibiotcIndicationID);

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn = null;
    }
    public void AddUpdateAntibioticAntibioticPrescribed(string ID, string AntibioticTrackingID, string AntibioticPrescribedName, string Dose, string Frequency,
        string StartDate, string EndDate)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "AddUpdateAntibioticAntibioticPrescribed";

        if (!string.IsNullOrEmpty(ID)) cm.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
        cm.Parameters.Add("@AntibioticTrackingID", SqlDbType.Int).Value = AntibioticTrackingID;
        cm.Parameters.Add("@AntibioticPrescribedName", SqlDbType.VarChar, 100).Value = AntibioticPrescribedName;
        cm.Parameters.Add("@Dose", SqlDbType.VarChar, 100).Value = Dose;
        cm.Parameters.Add("@Frequency", SqlDbType.VarChar, 100).Value = Frequency;
        cm.Parameters.Add("@StartDate", SqlDbType.DateTime).Value = Convert.ToDateTime(StartDate);
        if (!string.IsNullOrEmpty(EndDate)) cm.Parameters.Add("@EndDate", SqlDbType.DateTime).Value = Convert.ToDateTime(EndDate);

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn = null;
    }
    public DataSet GetAntibioticAntibioticIndicationByAntibioticTrackingID(string AntibioticTrackingID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetAntibioticAntibioticIndicationByAntibioticTrackingID", myConnection);
        myCommand.SelectCommand.Parameters.Add("@AntibioticTrackingID", SqlDbType.Int).Value = Convert.ToInt32(AntibioticTrackingID);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }
    public void DeleteAntibioticAntibioticIndication(string AntibioticTrackingID, string AntibioticIndicationName)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "DeleteAntibioticAntibioticIndication";

        cm.Parameters.Add("@AntibioticTrackingID", SqlDbType.Int).Value = Convert.ToInt32(AntibioticTrackingID);
        cm.Parameters.Add("@AntibioticIndicationName", SqlDbType.VarChar, 100).Value = AntibioticIndicationName;

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn = null;
    }
    public void DeleteAntibioticAntibioticPrescribed(string ID)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "DeleteAntibioticAntibioticPrescribed";

        cm.Parameters.Add("@ID", SqlDbType.Int).Value = Convert.ToInt32(ID);

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn = null;
    }
    public void AddUpdateAntibioticLab(string ID, string AntibioticTrackingID,
        string LabDate, string WBC, string HGB, string HCT, string PLT, string Na,
        string Cl, string K, string CO2, string BUN, string SRCR, string Glucose, double CRCL, string EnteredBy)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "AddUpdateAntibioticLab";

        if (!string.IsNullOrEmpty(ID)) cm.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
        cm.Parameters.Add("@AntibioticTrackingID", SqlDbType.Int).Value = AntibioticTrackingID;
        //cm.Parameters.Add("@LabDate", SqlDbType.DateTime).Value = Convert.ToDateTime(LabDate);
        cm.Parameters.Add("@WBC", SqlDbType.Int).Value = Convert.ToInt32(WBC);
        cm.Parameters.Add("@HGB", SqlDbType.Int).Value = Convert.ToInt32(HGB);
        cm.Parameters.Add("@HCT", SqlDbType.Int).Value = Convert.ToInt32(HCT);
        cm.Parameters.Add("@PLT", SqlDbType.Int).Value = Convert.ToInt32(PLT);
        cm.Parameters.Add("@Na", SqlDbType.Int).Value = Convert.ToInt32(Na);
        cm.Parameters.Add("@Cl", SqlDbType.Int).Value = Convert.ToInt32(Cl);
        cm.Parameters.Add("@K", SqlDbType.Int).Value = Convert.ToInt32(K);
        cm.Parameters.Add("@CO2", SqlDbType.Int).Value = Convert.ToInt32(CO2);
        cm.Parameters.Add("@BUN", SqlDbType.Int).Value = Convert.ToInt32(BUN);
        cm.Parameters.Add("@SRCR", SqlDbType.Decimal).Value = Convert.ToDecimal(SRCR);
        cm.Parameters.Add("@Glucose", SqlDbType.Int).Value = Convert.ToInt32(Glucose);
        cm.Parameters.Add("@CRCL", SqlDbType.Decimal).Value = CRCL;
        cm.Parameters.Add("@EnteredBy", SqlDbType.VarChar, 50).Value = EnteredBy;
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
        cm.CommandText = "DeleteAntibioticLab";

        cm.Parameters.Add("@ID", SqlDbType.Int).Value = Convert.ToInt32(ID);

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn = null;
    }
    public DataSet GetAntibioticTrackingByPatientName(string PatientName, int site)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetAntibioticTrackingByPatientName", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@PatientName", SqlDbType.VarChar, 100).Value = PatientName;
        myCommand.SelectCommand.Parameters.Add("@Site", SqlDbType.Int).Value = site;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetPatientsAntibioticTracking(int site)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetPatientsAntibioticTracking", myConnection);
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
}