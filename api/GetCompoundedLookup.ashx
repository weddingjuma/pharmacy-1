<%@ WebHandler Language="C#" Class="GetActions" %>

using System;
using System.Web;
using System.Text;
using System.Data;

public class GetActions : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        string prefixText = context.Request.QueryString["term"];
        string ntype = context.Request.QueryString["type"];
        string type="";

        if (ntype == "1")
        {
            type = "Compounded Drug";
        }

        if (ntype == "2")
        {
            type = "Additive Strength";
        }
        if (ntype == "3")
        {
            type = "Concentration";
        }
        if (ntype == "4")
        {
            type = "Form";
        }
        DataSet ds = new DataSet();
        CompounededDrugs co = new CompounededDrugs();
        ds = co.GetCompoundedLookup(type,prefixText);
        StringBuilder sb = new StringBuilder();

        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            sb.Append("\"" + dr["name"] + "\",");
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