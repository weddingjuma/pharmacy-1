<%@ WebHandler Language="C#" Class="GetEquipment" %>

using System;
using System.Web;
using System.Text;
using System.Data;

public class GetEquipment : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string prefixText = context.Request.QueryString["term"];

        DataSet ds = new DataSet();
        EquipmentDB t = new EquipmentDB();
        ds = t.GetEquipmentByName (prefixText);
        StringBuilder sb = new StringBuilder();

        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            sb.Append("\"" + dr["Equipment"] + "\",");
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