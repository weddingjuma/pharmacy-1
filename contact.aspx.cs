using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PagesDB p = new PagesDB();
        DataSet ds = p.GetCompanyInfo();
        if (ds.Tables[0].Rows.Count > 0)
        {
            
            if (ds.Tables[0].Rows[0]["phone"] != DBNull.Value)
            {
                lblPhone.Text = ds.Tables[0].Rows[0]["phone"].ToString();
            }
            
            if (ds.Tables[0].Rows[0]["email"] != DBNull.Value)
            {
                email.InnerHtml= ds.Tables[0].Rows[0]["email"].ToString();
                email.HRef = "mailto:" + ds.Tables[0].Rows[0]["email"].ToString();
            }
            if (ds.Tables[0].Rows[0]["Url"] != DBNull.Value)
            {
                url.InnerHtml  = ds.Tables[0].Rows[0]["Url"].ToString();
                url.HRef = "http://" + ds.Tables[0].Rows[0]["Url"].ToString();
            }
        }

        DataSet ds1 = p.GetContentByPage("contact");
        if (ds1.Tables[0].Rows.Count > 0)
        {
            if (ds1.Tables[0].Rows[0]["content"] != DBNull.Value)
            {
                lblContent.Text = ds1.Tables[0].Rows[0]["content"].ToString();
            }
        }
    }
}
