using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail ;

/// <summary>
/// Summary description for Support
/// </summary>
public class Support
{
    public DataSet GetAllergies()
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetAllergies", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }
    public DataSet GetSites(string ID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        myConnection.Open();
        SqlDataAdapter myCommand = new SqlDataAdapter("GetSites", myConnection);
        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;
        if (!string.IsNullOrEmpty(ID)) myCommand.SelectCommand.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
        DataSet result = new DataSet();
        myCommand.Fill(result);

        myConnection.Close();
        myCommand.Dispose();
        myConnection = null;

        return result;
    }

    
    public void sendEmail(string subject,string body) 
    {

        string fromAddress = ConfigurationManager .AppSettings["fromAddress"].ToString();
        string fromDisplayName = ConfigurationManager.AppSettings["fromDisplayName"].ToString();
        string to = ConfigurationManager.AppSettings["toEmail"].ToString();
        MailMessage message = new MailMessage();
        SmtpClient smtp = new SmtpClient();
        //smtp.EnableSsl = true;          
        message.IsBodyHtml = true;
        message.To.Add(to);
        message.From = new MailAddress(fromAddress, fromDisplayName);
        message.Subject = subject;
        string HTMLBody = body;

        //CallEmailTemplate
        
        message.Body = HTMLBody; 
        smtp.Send(message);
    }
}