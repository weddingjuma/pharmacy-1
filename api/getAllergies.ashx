<%@ WebHandler Language="C#" Class="getAllergies" %>

using System;
using System.Web;
using System.Text;
using System.Data;
using System.Web.SessionState;

public class getAllergies : IHttpHandler, IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) 
    {
        if (HttpContext.Current.Session["UserID"] == null)
        {
            HttpContext.Current.Session.Clear();
            context.Response.Redirect("~/login.aspx");
        }
        
        string prefixText = context.Request.QueryString["term"];

        DataSet ds = new DataSet();
        Allergies al = new Allergies();
        ds = al.GetAllergiesByName(prefixText);
        StringBuilder sb = new StringBuilder();
        
        foreach (DataRow dr in ds.Tables [0].Rows )
        {
            sb.Append("\"" + dr["Allergy"] + "\",");
        }
        string x = sb.ToString().TrimEnd(',');
        x = "[" + x + "]";
        context.Response.Write(x); 
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}