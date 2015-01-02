<%@ WebHandler Language="C#" Class="GetDrugs" %>

using System;
using System.Web;
using System.Text;
using System.Data;

public class GetDrugs : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string prefixText = context.Request.QueryString["term"];

        DataSet ds = new DataSet();
        Drugs drs = new Drugs();
        ds = drs.GetDrugs();
        StringBuilder sb = new StringBuilder();

        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            sb.Append("\"" + dr["Drug"] + "\",");
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