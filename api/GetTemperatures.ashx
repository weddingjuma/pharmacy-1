<%@ WebHandler Language="C#" Class="GetTemperatures" %>

using System;
using System.Web;
using System.Text;
using System.Data;

public class GetTemperatures : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string prefixText = context.Request.QueryString["term"];

        DataSet ds = new DataSet();
        TemperatureDB tdb = new TemperatureDB();
        ds = tdb.GetTemperatures();

        StringBuilder sb = new StringBuilder();
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            sb.Append("\"" + dr["Temperature"] + "\",");
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