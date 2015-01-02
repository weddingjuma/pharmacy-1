<%@ WebHandler Language="C#" Class="GetTasks" %>

using System;
using System.Web;
using System.Text;
using System.Data;

public class GetTasks : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string prefixText = context.Request.QueryString["term"];

        DataSet ds = new DataSet();
        TaskDB t = new TaskDB();
        ds = t.GetTasksByName(prefixText);
        StringBuilder sb = new StringBuilder();

        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            sb.Append("\"" + dr["Task"] + "\",");
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