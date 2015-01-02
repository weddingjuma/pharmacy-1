using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddNewPatient : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            string patientIN = txTPatientIN.Text;
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string age = txtAge.Text;
            string dob = txtDob.Text;
            string weight = txtWeight.Text;
            string height = txtHeight.Text;
            string sex = ddlSex.SelectedItem.Text;
            string room = txtRoom.Text;
            Patients P = new Patients();
            string patientId = P.AddUpdatePatient("", patientIN, Session["Site"].ToString(), firstName,
                lastName, age, dob, height, weight, sex, room, Session["UserID"].ToString());
            Allergies a = new Allergies();
            foreach (ListItem allergy in lstAllergies.Items)
            {
                if (allergy.ToString() != String.Empty)
                {
                    a.AddPatientAllergies(patientId, allergy.ToString());
                }
            }
            lblPateintMessage.Text = "Added new patient.";
            lblPateintMessage.CssClass = "success";

        }
        catch (Exception ex)
        {
            lblPateintMessage.Text = "Error Adding Pateint";
            lblPateintMessage.CssClass = "error";
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtAllergies.Text.Trim() != string.Empty)
        {
            lstAllergies.Items.Add(txtAllergies.Text);
            txtAllergies.Text = "";
            txtAllergies.Focus();
        }
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        if (lstAllergies.SelectedValue != "")
        {
            string selecteditem = lstAllergies.SelectedItem.Text;
            lstAllergies.Items.Remove(selecteditem);
        }
        txtAllergies.Focus();
    }
}