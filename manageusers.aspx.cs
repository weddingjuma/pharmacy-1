using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class manageusers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserRole"] != null)
        {
            if (Session["UserRole"].ToString() != "3")
            {
                Response.Redirect("~/dashboard.aspx");
            }
        }
        else
        {
            Response.Redirect("~/login.aspx");
        }
        if (!Page.IsPostBack)
        {
            SiteDB s = new SiteDB();
            DataSet ds = s.GetSites();
            ddlSites.DataSource = ds.Tables[0];
            ddlSites.DataTextField = "SiteName";
            ddlSites.DataValueField = "ID";
            ddlSites.DataBind();

            Users u = new Users();
            DataSet dbu = u.GetUserRoles();
            ddlUserRole.DataSource = dbu.Tables[0];
            ddlUserRole.DataTextField = "RoleName";
            ddlUserRole.DataValueField = "RoleID";
            ddlUserRole.DataBind();

            DataSet dsUsers=u.GetUsers ();
            GridView1.DataSource = dsUsers.Tables[0];
            GridView1.DataBind();
        }
    
    }
    protected void cmdSave_Click(object sender, EventArgs e)
    {
        try
        {
            Users u = new Users();
            u.AddUpdateUser(Guid.NewGuid(),txtUserID.Text, ddlSites.SelectedValue.ToString(), txtPassword.Text, txtFirstName.Text, txtLastName.Text, txtAddress.Text, txtCity.Text, txtState.Text, txtZipCode.Text, txtEmail.Text, txtPhone.Text, ddlUserRole.SelectedValue.ToString(), chkActive.Checked);
            lblError.Text = "Transaction Completed";
            lblError.CssClass = "success";
            txtUserID.Text = "";
            hUserID.Value = "";
            ddlSites.ClearSelection();
            txtPassword.Attributes["value"] = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtZipCode.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            ddlUserRole.ClearSelection();
            chkActive.Checked = false;
            DataSet dsUsers = u.GetUsers();
            GridView1.DataSource = dsUsers.Tables[0];
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = "Error";
            lblError.CssClass = "error";
        }
    }
    
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Users u= new Users ();
        DataSet ds = u.GetUser(GridView1.SelectedDataKey.Value.ToString());
        if (ds.Tables[0].Rows.Count > 0)
        {
            foreach(DataRow dr in ds.Tables[0].Rows )
            {
                txtUserID.Text = dr["UserID"].ToString ();
                hUserID.Value = dr["UserID"].ToString();
                if (dr["SiteID"] != DBNull.Value)
                { 
                    ddlSites.SelectedValue = dr["SiteID"].ToString (); 
                }
                else
                {
                    ddlSites.ClearSelection (); 
                }
                if (dr["Password"] != DBNull.Value)
                {
                    txtPassword.Attributes.Add ("value",dr["Password"].ToString ());
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
                    txtLastName.Text = dr["LastName"].ToString ();
                }
                else
                {
                    txtLastName.Text = "";
                }
                if (dr["Address"] != DBNull.Value)
                {
                    txtAddress.Text = dr["Address"].ToString ();
                }
                else
                {
                    txtAddress.Text = "";
                }
                if (dr["City"] != DBNull.Value)
                {
                    txtCity.Text = dr["City"].ToString ();
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
                if (dr["UserRole"] != DBNull.Value)
                {
                    ddlUserRole.SelectedValue=dr["UserRole"].ToString ();
                }
                else
                {
                    ddlUserRole.ClearSelection();
                }
                if (dr["Active"] != DBNull.Value)
                {
                    chkActive.Checked = Convert.ToBoolean (dr["Active"].ToString ());
                }
                else
                {
                    chkActive.Checked = false;
                }
                lblError.Text = "";
            }
        }
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        Users u = new Users();
        lblError.Text = "";
        lblError.CssClass = "success";
        txtUserID.Text = "";
        hUserID.Value = "";
        ddlSites.ClearSelection();
        txtPassword.Attributes["value"] = "";
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtAddress.Text = "";
        txtCity.Text = "";
        txtState.Text = "";
        txtZipCode.Text = "";
        txtEmail.Text = "";
        txtPhone.Text = "";
        ddlUserRole.ClearSelection();
        chkActive.Checked = false;
        DataSet dsUsers = u.GetUsers();
        GridView1.DataSource = dsUsers.Tables[0];
        GridView1.DataBind();
    }
}