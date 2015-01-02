<%@ WebHandler Language="C#" Class="GetCorrectiveAction" %>

using System;
using System.Web;
using System.Text;
using System.Data;

public class GetCorrectiveAction : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string prefixText = context.Request.QueryString["term"];

        DataSet ds = new DataSet();
        ActionsDB adb = new ActionsDB();
        ds = adb.GetCorrectiveActions();
        StringBuilder sb = new StringBuilder();

        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            sb.Append("\"" + dr["CorrectiveAction"] + "\",");
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