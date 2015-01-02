<%@ WebHandler Language="C#" Class="GetWarfarinInrGoal" %>

using System;
using System.Web;
using System.Text;
using System.Data;

public class GetWarfarinInrGoal : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string prefixText = context.Request.QueryString["term"];

        DataSet ds = new DataSet();
        Warfarin w = new Warfarin();
        ds = w.GetWarfarinInrGoal();
        StringBuilder sb = new StringBuilder();

        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            sb.Append("\"" + dr["inr_goal"] + "\",");
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