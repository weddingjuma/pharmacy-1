<%@ WebHandler Language="C#" Class="GetActions" %>

using System;
using System.Web;
using System.Text;
using System.Data;

public class GetActions : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string prefixText = context.Request.QueryString["term"];

        DataSet ds = new DataSet();
        ActionsDB t = new ActionsDB();
        ds = t.GetActionsByName(prefixText);
        StringBuilder sb = new StringBuilder();

        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            sb.Append("\"" + dr["Action"] + "\",");
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