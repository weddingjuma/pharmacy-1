<%@ WebHandler Language="C#" Class="GetInterventionTypes" %>

using System;
using System.Web;
using System.Text;
using System.Data;
using System.Web.SessionState;

public class GetInterventionTypes : IHttpHandler, IRequiresSessionState
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
        InterventionsDB In = new InterventionsDB();
        ds = In.GetInterventionTypesByName(prefixText,HttpContext.Current.Session["Site"].ToString());
        StringBuilder sb = new StringBuilder();

        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            sb.Append("\"" + dr["InterventionType"] + "\",");
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