using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data ;
using System.Data.SqlClient ;
using System.Configuration;

/// <summary>
/// Summary description for users
/// </summary>
public class Users
{
    public Users()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataSet GetUserRoles()
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetUserRoles", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    
    public DataSet GetUsers()
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetUsers", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetSitesUsers(string siteId)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetSitesUsers", myConnection);
        if (!string.IsNullOrEmpty(siteId)) myCommand.SelectCommand.Parameters.Add("@SiteID", SqlDbType.Int).Value = Convert.ToInt32(siteId);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetUser(string UserID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetUsers", myConnection);

        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@UserID", SqlDbType.VarChar, 50).Value = UserID;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public void AddUpdateUser(Guid guid, string UserID, string SiteID, string Password, string FirstName, string LastName, string Address, string City, string State, string ZipCode, string Email, string Phone, String UserRole, Boolean Active)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;

        cm.Parameters.Add("@guid", SqlDbType.UniqueIdentifier).Value = guid;
        cm.Parameters.Add("@UserID", SqlDbType.VarChar, 50).Value = UserID;
        cm.Parameters.Add("@SiteID", SqlDbType.VarChar, 50).Value = SiteID;
        cm.Parameters.Add("@Password", SqlDbType.VarChar, 50).Value = Password;
        if (!string.IsNullOrEmpty(FirstName)) cm.Parameters.Add("@FirstName", SqlDbType.VarChar, 50).Value = FirstName;
        if (!string.IsNullOrEmpty(LastName)) cm.Parameters.Add("@LastName", SqlDbType.VarChar, 50).Value = LastName;
        if (!string.IsNullOrEmpty(Address)) cm.Parameters.Add("@Address", SqlDbType.VarChar, 50).Value = Address;
        if (!string.IsNullOrEmpty(City)) cm.Parameters.Add("@City", SqlDbType.VarChar, 50).Value = City;
        if (!string.IsNullOrEmpty(State)) cm.Parameters.Add("@State", SqlDbType.VarChar, 50).Value = State;
        if (!string.IsNullOrEmpty(ZipCode)) cm.Parameters.Add("@ZipCode", SqlDbType.VarChar, 10).Value = ZipCode;
        if (!string.IsNullOrEmpty(Email)) cm.Parameters.Add("@Email", SqlDbType.VarChar, 50).Value = Email;
        if (!string.IsNullOrEmpty(Phone)) cm.Parameters.Add("@Phone", SqlDbType.VarChar, 50).Value = Phone;
        if (!string.IsNullOrEmpty(UserRole )) cm.Parameters.Add("@UserRole", SqlDbType.Int).Value = UserRole;
        cm.Parameters.Add("@Active", SqlDbType.Bit).Value = Active;

        cm.CommandText = "AddUpdateUser";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }
    public void UpdateUserProfile(string UserID, string Password, string FirstName, string LastName, string Address, string City, string State, string ZipCode, string Email, string Phone)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;


        cm.Parameters.Add("@UserID", SqlDbType.VarChar, 50).Value = UserID;
        cm.Parameters.Add("@Password", SqlDbType.VarChar, 50).Value = Password;
        if (!string.IsNullOrEmpty(FirstName)) cm.Parameters.Add("@FirstName", SqlDbType.VarChar, 50).Value = FirstName;
        if (!string.IsNullOrEmpty(LastName)) cm.Parameters.Add("@LastName", SqlDbType.VarChar, 50).Value = LastName;
        if (!string.IsNullOrEmpty(Address)) cm.Parameters.Add("@Address", SqlDbType.VarChar, 50).Value = Address;
        if (!string.IsNullOrEmpty(City)) cm.Parameters.Add("@City", SqlDbType.VarChar, 50).Value = City;
        if (!string.IsNullOrEmpty(State)) cm.Parameters.Add("@State", SqlDbType.VarChar, 50).Value = State;
        if (!string.IsNullOrEmpty(ZipCode)) cm.Parameters.Add("@ZipCode", SqlDbType.VarChar, 10).Value = ZipCode;
        if (!string.IsNullOrEmpty(Email)) cm.Parameters.Add("@Email", SqlDbType.VarChar, 50).Value = Email;
        if (!string.IsNullOrEmpty(Phone)) cm.Parameters.Add("@Phone", SqlDbType.VarChar, 50).Value = Phone;
        
        cm.CommandText = "UpdateUserProfile";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }
    public Boolean IsUserExist(string UserID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetUsers", myConnection);

        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@UserID", SqlDbType.VarChar, 50).Value = UserID;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;
        if (result.Tables[0].Rows.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }

        
    }
    public void AddUserLog(string UserID, string LoginType)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myConnection.Open();

        SqlCommand cm = new SqlCommand();

        cm.Connection = myConnection;
        cm.CommandType = CommandType.StoredProcedure;


        cm.Parameters.Add("@UserID", SqlDbType.VarChar, 50).Value = UserID;
        cm.Parameters.Add("@LoginType", SqlDbType.VarChar ,50).Value = LoginType;

        cm.CommandText = "AddUserLog";
        cm.ExecuteNonQuery();

        cm.Dispose();
        myConnection.Close();
        myConnection = null;

    }
    public DataSet GetUserLogBySite(int site, string startDate, string endDate)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetUserLogBySite", myConnection);
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
}