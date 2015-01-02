using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data ;

public partial class profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) return;
        Users u = new Users();
        DataSet ds = u.GetUser(Session["UserID"].ToString());
        if (ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow dr in ds.Tables[0].Rows)
            {

                if (dr["Password"] != DBNull.Value)
                {
                    txtPassword.Attributes.Add("value", dr["Password"].ToString());
                }
                if (dr["FirstName"] != DBNull.Value)
                {
                    txtFirstName.Text = dr["FirstName"].ToString();
                }
                else
                {
                    txtFirstName.Text = "";
                }
                if (dr["LastName"] != DBNull.Value)
                {
                    txtLastName.Text = dr["LastName"].ToString();
                }
                else
                {
                    txtLastName.Text = "";
                }
                if (dr["Address"] != DBNull.Value)
                {
                    txtAddress.Text = dr["Address"].ToString();
                }
                else
                {
                    txtAddress.Text = "";
                }
                if (dr["City"] != DBNull.Value)
                {
                    txtCity.Text = dr["City"].ToString();
                }
                else
                {
                    txtCity.Text = "";
                }
                if (dr["State"] != DBNull.Value)
                {
                    txtState.Text = dr["State"].ToString();
                }
                else
                {
                    txtState.Text = "";
                }
                if (dr["ZipCode"] != DBNull.Value)
                {
                    txtZipCode.Text = dr["Zipcode"].ToString();
                }
                else
                {
                    txtZipCode.Text = "";
                }
                if (dr["Email"] != DBNull.Value)
                {
                    txtEmail.Text = dr["Email"].ToString();
                }
                else
                {
                    txtEmail.Text = "";
                }
                if (dr["Phone"] != DBNull.Value)
                {
                    txtPhone.Text = dr["Phone"].ToString();
                }
                else
                {
                    txtPhone.Text = "";
                }

                lblError.Text = "";
            }
        }
    }
    protected void cmdSave_Click(object sender, EventArgs e)
    {
        Users u = new Users();
        u.UpdateUserProfile(Session["UserID"].ToString(), txtPassword.Text, txtFirstName.Text, txtLastName.Text, txtAddress.Text, txtCity.Text, txtState.Text, txtZipCode.Text, txtEmail.Text, txtPhone.Text);
        lblError.Text = "Transaction completed";
    }
}