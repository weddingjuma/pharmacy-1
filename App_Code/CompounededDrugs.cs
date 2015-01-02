using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;

/// <summary>
/// Summary description for CompounededDrugs
/// </summary>
public class CompounededDrugs
{


    public DataSet GetCompoundedLookup(string Type, string prefixText)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetCompoundedLookup", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        if (!string.IsNullOrEmpty(Type)) myCommand.SelectCommand.Parameters.Add("@type", SqlDbType.VarChar, 50).Value = Type;
        if (!string.IsNullOrEmpty(prefixText)) myCommand.SelectCommand.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = prefixText;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }

    public DataSet GetCompoundedLookupByID(string id)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetCompoundedLookupByID", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        if (!string.IsNullOrEmpty(id)) myCommand.SelectCommand.Parameters.Add("@id", SqlDbType.VarChar, 50).Value = id;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }
    public void AddLookup(string id, string name,string type)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandText = "AddUpdateCompoundedLookup";
        cm.CommandType = CommandType.StoredProcedure;
        if (!string.IsNullOrEmpty (id)) cm.Parameters.Add("@id", SqlDbType.Int).Value = id;
        cm.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = name;
        cm.Parameters.Add("@type", SqlDbType.VarChar, 50).Value = type;

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn.Dispose();
    }
    public void DeleteLookup(string id)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandText = "DeleteLookup";
        cm.CommandType = CommandType.StoredProcedure;
        cm.Parameters.Add("@id", SqlDbType.Int).Value = id;
        
        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn.Dispose();
    }

    public void AddUpdateCompoundedDrugs(string ID,string SiteID, string Drug,string Strength, string Concentration, string Qty,string Form, string Size, string Internal_Lot_Number,string Expiry_Date,string Expiry_Time,string PreparedBy)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandText = "AddUpdateCompoundedDrugs";
        cm.CommandType = CommandType.StoredProcedure;
        if (!string.IsNullOrEmpty(ID)) cm.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
        cm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID;
        cm.Parameters.Add("@Date_entered", SqlDbType.DateTime).Value = DateTime.Now.ToShortDateString ();
        cm.Parameters.Add("@Drug", SqlDbType.VarChar, 150).Value = Drug ;
        cm.Parameters.Add("@Concentration", SqlDbType.VarChar, 50).Value = Concentration ;
        cm.Parameters.Add("@Strength", SqlDbType.VarChar, 50).Value = Strength;
        cm.Parameters.Add("@Qty", SqlDbType.VarChar, 50).Value = Qty;
        cm.Parameters.Add("@Form", SqlDbType.VarChar, 50).Value = Form;
        cm.Parameters.Add("@Size", SqlDbType.VarChar, 50).Value = Size;
	    if (!string.IsNullOrEmpty (Internal_Lot_Number )) cm.Parameters.Add("@Internal_Lot_Number", SqlDbType.VarChar  ,50).Value = Internal_Lot_Number ;
        if (!string.IsNullOrEmpty (Expiry_Date )) cm.Parameters.Add("@Expiry_Date", SqlDbType.DateTime ).Value = Expiry_Date ;
        if (!string.IsNullOrEmpty (Expiry_Time )) cm.Parameters.Add("@Expiry_Time", SqlDbType.Time  ).Value = Expiry_Time ;
        if (!string.IsNullOrEmpty(PreparedBy)) cm.Parameters.Add("@PreparedBy", SqlDbType.VarChar, 50).Value = PreparedBy;
        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn.Dispose();
    }

    public void AddUpdateCompoundedDrugsDetails(string ID, string CompoundedDrugID, string Additive, string Strength, string Concentration, string Qty, string Form, string Size, string Lot_Number, string Mfg_expiry_date, string Drug_Manufacturer)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandText = "AddUpdateCompoundedDrugsDetails";
        cm.CommandType = CommandType.StoredProcedure;
        if (!string.IsNullOrEmpty(ID)) cm.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
        cm.Parameters.Add("@CompoundedDrugID", SqlDbType.Int).Value = CompoundedDrugID;
        cm.Parameters.Add("@Additive", SqlDbType.VarChar, 150).Value = Additive;
        cm.Parameters.Add("@Concentration", SqlDbType.VarChar, 50).Value = Concentration;
        cm.Parameters.Add("@Strength", SqlDbType.VarChar, 50).Value = Strength;
        cm.Parameters.Add("@Qty", SqlDbType.VarChar, 50).Value = Qty;
        cm.Parameters.Add("@Form", SqlDbType.VarChar, 50).Value = Form;
        cm.Parameters.Add("@Size", SqlDbType.VarChar, 50).Value = Size;
        cm.Parameters.Add("@Lot_Number", SqlDbType.VarChar, 50).Value = Lot_Number;
        cm.Parameters.Add("@Mfg_expiry_date", SqlDbType.DateTime).Value = Mfg_expiry_date;
        cm.Parameters.Add("@Drug_Manufacturer", SqlDbType.VarChar, 50).Value = Drug_Manufacturer;
        


        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn.Dispose();
    }
    public void DeleteCompoundedDrugsDetails(string ID)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandText = "DeleteCompoundedDrugsDetails";
        cm.CommandType = CommandType.StoredProcedure;
        cm.Parameters.Add("@ID", SqlDbType.Int).Value = Convert.ToInt32(ID);

        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn.Dispose();
    }

    public DataSet GetCompoundedDrugs(string SiteID,string StartDate,string EndDate)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetCompoundedDrugs", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@SiteID", SqlDbType.Int ).Value = SiteID ;
        if (!string.IsNullOrEmpty(StartDate )) myCommand.SelectCommand.Parameters.Add("@StartDate", SqlDbType.DateTime ).Value = StartDate ;
        if (!string.IsNullOrEmpty(EndDate )) myCommand.SelectCommand.Parameters.Add("@EndDate", SqlDbType.DateTime ).Value = EndDate ;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }


    public DataSet GetCompoundedDrugsByID(string ID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetCompoundedDrugsByID", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }


    public DataSet GetCompoundedDrugsDetails(string CompoundedDrugID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetCompoundedDrugDetails", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@CompoundedDrugID", SqlDbType.Int).Value = CompoundedDrugID;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }
    public DataSet GetCompoundedDrugsDetailsByID(string ID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetCompoundedDrugDetailsByID", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }
    public void UpdateCompoundedDrugsCheckedBy(string ID, string checkedBy)
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        cn.Open();

        cm.Connection = cn;
        cm.CommandText = "UpdateCompoundedDrugsCheckedBy";
        cm.CommandType = CommandType.StoredProcedure;
        if (!string.IsNullOrEmpty(ID)) cm.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
        cm.Parameters.Add("@CheckedBy", SqlDbType.VarChar, 50).Value = checkedBy;
        cm.ExecuteNonQuery();

        cm.Dispose();
        cn.Close();
        cn.Dispose();
    }
}