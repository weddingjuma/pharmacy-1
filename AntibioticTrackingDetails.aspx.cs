using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;


public partial class AntibioticTrackingDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string patientId = Request.QueryString["patientId"];
        if (patientId == null)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }

        if (!Page.IsPostBack)
        {
            antibiotics_prescribed.Attributes.Add("class", "divdisplaynone");
            lab.Attributes.Add("class", "divdisplaynone");
            cost_savings.Attributes.Add("class", "divdisplaynone");
            UpdateRecomendedAccepted.Attributes.Add("class", "divdisplaynone");

            //Load Pateint Information
            LoadPatientInfo(patientId);

            //Load Antibiotic Tracking
            LoadAntibioticTraking(patientId);

            //Load Stewardship Checklist 
            LoadAntibioticStewardship();

            //Load Progress Note
            LoadProgressNote(patientId);

            //LoadCostSavings
            LoadCostSavings();
        }

        if (hdnAntibioticTrackingID.Value == String.Empty)
        {
            btnSaveStewardshipChecklist.Enabled = false;
            btnAddLab.Enabled = false;
            lblBtnValidation.Visible = true;
            lblVAlidateAddLab.Visible = true;
            btnAddCostSavings.Enabled = false;
            lblCostSavings.Visible = true;
        }
        else
        {
            btnSaveStewardshipChecklist.Enabled = true;
            btnAddLab.Enabled = true;
            lblBtnValidation.Visible = false;
            lblVAlidateAddLab.Visible = false;
            btnAddCostSavings.Enabled = true;
            lblCostSavings.Visible = false;
        }
    }

    private void LoadCostSavings()
    {
        if (hdnAntibioticTrackingID.Value != String.Empty)
        {
            Antibiotic a = new Antibiotic();
            DataSet ds_AntibioticsCostSavings = a.GetAntibioticsCostSavingsTrackingByAntibioticTrackingID(Convert.ToInt32(hdnAntibioticTrackingID.Value));
            GridView5.DataSource = ds_AntibioticsCostSavings.Tables[0];
            GridView5.DataBind();
        }
    }

    private void LoadProgressNote(string patientId)
    {
        try
        {
            lblPNMessage.Visible = false;

            //Patient information
            Patients p = new Patients();
            DataSet patient_ds = p.GetPatient(patientId);
            lblPNPateintIdentifierNumber.Text = patient_ds.Tables[0].Rows[0]["PatientIN"].ToString();
            lblPNName.Text = patient_ds.Tables[0].Rows[0]["FirstName"].ToString() + " " + patient_ds.Tables[0].Rows[0]["LastName"].ToString();
            lblPNAge.Text = patient_ds.Tables[0].Rows[0]["Age"].ToString();
            lblPNHeight.Text = patient_ds.Tables[0].Rows[0]["Height"].ToString();
            lblPNWeight.Text = patient_ds.Tables[0].Rows[0]["Weight"].ToString();
            lblPNRoom.Text = patient_ds.Tables[0].Rows[0]["Room"].ToString();
            lblPNGender.Text = patient_ds.Tables[0].Rows[0]["Sex"].ToString();
            string pnPateintAllergy = "";
            foreach (DataRow dr in patient_ds.Tables[1].Rows)
            {
                pnPateintAllergy = pnPateintAllergy + dr["Allergy"].ToString() + ",";
            }
            pnPateintAllergy = pnPateintAllergy.TrimEnd(',');
            lblPNAlergies.Text = pnPateintAllergy;

            //Antibiotic Tracking
            Antibiotic A = new Antibiotic();
            if (hdnAntibioticTrackingID.Value != String.Empty)
            {
                DataSet antibioticPrescribed_ds = A.GetAntibioticAntibioticPrescribedByAntibioticTrackingID(hdnAntibioticTrackingID.Value);
                GridView3.DataSource = antibioticPrescribed_ds.Tables[0];
                GridView3.DataBind();
            }
            else
            {
                GridView3.DataSource = null;
                GridView3.DataBind();
            }
            DataSet antibioticTracking_ds = A.GetAntibioticTrackingByPatientID(patientId);
            if (antibioticTracking_ds.Tables[0].Rows.Count != 0)
            {
                hdnAntibioticTrackingID.Value = antibioticTracking_ds.Tables[0].Rows[0]["AntibioticTrackingID"].ToString();
                lblPNOtherInfo.Text = antibioticTracking_ds.Tables[0].Rows[0]["OtherInfo"].ToString();
                lblPNPastMedicalHistory.Text = antibioticTracking_ds.Tables[0].Rows[0]["MedHistory"].ToString();

                string PNAntibioticIndication = "";
                DataSet antibioticIndication_ds = A.GetAntibioticAntibioticIndicationByAntibioticTrackingID(hdnAntibioticTrackingID.Value);
                foreach (DataRow dr_ai in antibioticIndication_ds.Tables[0].Rows)
                {
                    PNAntibioticIndication = PNAntibioticIndication + dr_ai["AntibioticIndicationName"].ToString() + ",";
                }
                PNAntibioticIndication = PNAntibioticIndication.TrimEnd(',');
                lblPNAntibioticIndication.Text = PNAntibioticIndication;
            }

            //Stewardship Checklist
            if (hdnAntibioticTrackingID.Value != String.Empty)
            {
                DataSet dsSC = A.GetAntibioticStewardshipChecklist(hdnAntibioticTrackingID.Value);
                if (dsSC.Tables[0].Rows.Count != 0)
                {
                    hdnAntibioticStewardshipChecklistID.Value = dsSC.Tables[0].Rows[0]["ID"].ToString();
                    lblPNSCLQ1.Text = dsSC.Tables[0].Rows[0]["Cultures"].ToString();
                    lblPNSCLQ2.Text = String.Format("{0:MM/dd/yyyy}", dsSC.Tables[0].Rows[0]["CulturesDate"]);
                    lblPNSCLQ3.Text = dsSC.Tables[0].Rows[0]["AntibioticsAppropriate"].ToString();
                    lblPNSCLQ4.Text = dsSC.Tables[0].Rows[0]["AntibioticsAppropriateComments"].ToString();
                    lblPNSCLQ5.Text = dsSC.Tables[0].Rows[0]["OralAntibiotics"].ToString();
                    lblPNSCLQ6.Text = dsSC.Tables[0].Rows[0]["OralAntibioticsComments"].ToString();
                    lblPNSCLQ7.Text = dsSC.Tables[0].Rows[0]["OtherInformation"].ToString();
                }
            }
        }
        catch (Exception ex)
        {
            lblPNMessage.Visible = true;
            lblPNMessage.Text = "Error loading progress note";
            lblPNMessage.CssClass = "error";
        }
    }

    private void LoadAntibioticStewardship()
    {
        if (hdnAntibioticTrackingID.Value != String.Empty)
        {
            Antibiotic A = new Antibiotic();
            DataSet dsSC = A.GetAntibioticStewardshipChecklist(hdnAntibioticTrackingID.Value);
            if (dsSC.Tables[0].Rows.Count != 0)
            {
                hdnAntibioticStewardshipChecklistID.Value = dsSC.Tables[0].Rows[0]["ID"].ToString();
                txtlblSCQ2.Text = String.Format("{0:MM/dd/yyyy}", dsSC.Tables[0].Rows[0]["CulturesDate"]);
                txtSCA3.Text = dsSC.Tables[0].Rows[0]["AntibioticsAppropriateComments"].ToString();
                txtSCA4.Text = dsSC.Tables[0].Rows[0]["OralAntibioticsComments"].ToString();
                txtSclOtherInfo.Text = dsSC.Tables[0].Rows[0]["OtherInformation"].ToString();

                int SCQ1Cnt = 0;
                string SCQ1 = dsSC.Tables[0].Rows[0]["Cultures"].ToString();
                foreach (ListItem SCQ1item in ddlSCQ1.Items)
                {
                    if (SCQ1item.Text == SCQ1)
                    {
                        ddlSCQ1.SelectedIndex = SCQ1Cnt;
                    }
                    SCQ1Cnt++;
                }

                int SCQ3Cnt = 0;
                string SCQ3 = dsSC.Tables[0].Rows[0]["AntibioticsAppropriate"].ToString();
                foreach (ListItem SCQ3item in ddlSCQ3.Items)
                {
                    if (SCQ3item.Text == SCQ3)
                    {
                        ddlSCQ3.SelectedIndex = SCQ3Cnt;
                    }
                    SCQ3Cnt++;
                }

                int SCQ4Cnt = 0;
                string SCQ4 = dsSC.Tables[0].Rows[0]["OralAntibiotics"].ToString();
                foreach (ListItem SCQ4item in ddlSCQ4.Items)
                {
                    if (SCQ4item.Text == SCQ4)
                    {
                        ddlSCQ4.SelectedIndex = SCQ4Cnt;
                    }
                    SCQ4Cnt++;
                }
            }
        }
    }
    private void LoadAntibioticTraking(string patientId)
    {
        CreateBindAntibioticsPrescribedTable();
        BindDropDowns();
        Antibiotic A = new Antibiotic();
        DataSet antibioticTracking_ds = A.GetAntibioticTrackingByPatientID(patientId);
        if (antibioticTracking_ds.Tables[0].Rows.Count != 0)
        {
            hdnAntibioticTrackingID.Value = antibioticTracking_ds.Tables[0].Rows[0]["AntibioticTrackingID"].ToString();
            txtOtherInformation.Text = antibioticTracking_ds.Tables[0].Rows[0]["OtherInfo"].ToString();
            txtPastMedicalHistoryConditions.Text = antibioticTracking_ds.Tables[0].Rows[0]["MedHistory"].ToString();

            BindGridToRealTable();

            DataSet antibioticIndication_ds = A.GetAntibioticAntibioticIndicationByAntibioticTrackingID(hdnAntibioticTrackingID.Value);
            foreach (DataRow dr_ai in antibioticIndication_ds.Tables[0].Rows)
            {
                lstAntibioticIndication.Items.Add(dr_ai["AntibioticIndicationName"].ToString());
            }
        }
        else
        {
            DataTable tblAntibioticsPrescribed = (DataTable)Session["myDataTable"];
            GridView1.DataSource = tblAntibioticsPrescribed;
            GridView1.DataBind();
        }
    }
    private void BindGridToRealTable()
    {
        Antibiotic A = new Antibiotic();
        DataSet antibioticPrescribed_ds = A.GetAntibioticAntibioticPrescribedByAntibioticTrackingID(hdnAntibioticTrackingID.Value);
        //DataTable tblAntibioticsPrescribed = (DataTable)Session["myDataTable"];
        //foreach (DataRow dr in antibioticPrescribed_ds.Tables[0].Rows)
        //{
        //    DataRow drRow = tblAntibioticsPrescribed.NewRow();
        //    //drRow["ID"] = dr["ID"];
        //    drRow["AntibioticTrackingID"] = Convert.ToInt32(hdnAntibioticTrackingID.Value);
        //    drRow["AntibioticPrescribedName"] = dr["AntibioticPrescribedName"].ToString();
        //    drRow["Dose"] = dr["Dose"].ToString();
        //    drRow["Frequency"] = dr["Frequency"].ToString();
        //    drRow["StartDate"] = dr["StartDate"];
        //    drRow["EndDate"] = dr["EndDate"];
        //    tblAntibioticsPrescribed.Rows.Add(drRow);
        //}
        //tblAntibioticsPrescribed = antibioticPrescribed_ds.Tables[0].Copy();
        //GridView1.DataSource = tblAntibioticsPrescribed;
        GridView1.DataSource = antibioticPrescribed_ds.Tables[0];
        GridView1.DataBind();
        //Session["myDataTable"] = tblAntibioticsPrescribed;
    }
    private void LoadPatientInfo(string patientId)
    {
        Patients p = new Patients();
        DataSet patient_ds = p.GetPatient(patientId);
        LoadPatientInformation(patientId, patient_ds);
        foreach (DataRow dr in patient_ds.Tables[1].Rows)
        {
            lstAllergies.Items.Add(dr["Allergy"].ToString());
        }
    }
    private void BindDropDowns()
    {
        try
        {
            Doses dss = new Doses();
            DataSet dsDose = dss.GetDoses();
            ddlDose.DataSource = dsDose.Tables[0];
            ddlDose.DataTextField = "Dose";
            ddlDose.DataValueField = "DoseID";
            ddlDose.DataBind();

            frequencies fr = new frequencies();
            DataSet dsFr = fr.Getfrequencies();
            ddlFrequency.DataSource = dsFr.Tables[0];
            ddlFrequency.DataTextField = "frequency";
            ddlFrequency.DataValueField = "FrequencyID";
            ddlFrequency.DataBind();

            //Cost Savings popup
            Antibiotic a = new Antibiotic();
            DataSet ds_drug = a.GetAntibioticsCostSavingsTrackingLookupByType("Drug");
            DataSet ds_frequency = a.GetAntibioticsCostSavingsTrackingLookupByType("Frequency");
            DataSet ds_daysTherapy = a.GetAntibioticsCostSavingsDaysTherapy(Session["Site"].ToString());

            ddlAntibioticDrug1.DataSource = ds_drug.Tables[0];
            ddlAntibioticDrug1.DataValueField = "id";
            ddlAntibioticDrug1.DataTextField = "Description";
            ddlAntibioticDrug1.DataBind();

            ddlAntibioticDrug2.DataSource = ds_drug.Tables[0];
            ddlAntibioticDrug2.DataValueField = "id";
            ddlAntibioticDrug2.DataTextField = "Description";
            ddlAntibioticDrug2.DataBind();

            ddlFrequency1.DataSource = ds_frequency.Tables[0];
            ddlFrequency1.DataValueField = "id";
            ddlFrequency1.DataTextField = "Description";
            ddlFrequency1.DataBind();

            ddlFrequency2.DataSource = ds_frequency.Tables[0];
            ddlFrequency2.DataValueField = "id";
            ddlFrequency2.DataTextField = "Description";
            ddlFrequency2.DataBind();

            if ((Session["UserRole"].ToString() == "2") || (Session["UserRole"].ToString() == "3"))
            {
                lblDaysTherapyLabel.Visible = true;
                lblDaysTherapy.Visible = true;
                lblDaysTherapy.Text = ds_daysTherapy.Tables[0].Rows[0]["Description"].ToString();
            }
            else 
            {
                lblDaysTherapy.Visible = false;
                lblDaysTherapyLabel.Visible = false;
            }

            Physician p = new Physician();
            DataSet ds_physicians = p.GetPhysiciansBySiteID(Session["Site"].ToString());
            ddlPhysician1.DataSource = ds_physicians.Tables[0];
            ddlPhysician1.DataValueField = "PhysicianID";
            ddlPhysician1.DataTextField = "fullname";
            ddlPhysician1.DataBind();
            ddlPhysician2.DataSource = ds_physicians.Tables[0];
            ddlPhysician2.DataValueField = "PhysicianID";
            ddlPhysician2.DataTextField = "fullname";
            ddlPhysician2.DataBind();
        }
        catch (Exception ex)
        {
            lblPateintMessage.CssClass = "Error";
            lblPateintMessage.Text = "Error loading Cost Savings dropdowns";
        }
    }
    private void CreateBindAntibioticsPrescribedTable()
    {
        DataTable tblAntibioticsPrescribed = new DataTable();
        DataColumn id = new DataColumn("ID", typeof(System.Int32));
        id.AutoIncrement = true;
        id.AutoIncrementSeed = 1;
        id.ReadOnly = true;
        tblAntibioticsPrescribed.Columns.Add(id);
        //tblAntibioticsPrescribed.Columns.Add("ID", Type.GetType("System.Int32"));
        tblAntibioticsPrescribed.Columns.Add("AntibioticTrackingID", Type.GetType("System.Int32"));
        tblAntibioticsPrescribed.Columns.Add("AntibioticPrescribedName", Type.GetType("System.String"));
        tblAntibioticsPrescribed.Columns.Add("Dose", Type.GetType("System.String"));
        tblAntibioticsPrescribed.Columns.Add("Frequency", Type.GetType("System.String"));
        tblAntibioticsPrescribed.Columns.Add("StartDate", Type.GetType("System.DateTime"));
        tblAntibioticsPrescribed.Columns.Add("EndDate", Type.GetType("System.DateTime"));
        Session["myDataTable"] = tblAntibioticsPrescribed;
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
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            string PatientId = Request.QueryString["patientId"];
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
            string patientId = p.AddUpdatePatient(PatientId, patientIN, Session["Site"].ToString(), firstName,
                lastName, age, dob, height, weight, sex, room, Session["UserID"].ToString());
            Allergies a = new Allergies();
            foreach (ListItem allergy in lstAllergies.Items)
            {
                if (allergy.ToString() != String.Empty)
                {
                    a.AddPatientAllergies(PatientId, allergy.ToString());
                }
            }
            lblPateintMessage.Text = "Patient Information Updated";
            lblPateintMessage.CssClass = "success";
            lblPateintMessage.Focus();
            tabcontrol.Value = "0";

            LoadProgressNote(PatientId);
        }
        catch (Exception ex)
        {
            lblPateintMessage.Text = "Error Updating Pateint";
            lblPateintMessage.CssClass = "error";
            tabcontrol.Value = "0";
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AntibioticTracking.aspx");
    }
    protected void btnAddAllergies_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "0";
        if (txtAllergies.Text.Trim() != string.Empty)
        {
            lstAllergies.Items.Add(txtAllergies.Text);
            txtAllergies.Text = "";
            txtAllergies.Focus();
        }
    }
    protected void btnRemoveAllergies_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "0";
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
    protected void btnAddAntibioticIndication_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "1";
        if (txtAntibioticIndication.Text.Trim() != string.Empty)
        {
            lstAntibioticIndication.Items.Add(txtAntibioticIndication.Text);
            txtAntibioticIndication.Text = "";
            txtAntibioticIndication.Focus();
        }
    }
    protected void btnRemoveAntibioticIndication_Click(object sender, EventArgs e)
    {
        try
        {
            tabcontrol.Value = "1";
            Antibiotic A = new Antibiotic();
            if (lstAntibioticIndication.SelectedValue != "")
            {
                string selecteditem = lstAntibioticIndication.SelectedItem.Text;
                lstAntibioticIndication.Items.Remove(selecteditem);
                
                if (hdnAntibioticTrackingID.Value != String.Empty)
                    A.DeleteAntibioticAntibioticIndication(hdnAntibioticTrackingID.Value, selecteditem);
            }
        }
        catch (Exception ex)
        {
            lblAntibioticTracking.Text = "Error";
            lblAntibioticTracking.CssClass = "error";
        }
        txtAntibioticIndication.Focus();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        tabcontrol.Value = "1";

        try
        {
            if (hdnAntibioticTrackingID.Value == String.Empty)
            {
                DataTable tblAntibioticsPrescribed = (DataTable)Session["myDataTable"];
                tblAntibioticsPrescribed.Rows.RemoveAt(e.RowIndex);
                GridView1.DataSource = tblAntibioticsPrescribed;
                GridView1.DataBind();
                Session["myDataTable"] = tblAntibioticsPrescribed;
            }
            else
            {
                Antibiotic A = new Antibiotic();
                string ID = GridView1.DataKeys[e.RowIndex].Value.ToString();
                A.DeleteAntibioticAntibioticPrescribed(ID);
                DataSet antibioticPrescribed_ds = A.GetAntibioticAntibioticPrescribedByAntibioticTrackingID(hdnAntibioticTrackingID.Value);
                GridView1.DataSource = antibioticPrescribed_ds.Tables[0];
                GridView1.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblAntibioticTracking.Text = "Error";
            lblAntibioticTracking.CssClass = "error";
        }


    }
    protected void btnSaveAntibioticsPrescribed_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "1";
        antibiotics_prescribed.Attributes.Add("class", "antibiotics_prescribed");
        DataTable tblAntibioticsPrescribed = (DataTable)Session["myDataTable"];

        try
        {
            if (hdnAntibioticTrackingID.Value == String.Empty)
            {
                if (hdnAntibioticAntibioticPrescribedID.Value == "")
                {
                    DataRow drRow = tblAntibioticsPrescribed.NewRow();
                    if (hdnAntibioticTrackingID.Value != String.Empty)
                        drRow["AntibioticTrackingID"] = Convert.ToInt32(hdnAntibioticTrackingID.Value);
                    drRow["AntibioticPrescribedName"] = txtAntibiotic.Text;
                    drRow["Dose"] = ddlDose.SelectedItem.Text;
                    drRow["Frequency"] = ddlFrequency.SelectedItem.Text;
                    drRow["StartDate"] = Convert.ToDateTime(txtStartDate.Text);
                    if (txtEndDate.Text != String.Empty)
                        drRow["EndDate"] = Convert.ToDateTime(txtEndDate.Text);
                    tblAntibioticsPrescribed.Rows.Add(drRow);
                }
                else
                {
                    int rowIndex = Convert.ToInt32(hdnAntibioticAntibioticPrescribedID.Value);
                    tblAntibioticsPrescribed.Rows[rowIndex - 1]["AntibioticPrescribedName"] = txtAntibiotic.Text;
                    tblAntibioticsPrescribed.Rows[rowIndex - 1]["Dose"] = ddlDose.SelectedItem.Text;
                    tblAntibioticsPrescribed.Rows[rowIndex - 1]["Frequency"] = ddlFrequency.SelectedItem.Text;
                    tblAntibioticsPrescribed.Rows[rowIndex - 1]["StartDate"] = txtStartDate.Text;
                    if (txtEndDate.Text != String.Empty)
                    {
                        tblAntibioticsPrescribed.Rows[rowIndex - 1]["EndDate"] = txtEndDate.Text;
                    }
                    else {
                        tblAntibioticsPrescribed.Rows[rowIndex - 1]["EndDate"] = DBNull.Value;                            
                    }

                    tblAntibioticsPrescribed.AcceptChanges();
                    hdnAntibioticAntibioticPrescribedID.Value = "";
                }
                GridView1.DataSource = tblAntibioticsPrescribed;
                GridView1.DataBind();
                Session["myDataTable"] = tblAntibioticsPrescribed;
            }
            else
            {
                Antibiotic a = new Antibiotic();
                a.AddUpdateAntibioticAntibioticPrescribed(hdnAntibioticAntibioticPrescribedID.Value, hdnAntibioticTrackingID.Value, txtAntibiotic.Text, ddlDose.SelectedItem.Text,
                            ddlFrequency.SelectedItem.Text, txtStartDate.Text, txtEndDate.Text);
                DataSet antibioticPrescribed_ds = a.GetAntibioticAntibioticPrescribedByAntibioticTrackingID(hdnAntibioticTrackingID.Value);
                GridView1.DataSource = antibioticPrescribed_ds.Tables[0];
                GridView1.DataBind();
                hdnAntibioticAntibioticPrescribedID.Value = String.Empty;
            }
        }
        catch (Exception ex)
        {
            lblAntibioticTracking.Text = "Error";
            lblAntibioticTracking.CssClass = "error";
        }
        txtAntibiotic.Text = "";
        txtStartDate.Text = "";
        txtEndDate.Text = "";

        antibiotics_prescribed.Attributes.Add("class", "divdisplaynone");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        tabcontrol.Value = "1";
        antibiotics_prescribed.Attributes.Add("class", "antibiotics_prescribed");
        //DataTable tblAntibioticsPrescribed = (DataTable)Session["myDataTable"];

        string ID = GridView1.SelectedDataKey.Value.ToString();
        hdnAntibioticAntibioticPrescribedID.Value = ID;
        string dose = GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text.ToString();
        string frequency = GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text.ToString();
        txtAntibiotic.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text.ToString();
        txtStartDate.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text.ToString();
        if (GridView1.Rows[GridView1.SelectedIndex].Cells[5].Text.ToString() == "&nbsp;")
        {
            txtEndDate.Text = "";
        }
        else
        {
            txtEndDate.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[5].Text.ToString();
        }

        int dosescount = 0;
        foreach (ListItem list in ddlDose.Items)
        {
            if (list.Text == dose)
            {
                ddlDose.SelectedIndex = dosescount;
            }
            dosescount++;
        }

        int frequencycount = 0;
        foreach (ListItem list in ddlFrequency.Items)
        {
            if (list.Text == frequency)
            {
                ddlFrequency.SelectedIndex = frequencycount;
            }
            frequencycount++;
        }
    }
    protected void btnAddIntibioticInfo_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "1";
        antibiotics_prescribed.Attributes.Add("class", "antibiotics_prescribed");
    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "1";
        antibiotics_prescribed.Attributes.Add("class", "divdisplaynone");
        txtAntibiotic.Text = "";
        txtStartDate.Text = "";
        txtEndDate.Text = "";
    }
    protected void btnClosePopUpAntibioticsPrescribed_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "1";
        antibiotics_prescribed.Attributes.Add("class", "divdisplaynone");
        txtAntibiotic.Text = "";
        txtStartDate.Text = "";
        txtEndDate.Text = "";
    }
    protected void btnSaveAntibioticTracking_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "1";
        string patientId = Request.QueryString["patientId"];

        try
        {
            string medHistory = txtPastMedicalHistoryConditions.Text;
            string otherInfo = txtOtherInformation.Text;
            Antibiotic Antibiotic = new Antibiotic();
            string antibioticTrackingID = Antibiotic.AddUpdateAntibioticTracking(hdnAntibioticTrackingID.Value, patientId, medHistory, otherInfo, Session["FullName"].ToString());
            
            if (antibioticTrackingID == String.Empty)
                antibioticTrackingID = hdnAntibioticTrackingID.Value;

            foreach (ListItem antibioticIndication in lstAntibioticIndication.Items)
            {
                if (antibioticIndication.ToString() != String.Empty)
                {
                    Antibiotic.AddUpdateAntibioticAntibioticIndication(antibioticTrackingID, antibioticIndication.ToString());
                }
            }

            if (hdnAntibioticTrackingID.Value == String.Empty)
            {
                DataTable tblAntibioticsPrescribed = (DataTable)Session["myDataTable"];
                if (tblAntibioticsPrescribed.Rows.Count != 0)
                {
                    foreach (DataRow dr in tblAntibioticsPrescribed.Rows)
                    {
                        Antibiotic.AddUpdateAntibioticAntibioticPrescribed("", antibioticTrackingID, dr["AntibioticPrescribedName"].ToString(), dr["Dose"].ToString(),
                            dr["Frequency"].ToString(), dr["StartDate"].ToString(), dr["EndDate"].ToString());
                    }
                }
            }
            hdnAntibioticTrackingID.Value = antibioticTrackingID; 
            lblAntibioticTracking.Text = "Antibiotic Tracking Updated.";
            lblAntibioticTracking.CssClass = "success";

            btnSaveStewardshipChecklist.Enabled = true;
            btnAddLab.Enabled = true;
            lblBtnValidation.Visible = false;
            lblVAlidateAddLab.Visible = false;
            btnAddCostSavings.Enabled = true;
            lblCostSavings.Visible = false;

            LoadProgressNote(patientId);
            LoadCostSavings();
        }
        catch (Exception ex)
        {
            lblAntibioticTracking.Text = "Error.";
            lblAntibioticTracking.CssClass = "error";
        }

    }
    protected void btnSaveStewardshipChecklist_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "2";

        try
        {
            string cultures = ddlSCQ1.SelectedItem.Text;
            string culturesDate = txtlblSCQ2.Text;
            string otherInformation = txtSclOtherInfo.Text;
            
            string antibioticsAppropriate = ddlSCQ3.SelectedItem.Text;
            string antibioticsAppropriateComments = "";
            if (antibioticsAppropriate == "Yes")
            {
                antibioticsAppropriateComments = "";
            }
            else {
                antibioticsAppropriateComments = txtSCA3.Text;
            }

            string oralAntibiotics = ddlSCQ4.SelectedItem.Text;
            string oralAntibioticsComments = "";
            if (oralAntibiotics == "No")
            {
                oralAntibioticsComments = "";
            }
            else {
                oralAntibioticsComments = txtSCA4.Text;
            }

            Antibiotic Antibiotic = new Antibiotic();
            Antibiotic.AddUpdateAntibioticStewardshipChecklist(hdnAntibioticStewardshipChecklistID.Value, hdnAntibioticTrackingID.Value, cultures, culturesDate, antibioticsAppropriate, antibioticsAppropriateComments,
                oralAntibiotics, oralAntibioticsComments, otherInformation);
            lblMessage.Text = "Transaction updated";
            lblMessage.CssClass = "success";

            string patientId = Request.QueryString["patientId"];
            LoadProgressNote(patientId);
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error";
            lblMessage.CssClass = "error";
        }
    }
    protected void btnAddLab_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "3";
        lab.Attributes.Add("class", "lab");
        btnDeleteLab.Visible = false;

        lblLabDate.Text = DateTime.Now.ToShortDateString();
        txtWBC.Text = "";
        txtHGB.Text = "";
        txtHCT.Text = "";
        txtPLT.Text = "";
        txtNa.Text = "";
        txtCl.Text = "";
        txtK.Text = "";
        txtCO2.Text = "";
        txtBUN.Text = "";
        txtSRCR.Text = "";
        txtGlucose.Text = "";
    }
    protected void btnCloseLab_Click(object sender, EventArgs e)
    {
        closeLabPopUp();
    }

    private void closeLabPopUp()
    {
        tabcontrol.Value = "3";
        lab.Attributes.Add("class", "divdisplaynone");

        lblLabDate.Text = "";
        txtWBC.Text = "";
        txtHGB.Text = "";
        txtHCT.Text = "";
        txtPLT.Text = "";
        txtNa.Text = "";
        txtCl.Text = "";
        txtK.Text = "";
        txtCO2.Text = "";
        txtBUN.Text = "";
        txtSRCR.Text = "";
        txtGlucose.Text = "";
        hdnLabID.Value = "";
    }
    protected void btnSaveLab_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "3";

        try
        {
            string gender = ddlSex.SelectedItem.Text;
            int age = Convert.ToInt32(txtAge.Text);
            double weight = Convert.ToDouble(txtWeight.Text);
            double SRCR = Convert.ToDouble(txtSRCR.Text);
            double CRCL = CalculateCRCL(gender, age, weight, SRCR);

            Antibiotic a = new Antibiotic();
            a.AddUpdateAntibioticLab(hdnLabID.Value, hdnAntibioticTrackingID.Value, "", txtWBC.Text,
                txtHGB.Text, txtHCT.Text, txtPLT.Text, txtNa.Text, txtCl.Text, txtK.Text, txtCO2.Text,
                txtBUN.Text, txtSRCR.Text, txtGlucose.Text, CRCL, Session["FullName"].ToString());
            lab.Attributes.Add("class", "divdisplaynone");
            GridView2.DataBind();
            GridView4.DataBind();

            lblLabDate.Text = "";
            txtWBC.Text = "";
            txtHGB.Text = "";
            txtHCT.Text = "";
            txtPLT.Text = "";
            txtNa.Text = "";
            txtCl.Text = "";
            txtK.Text = "";
            txtCO2.Text = "";
            txtBUN.Text = "";
            txtSRCR.Text = "";
            txtGlucose.Text = "";
            hdnLabID.Value = "";

            string patientId = Request.QueryString["patientId"];
            LoadProgressNote(patientId);
        }
        catch (Exception ex)
        {
            lblLabMessage.Text = "Error";
            lblLabMessage.CssClass = "error";
        }
    }
    private static double CalculateCRCL(string gender, int age, double weight, double SRCR)
    {
        double CRCL = 0.0;

        if (gender == "Female")
        {
            CRCL = ((140 - age) * (weight / 2.2)) / (72 * SRCR) * .85;
        }
        else
        {
            CRCL = ((140 - age) * (weight / 2.2)) / (72 * SRCR);
        }
        return CRCL;
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        tabcontrol.Value = "3";
        lab.Attributes.Add("class", "lab");
        btnDeleteLab.Visible = true;

        hdnLabID.Value = GridView2.SelectedDataKey.Value.ToString();

        lblLabDate.Text = GridView2.Rows[GridView2.SelectedIndex].Cells[1].Text.ToString();
        txtWBC.Text = GridView2.Rows[GridView2.SelectedIndex].Cells[2].Text.ToString();
        txtHGB.Text = GridView2.Rows[GridView2.SelectedIndex].Cells[3].Text.ToString();
        txtHCT.Text = GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text.ToString();
        txtPLT.Text = GridView2.Rows[GridView2.SelectedIndex].Cells[5].Text.ToString();
        txtNa.Text = GridView2.Rows[GridView2.SelectedIndex].Cells[6].Text.ToString();
        txtCl.Text = GridView2.Rows[GridView2.SelectedIndex].Cells[7].Text.ToString();
        txtK.Text = GridView2.Rows[GridView2.SelectedIndex].Cells[8].Text.ToString();
        txtCO2.Text = GridView2.Rows[GridView2.SelectedIndex].Cells[9].Text.ToString();
        txtBUN.Text = GridView2.Rows[GridView2.SelectedIndex].Cells[10].Text.ToString();
        txtSRCR.Text = GridView2.Rows[GridView2.SelectedIndex].Cells[11].Text.ToString();
        txtGlucose.Text = GridView2.Rows[GridView2.SelectedIndex].Cells[12].Text.ToString();
    }
    protected void btnDeleteLab_Click(object sender, EventArgs e)
    {
        try
        {
            tabcontrol.Value = "3";
            Antibiotic a = new Antibiotic();
            a.DeleteAntibioticLab(hdnLabID.Value);
            lab.Attributes.Add("class", "divdisplaynone");
            GridView2.DataBind();
            GridView4.DataBind();

            lblLabDate.Text = "";
            txtWBC.Text = "";
            txtHGB.Text = "";
            txtHCT.Text = "";
            txtPLT.Text = "";
            txtNa.Text = "";
            txtCl.Text = "";
            txtK.Text = "";
            txtCO2.Text = "";
            txtBUN.Text = "";
            txtSRCR.Text = "";
            txtGlucose.Text = "";
            hdnLabID.Value = "";
        }
        catch (Exception ex)
        {
            lblLabMessage.Text = "Error";
            lblLabMessage.CssClass = "error";
        }
    }
    protected void btnLabPopUpClose_Click(object sender, EventArgs e)
    {
        closeLabPopUp();
    }
    protected void btnCostSavingsPopUpClose_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "4";
        cost_savings.Attributes.Add("class", "divdisplaynone");

        ClearCostSavingsFields();
    }

    private void ClearCostSavingsFields()
    {
        lblCostSavingsDateEntered.Text = "";
        ddlAntibioticDrug1.SelectedIndex = 0;
        ddlAntibioticDrug2.SelectedIndex = 0;
        ddlFrequency1.SelectedIndex = 0;
        ddlFrequency2.SelectedIndex = 0;
        ddlPhysician1.SelectedIndex = 0;
        ddlPhysician2.SelectedIndex = 0;
    }
    protected void btnAddCostSavings_Click(object sender, EventArgs e)
    {
        try
        {
            tabcontrol.Value = "4";
            cost_savings.Attributes.Add("class", "cost_savings");
            btnDeleteCostSavings.Visible = false;
            lblCostSavingsDateEntered.Text = DateTime.Now.ToShortDateString();
        }
        catch (Exception ex)
        {
            lblCostSavingsMessage.CssClass = "error";
            lblCostSavingsMessage.Text = "Error";
        }
    }
    protected void btnSaveCostSavings_Click(object sender, EventArgs e)
    {
        string CostSavingsID = hdnCostSavingsID.Value;
        try
        {
            tabcontrol.Value = "4";
            
            int AntibioticDrug1 = Convert.ToInt32(ddlAntibioticDrug1.SelectedItem.Value);
            int Frequency1 = Convert.ToInt32(ddlFrequency1.SelectedItem.Value);
            int Physician1 = Convert.ToInt32(ddlPhysician1.SelectedItem.Value);
            int AntibioticDrug2 = Convert.ToInt32(ddlAntibioticDrug2.SelectedItem.Value);
            int Frequency2 = Convert.ToInt32(ddlFrequency2.SelectedItem.Value);
            int Physician2 = Convert.ToInt32(ddlPhysician2.SelectedItem.Value);

            Antibiotic a = new Antibiotic();
            DataSet ds_AntibioticDrug1 = a.GetAntibioticsCostSavingsTrackingLookupById(AntibioticDrug1);
            DataSet ds_Frequency1 = a.GetAntibioticsCostSavingsTrackingLookupById(Frequency1);
            decimal antibioticDrug1Cost = Convert.ToDecimal(ds_AntibioticDrug1.Tables[0].Rows[0]["Cost"]) * Convert.ToDecimal(ds_Frequency1.Tables[0].Rows[0]["Conversion"]);

            DataSet ds_AntibioticDrug2 = a.GetAntibioticsCostSavingsTrackingLookupById(AntibioticDrug2);
            DataSet ds_Frequency2 = a.GetAntibioticsCostSavingsTrackingLookupById(Frequency2);
            decimal antibioticDrug2Cost = Convert.ToDecimal(ds_AntibioticDrug2.Tables[0].Rows[0]["Cost"]) * Convert.ToDecimal(ds_Frequency2.Tables[0].Rows[0]["Conversion"]);

            DataSet ds_daysTherapy = a.GetAntibioticsCostSavingsDaysTherapy(Session["Site"].ToString());
            int daysTherapy = Convert.ToInt32(ds_daysTherapy.Tables[0].Rows[0]["Description"]);

            decimal costSavings = (antibioticDrug1Cost - antibioticDrug2Cost) * daysTherapy;

            a.AddUpdateAntibioticsCostSavingsTracking(CostSavingsID, hdnAntibioticTrackingID.Value, lblCostSavingsDateEntered.Text,
                AntibioticDrug1, Frequency1, Physician1, AntibioticDrug2, Frequency2, Physician2, costSavings, Session["FullName"].ToString());
            cost_savings.Attributes.Add("class", "divdisplaynone");
            LoadCostSavings();
            ClearCostSavingsFields();
            hdnCostSavingsID.Value = "";
        }
        catch (Exception ex)
        {
            lblCostSavingsMessage.CssClass = "error";
            lblCostSavingsMessage.Text = "Error";
        }
    }
    protected void btnDeleteCostSavings_Click(object sender, EventArgs e)
    {
        try
        {
            tabcontrol.Value = "4";
            Antibiotic a = new Antibiotic();
            a.DeleteAntibioticsCostSavingsTrackingByID(hdnCostSavingsID.Value);
            cost_savings.Attributes.Add("class", "divdisplaynone");
            LoadCostSavings();
            ClearCostSavingsFields();
            hdnCostSavingsID.Value = "";
        }
        catch (Exception ex)
        {
            lblCostSavingsMessage.CssClass = "error";
            lblCostSavingsMessage.Text = "Error";
        }
    }
    protected void btnCloseCostSavings_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "4";
        cost_savings.Attributes.Add("class", "divdisplaynone");
        ClearCostSavingsFields();
    }
    protected void GridView5_SelectedIndexChanged(object sender, EventArgs e)
    {
        tabcontrol.Value = "4";
        cost_savings.Attributes.Add("class", "cost_savings");
        btnDeleteCostSavings.Visible = true;

        hdnCostSavingsID.Value = GridView5.SelectedDataKey.Value.ToString();
        Antibiotic a = new Antibiotic();
        DataSet ds = a.GetAntibioticsCostSavingsTrackingByID(Convert.ToInt32(hdnCostSavingsID.Value));

        lblCostSavingsDateEntered.Text = ds.Tables[0].Rows[0]["DateEntered"].ToString();
        BindOptionSelectedDdl(ds, ddlAntibioticDrug1, "AntibioticDrug1");
        BindOptionSelectedDdl(ds, ddlAntibioticDrug2, "AntibioticDrug2");
        BindOptionSelectedDdl(ds, ddlFrequency1, "AntibioticDrug1Frequency");
        BindOptionSelectedDdl(ds, ddlFrequency2, "AntibioticDrug2Frequency");
        BindOptionSelectedDdl(ds, ddlPhysician1, "AntibioticDrug1Physician");
        BindOptionSelectedDdl(ds, ddlPhysician2, "AntibioticDrug2Physician");
    }
    private void BindOptionSelectedDdl(DataSet ds, DropDownList ddl, string fieldName)
    {
        int itemsCnt = 0;
        foreach (ListItem item in ddl.Items)
        {
            if (item.Value == ds.Tables[0].Rows[0][fieldName].ToString())
            {
                ddl.SelectedIndex = itemsCnt;
            }
            itemsCnt++;
        }
    }
    protected void GridView5_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblAccepted = (Label)e.Row.Cells[5].FindControl("lblAccepted");
            Label lblRecommended = (Label)e.Row.Cells[5].FindControl("lblRecommended");
            CheckBoxList chklist = (CheckBoxList)e.Row.Cells[5].FindControl("chkStatus");
            chklist.Items.Add(new ListItem()
            {
                Text = "Accepted",
                Value = lblAccepted.Text,
                Selected = Convert.ToBoolean(lblAccepted.Text)
            });
            chklist.Items.Add(new ListItem()
            {
                Text = "Recommended",
                Value = lblRecommended.Text,
                Selected = Convert.ToBoolean(lblRecommended.Text)
            });
        }
    }
    protected void GridView5_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        tabcontrol.Value = "4";
        if (e.CommandName == "SaveActivity")
        {
            UpdateRecomendedAccepted.Attributes.Add("class", "UpdateRecomendedAccepted");
            string[] split = e.CommandArgument.ToString().Split(';');
            hdnCostSavingsID.Value = split[0];
            chkAccepted.Checked = Convert.ToBoolean(split[1]);
            chkRecommended.Checked = Convert.ToBoolean(split[2]);

        }
    }
    protected void btnUpdateRecomendedAcceptedClose_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "4";
        hdnCostSavingsID.Value = "";
        UpdateRecomendedAccepted.Attributes.Add("class", "divdisplaynone");
    }
    protected void btnSaveRecomendedAccepted_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "4";

        try
        {
            Antibiotic A = new Antibiotic();
            A.UpdateAntibioticsCostSavingsTrackingRecommendedAcceptedByID(hdnCostSavingsID.Value, chkRecommended.Checked, chkAccepted.Checked, Session["FullName"].ToString());
            LoadCostSavings();
            hdnCostSavingsID.Value = "";
            UpdateRecomendedAccepted.Attributes.Add("class", "divdisplaynone");
        }
        catch (Exception ex)
        {
            lblUpdateRecomendedAccepted.CssClass = "error";
            lblUpdateRecomendedAccepted.Text = "Error";
        }
    }
    protected void btnCloseUpdateRecomendedAccepted_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "4";
        hdnCostSavingsID.Value = "";
        UpdateRecomendedAccepted.Attributes.Add("class", "divdisplaynone");
    }
}