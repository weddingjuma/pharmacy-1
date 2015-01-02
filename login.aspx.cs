using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cmdSubmit_Click(object sender, EventArgs e)
    {
        Users us = new Users ();
        DataSet ds = us.GetUser(txtUserID.Text);
        if (ds.Tables[0].Rows.Count > 0)
        {
            if (ds.Tables[0].Rows[0]["password"] != DBNull.Value)
            {

                if (ds.Tables[0].Rows[0]["password"].ToString () == txtPassword.Text &&
                    ds.Tables[0].Rows[0]["Active"].ToString() == "True")
                {
                    Session["UserID"] = txtUserID.Text;
                    Session["UserRole"] = ds.Tables[0].Rows[0]["UserRole"].ToString();
                    Session["Site"] = ds.Tables[0].Rows[0]["SiteID"].ToString();
                    Session["UserID"] = lblError.Text = txtUserID.Text;
                    
                    if (ds.Tables[0].Rows[0]["Interventions"] != DBNull.Value)
                    {
                        Session["Interventions"] = ds.Tables[0].Rows[0]["Interventions"];
                    }
                    else
                    {
                        Session["Interventions"] = false;
                    }

                    if (ds.Tables[0].Rows[0]["TempTaskLog"] != DBNull.Value)
                    {
                        Session["TempTaskLog"] = ds.Tables[0].Rows[0]["TempTaskLog"];
                    }
                    else
                    {
                        Session["TempTaskLog"] = false;
                    }
                    if (ds.Tables[0].Rows[0]["AntibioticTracking"] != DBNull.Value)
                    {
                        Session["AntibioticTracking"] = ds.Tables[0].Rows[0]["AntibioticTracking"];
                    }
                    else
                    {
                        Session["AntibioticTracking"] = false; 
                    }
                    if (ds.Tables[0].Rows[0]["WarfarinTracking"] != DBNull.Value)
                    {
                        Session["WarfarinTracking"] = ds.Tables[0].Rows[0]["WarfarinTracking"];
                    }
                    else
                    {
                        Session["WarfarinTracking"] = false;
                    }
                    if (ds.Tables[0].Rows[0]["TaskLogsTracking"] != DBNull.Value)
                    {
                        Session["TaskLogsTracking"] = ds.Tables[0].Rows[0]["TaskLogsTracking"];
                    }
                    else
                    {
                        Session["TaskLogsTracking"] = false;
                    }
                    if (ds.Tables[0].Rows[0]["CompoundingLog"] != DBNull.Value)
                    {
                        Session["CompoundingLog"] = ds.Tables[0].Rows[0]["CompoundingLog"];
                    }
                    else
                    {
                        Session["CompoundingLog"] = false;
                    }

                    string FullName = "";
                    if (ds.Tables[0].Rows[0]["FirstName"] != DBNull.Value)
                    {
                        FullName = ds.Tables[0].Rows[0]["FirstName"].ToString();
                    }

                    if (ds.Tables[0].Rows[0]["lastName"] != DBNull.Value)
                    {
                        FullName = FullName + " " + ds.Tables[0].Rows[0]["LastName"].ToString();
                    }
                    Session["FullName"] = FullName;
                    //redirect here
                    us.AddUserLog(txtUserID.Text, "Login");
                    Response.Redirect("~/dashboard.aspx");
                }
                else
                {
                    lblError.Text = "Invalid Login.";
                }

            }
            else
            {
                lblError.Text = "Invalid Password";
            }
        }
        else
        {
            lblError.Text = "Invalid User ID";
        }
    }
   
}