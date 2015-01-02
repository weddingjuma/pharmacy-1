using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
/// <summary>
/// Summary description for PagesDB
/// </summary>
public class PagesDB
{
	public PagesDB()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataSet GetCompanyInfo()
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetCompanyInfo", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
    public DataSet GetContentByPage(string pagename)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetContentByPage", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        myCommand.SelectCommand.Parameters.Add("@pagename", SqlDbType.VarChar, 50).Value = pagename;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myConnection = null;

        return result;
    }
}