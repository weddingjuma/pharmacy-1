using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class guidelines : System.Web.UI.Page
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
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (FileUpload1.HasFile) FileUpload1.SaveAs(Server.MapPath(" ") + "\\guidelines\\AntibioticTreatmentReference.pdf");
            if (FileUpload2.HasFile) FileUpload2.SaveAs(Server.MapPath(" ") + "\\guidelines\\WarfarinTreatmentReference.pdf");
            lblMessage.Text = "Documents uploaded.";
            lblMessage.CssClass = "success";
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Documents failed to upload.";
            lblMessage.CssClass = "error";
        }
    }
    
}