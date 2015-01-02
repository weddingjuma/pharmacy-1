<%@ WebHandler Language="C#" Class="GetAntibiotcIndications" %>

using System;
using System.Web;
using System.Text;
using System.Data;

public class GetAntibiotcIndications : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string prefixText = context.Request.QueryString["term"];

        DataSet ds = new DataSet();
        Antibiotic an = new Antibiotic();
        ds = an.GetAntibiotcIndications();
        StringBuilder sb = new StringBuilder();

        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            sb.Append("\"" + dr["AntibioticIndication"] + "\",");
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