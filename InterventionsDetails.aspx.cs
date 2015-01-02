using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class InterventionsDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string patientId = Request.QueryString["patientId"];
        //string interventionsId = Request.QueryString["interventionsId"];
        //if ((patientId == null) || (interventionsId == null))
        if (patientId == null)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }

        if (!Page.IsPostBack)
        {
            IntervetionDetail.Attributes.Add("class", "divdisplaynone");

            Patients p = new Patients();
            DataSet patient_ds = p.GetPatient(patientId);
            LoadPatientInformation(patientId, patient_ds);

            foreach (DataRow dr in patient_ds.Tables[1].Rows)
            {
                lstAllergies.Items.Add(dr["Allergy"].ToString());
            }
        }
    }
    protected void TextValidate(object source, ServerValidateEventArgs args)
    {
        if ((args.Value.Length != 0) || (args.Value != "Type Intervention Type"))
        {
            args.IsValid = true;
        }
    }
    private void LoadPatientInformation(string patientId, DataSet patient_ds)
    {
        txTPatientIN.Text = patient_ds.Tables[0].Rows[0]["PatientIN"].ToString();
        txtFirstName.Text = patient_ds.Tables[0].Rows[0]["FirstName"].ToString();
        txtLastName.Text = patient_ds.Tables[0].Rows[0]["LastName"].ToString();
        txtAge.Text = patient_ds.Tables[0].Rows[0]["Age"].ToString();
        txtHeight.Text = patient_ds.Tables[0].Rows[0]["Height"].ToString();
        txtWeight.Text = patient_ds.Tables[0].Rows[0]["Weight"].ToString();
        txtRoom.Text = patient_ds.Tables[0].Rows[0]["Room"].ToString();
        if (patient_ds.Tables[0].Rows[0]["DOB"].ToString() != String.Empty)
        {
            DateTime dob = Convert.ToDateTime(patient_ds.Tables[0].Rows[0]["DOB"].ToString());
            txtDob.Text = dob.ToShortDateString();
        }
        if (patient_ds.Tables[0].Rows[0]["Sex"].ToString() == "Male")
        {
            ddlSex.SelectedIndex = 0;
        }
        else
        {
            ddlSex.SelectedIndex = 1;
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Interventions.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            string patientId = Request.QueryString["patientId"];
            string patientIN = txTPatientIN.Text;
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string age = txtAge.Text;
            string weight = txtWeight.Text;
            string height = txtHeight.Text;
            string sex = ddlSex.SelectedItem.Text;
            string room = txtRoom.Text;
            string dob = txtDob.Text;
            Patients p = new Patients();
            patientId = p.AddUpdatePatient(patientId, patientIN, Session["Site"].ToString(), firstName,
                lastName, age, dob, height, weight, sex, room, Session["UserID"].ToString());
            lblPateintMessage.Text = "Patient Information Updated";
            lblPateintMessage.CssClass = "success";
        }
        catch (Exception ex)
        {
            lblPateintMessage.Text = "Error Updating Pateint";
            lblPateintMessage.CssClass = "error";
        }
        tabcontrol.Value = "0";
    }

    protected void btnAddAllergies_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "1";
        if (txtAllergies.Text.Trim() != string.Empty)
        {
            lstAllergies.Items.Add(txtAllergies.Text);
            txtAllergies.Text = "";
            txtAllergies.Focus();
        }
    }
    protected void btnRemoveAllergies_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "1";
        string patientId = Request.QueryString["patientId"];
        Allergies a = new Allergies();

        if (lstAllergies.SelectedValue != "")
        {
            string selecteditem = lstAllergies.SelectedItem.Text;
            lstAllergies.Items.Remove(selecteditem);
            a.DeletePatientAllergies(patientId, selecteditem);
        }
        txtAllergies.Focus();
    }
    protected void btnSaveAlergies_Click(object sender, EventArgs e)
    {
        try
        {
            string patientId = Request.QueryString["patientId"];
            Allergies a = new Allergies();
            foreach (ListItem allergy in lstAllergies.Items)
            {
                if (allergy.ToString() != String.Empty)
                {
                    a.AddPatientAllergies(patientId, allergy.ToString());
                }
            }
            lblAllergyMessage.Text = "Allergy Information Updated";
            lblAllergyMessage.CssClass = "success";
        }
        catch (Exception ex)
        {
            lblAllergyMessage.Text = "Error Updating Pateint";
            lblAllergyMessage.CssClass = "error";
        }
        tabcontrol.Value = "1";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        IntervetionDetail.Attributes.Add("class", "divdisplay");
        btnDeleteIntervetion.Visible = true;
        tabcontrol.Value = "2";
        
        string interventionsID = GridView1.SelectedDataKey.Value.ToString();
        hdnInterventionID.Value = interventionsID;
        txtIntervention.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text.ToString();
        string physician = GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text.ToString();
        txtMinutes.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text.ToString();
        
        DataSet ds = new DataSet();
        Physician ph = new Physician();
        ds = ph.GetPhysicians("");
        ddlPhysician.DataSource = ds.Tables[0];
        ddlPhysician.DataTextField = "fullname";
        ddlPhysician.DataValueField = "PhysicianID";
        ddlPhysician.DataBind();

        int physiciancount = 0;
        foreach (ListItem list in ddlPhysician.Items)
        {
            if (list.Text == physician)
            {
                ddlPhysician.SelectedIndex = physiciancount;
            }
            physiciancount++;
        }

        InterventionsDB I = new InterventionsDB();
        DataSet ds_i = new DataSet();
        ds_i = I.GetInterventionsInterventionsByInterventionsID(interventionsID);
        //lstIntervention.DataSource = ds_i.Tables[0];
        //lstIntervention.DataTextField = "Intervention";
        //lstIntervention.DataValueField = "Intervention";
        //lstIntervention.DataBind();
    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        IntervetionDetail.Attributes.Add("class", "divdisplaynone");
        tabcontrol.Value = "2";
    }
    protected void btnRemoveInervention_Click(object sender, EventArgs e)
    {
        //string interventionsID = hdnInterventionID.Value;
        //if (lstIntervention.SelectedValue != "")
        //{
        //    string selecteditem = lstIntervention.SelectedItem.Text;
        //    lstIntervention.Items.Remove(selecteditem);
        //    if (interventionsID != String.Empty)
        //    {
        //        InterventionsDB I = new InterventionsDB();
        //        I.DeleteInterventionsIntervention(interventionsID, selecteditem);
        //    }
        //}
        //txtIntervention.Focus();
    }
    protected void btnAddInervention_Click(object sender, EventArgs e)
    {
        //if (txtIntervention.Text.Trim() != string.Empty)
        //{
        //    lstIntervention.Items.Add(txtIntervention.Text);
        //    txtIntervention.Text = "";
        //    txtIntervention.Focus();
        //}
    }
    protected void btnSaveIntervetion_Click(object sender, EventArgs e)
    {
        try
        {
            string patientId = Request.QueryString["patientId"];
            string minutes = txtMinutes.Text;
            string physician = ddlPhysician.SelectedItem.Text;
            string interventionID = hdnInterventionID.Value;
            string interventionType = txtIntervention.Text;
            InterventionsDB I = new InterventionsDB();
            DataSet ds = I.CheckInterventionTypesByName(interventionType);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string InterventionsID = I.AddUpdateInterventions(interventionID, interventionType, patientId, physician, minutes, Session["FullName"].ToString());
                GridView1.DataBind();
                IntervetionDetail.Attributes.Add("class", "divdisplaynone");
                tabcontrol.Value = "2";
            }
            else
            {
                lblInterventionMsg.CssClass = "error";
                lblInterventionMsg.Text = "Invalid Intervention Type, please select Intervention from the list.";
            }
            //foreach (ListItem interventionType in lstIntervention.Items)
            //{
            //    if (interventionType.ToString() != String.Empty)
            //    {
            //        if (interventionID == String.Empty)
            //            interventionID = InterventionsID;
            //        I.AddInterventionsIntervention(interventionID, interventionType.ToString());
            //    }
            //}
        }
        catch (Exception ex)
        {
            lblInterventionMsg.CssClass = "error";
            lblInterventionMsg.Text = "Error";
        }
    }
    protected void btnNewIntervetion_Click(object sender, EventArgs e)
    {
        IntervetionDetail.Attributes.Add("class", "divdisplay");
        btnDeleteIntervetion.Visible = false;
        hdnInterventionID.Value = null;
        tabcontrol.Value = "2";
        txtMinutes.Text = "";
        //lstIntervention.Items.Clear();
        txtIntervention.Text = "";
        lblInterventionMsg.Text = "";

        DataSet ds = new DataSet();
        Physician ph = new Physician();
        ds = ph.GetPhysicians("");
        ddlPhysician.DataSource = ds.Tables[0];
        ddlPhysician.DataTextField = "fullname";
        ddlPhysician.DataValueField = "PhysicianID";
        ddlPhysician.DataBind();
    }
    protected void btnDeleteIntervetion_Click(object sender, EventArgs e)
    {
        string interventionsID = hdnInterventionID.Value;
        InterventionsDB I = new InterventionsDB();
        I.DeleteInterventions(interventionsID);
        GridView1.DataBind();
        IntervetionDetail.Attributes.Add("class", "divdisplaynone");
    }
    protected void GridView1_PageIndexChanged(object sender, EventArgs e)
    {
        tabcontrol.Value = "2";
    }
}