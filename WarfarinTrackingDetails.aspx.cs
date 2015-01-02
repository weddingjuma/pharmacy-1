using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.DataVisualization;

public partial class WarfarinTrackingDetails : System.Web.UI.Page
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
            lab.Attributes.Add("class", "divdisplaynone");

            //Load Pateint Information
            LoadPatientInfo(patientId);
            
            //Load Warfarin History
            LoadWarfarinHistory(patientId);

            //Load Warfarin Indication
            LoadWarfarinIndication();

            //Load Progress Note
            LoadProgressNote(patientId);
        }

        if (hdnWarfarinTrackingID.Value == String.Empty)
        {
            btnSaveWarfarinIndication.Enabled = false;
            lblBtnWarfarinIndicationValidation.Visible = true;
            btnAddLab.Enabled = false;
            lblVAlidateAddLab.Visible = true;
        }
        else
        {
            btnSaveWarfarinIndication.Enabled = true;
            lblBtnWarfarinIndicationValidation.Visible = false;
            btnAddLab.Enabled = true;
            lblVAlidateAddLab.Visible = false;

            //Load INR-Dose graph
            CreateInrDoseGraph();
        }
    }

    private void CreateInrDoseGraph()
    {
        Chart1.Legends.Clear();
        Chart1.Series.Clear();

        Warfarin w = new Warfarin();
        DataSet ds = w.GetWarfarinLabsByWarfarinTrackingID(Convert.ToInt32(hdnWarfarinTrackingID.Value));

        if (ds.Tables[0].Rows.Count != 0)
        {
            Chart1.Legends.Add("INR");
            Chart1.Series.Add("INR");
            Chart1.Series[0].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Line;
            Chart1.Series[0].Points.DataBindXY(ds.Tables[0].DefaultView, "LabDate", ds.Tables[0].DefaultView, "inr");

            Chart1.Series[0].IsVisibleInLegend = true;
            Chart1.Series[0].IsValueShownAsLabel = true;
            Chart1.Series[0].ToolTip = "Data point INR Value: #VALY{G}";

            Chart1.Series[0].BorderWidth = 3;
            Chart1.Series[0].Color = System.Drawing.Color.Blue;

            Chart1.Legends.Add("Dose (mg)");
            Chart1.Series.Add("Dose (mg)");
            Chart1.Series[1].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Line;
            Chart1.Series[1].Points.DataBindXY(ds.Tables[0].DefaultView, "LabDate", ds.Tables[0].DefaultView, "WarfarinDose");

            Chart1.Series[1].IsVisibleInLegend = true;
            Chart1.Series[1].IsValueShownAsLabel = true;
            Chart1.Series[1].ToolTip = "Data point Dose (mg) Value: #VALY{G}";

            Chart1.Series[1].BorderWidth = 3;
            Chart1.Series[1].Color = System.Drawing.Color.Red;
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

            //Warfarin History
            Warfarin w = new Warfarin();
            DataSet ds_wfTracking = w.GetWarfarinTrackingByPatientID(patientId);
            if (ds_wfTracking.Tables[0].Rows.Count != 0)
            {
                string dateStarted = String.Format("{0:MM/dd/yyyy}", ds_wfTracking.Tables[0].Rows[0]["DateStarted"]);
                if (dateStarted != String.Empty)
                {
                    lblPNDateStartedTitle.Visible = true;
                    lblPNDateStarted.Text = dateStarted;
                }
                else 
                {
                    lblPNDateStartedTitle.Visible = false;
                }

                string prevAdmitionDate = String.Format("{0:MM/dd/yyyy}", ds_wfTracking.Tables[0].Rows[0]["PrevAdmitionDate"]);
                if (prevAdmitionDate != String.Empty)
                {
                    lblPNPrevAdmDateTitle.Visible = true;
                    lblPNDateStarted.Text = prevAdmitionDate;
                }
                else
                {
                    lblPNPrevAdmDateTitle.Visible = false;
                }

                txtPNPrevHistWarf.Text = ds_wfTracking.Tables[0].Rows[0]["PreviousHistoryWarfarin"].ToString();
                lblPNCounselingCompletedDate.Text = String.Format("{0:MM/dd/yyyy}", ds_wfTracking.Tables[0].Rows[0]["CounselingCompletedDate"]);
                lblPNCounselingCompletedBy.Text = ds_wfTracking.Tables[0].Rows[0]["CounselingCompletedUser"].ToString();
            }

            //Indication
            if (hdnWarfarinTrackingID.Value != String.Empty)
            {
                DataSet ds_WarfarinIndication = w.GetWarfarinIndicationByWarfarinTrackingID(hdnWarfarinTrackingID.Value);
                if (ds_WarfarinIndication.Tables[0].Rows.Count != 0)
                {
                    hdnWarfarinIndicationID.Value = ds_WarfarinIndication.Tables[0].Rows[0]["ID"].ToString();
                    txtPNWarfarinIndication.Text = ds_WarfarinIndication.Tables[0].Rows[0]["WarfarinIndicationText"].ToString();
                    txtPNAnticoagulation.Text = ds_WarfarinIndication.Tables[0].Rows[0]["Anticoagulation"].ToString();
                    txtPNPastMedicalHistory.Text = ds_WarfarinIndication.Tables[0].Rows[0]["WarfarinPastMedicalHistory"].ToString();
                    txtPNCurrentMedications.Text = ds_WarfarinIndication.Tables[0].Rows[0]["CurrentMedications"].ToString();
                    txtPNMedicationsInteractWarfarin.Text = ds_WarfarinIndication.Tables[0].Rows[0]["MedicationsInteractWarfarin"].ToString();
                    txtPNDrugsEffects.Text = ds_WarfarinIndication.Tables[0].Rows[0]["DrugsEffect"].ToString();
                    
                    DataSet ds_WarfarinWarfarinInrGoal = w.GetWarfarinWarfarinInrGoalByWarfarinIndicationID
                        (ds_WarfarinIndication.Tables[0].Rows[0]["ID"].ToString());
                    lstPNINRGoal.Items.Clear();
                    foreach (DataRow dr in ds_WarfarinWarfarinInrGoal.Tables[0].Rows)
                    {
                        lstPNINRGoal.Items.Add(dr["WarfarinInrGoal"].ToString());
                    }
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

    private void LoadWarfarinIndication()
    {
        if (hdnWarfarinTrackingID.Value != String.Empty)
        {
            Warfarin w = new Warfarin();
            DataSet ds_WarfarinIndication = w.GetWarfarinIndicationByWarfarinTrackingID(hdnWarfarinTrackingID.Value);
            if (ds_WarfarinIndication.Tables[0].Rows.Count != 0)
            {
                hdnWarfarinIndicationID.Value = ds_WarfarinIndication.Tables[0].Rows[0]["ID"].ToString();
                txtWarfarinIndication.Text = ds_WarfarinIndication.Tables[0].Rows[0]["WarfarinIndicationText"].ToString();

                string anticoagulation = ds_WarfarinIndication.Tables[0].Rows[0]["Anticoagulation"].ToString();
                txtListAnticoagulation.Text = anticoagulation;
                if (anticoagulation != String.Empty)
                {
                    txtListAnticoagulation.Visible = true;
                    ddlAnticoagulation.SelectedIndex = 1;
                }
                else 
                {
                    txtListAnticoagulation.Visible = false;
                    ddlAnticoagulation.SelectedIndex = 2;
                }
                
                txtWarfarinPastMedicalHistory.Text = ds_WarfarinIndication.Tables[0].Rows[0]["WarfarinPastMedicalHistory"].ToString();
                txtCurrentMedications.Text = ds_WarfarinIndication.Tables[0].Rows[0]["CurrentMedications"].ToString();
                txtMedicationsInteractWarfarin.Text = ds_WarfarinIndication.Tables[0].Rows[0]["MedicationsInteractWarfarin"].ToString();
                txtDrugsEffect.Text = ds_WarfarinIndication.Tables[0].Rows[0]["DrugsEffect"].ToString();
                DataSet ds_WarfarinWarfarinInrGoal = w.GetWarfarinWarfarinInrGoalByWarfarinIndicationID
                    (ds_WarfarinIndication.Tables[0].Rows[0]["ID"].ToString());
                foreach (DataRow dr in ds_WarfarinWarfarinInrGoal.Tables[0].Rows)
                {
                    lstSelectedINRGoals.Items.Add(dr["WarfarinInrGoal"].ToString());
                }
            }
        }
    }

    private void LoadWarfarinHistory(string patientId)
    {
        //LoadDropDowns();

        Warfarin w = new Warfarin();
        DataSet ds_wfTracking = w.GetWarfarinTrackingByPatientID(patientId);
        if (ds_wfTracking.Tables[0].Rows.Count != 0)
        {
            hdnWarfarinTrackingID.Value = ds_wfTracking.Tables[0].Rows[0]["WarfarinTrackingID"].ToString();
            string dateStarted = String.Format("{0:MM/dd/yyyy}", ds_wfTracking.Tables[0].Rows[0]["DateStarted"]);
            if (dateStarted != String.Empty)
            {
                ddlNewStart.SelectedIndex = 1;
                txtDateStarted.Text = dateStarted;
                txtDateStarted.Visible = true;
                lblDateStarted.Visible = true;
            }
            string prevAdmitionDate = String.Format("{0:MM/dd/yyyy}", ds_wfTracking.Tables[0].Rows[0]["PrevAdmitionDate"]);
            if (prevAdmitionDate != String.Empty)
            {
                ddlNewStart.SelectedIndex = 2;
                txtDateStarted.Text = prevAdmitionDate;
                txtDateStarted.Visible = true;
                lblPreviousAdmitionDate.Visible = true;
            }
            txtPreviousHistoryWarfarin.Text = ds_wfTracking.Tables[0].Rows[0]["PreviousHistoryWarfarin"].ToString();
            txtCounselingCompletedDate.Text = String.Format("{0:MM/dd/yyyy}", ds_wfTracking.Tables[0].Rows[0]["CounselingCompletedDate"]);
            lblCompletedBy.Text = ds_wfTracking.Tables[0].Rows[0]["CounselingCompletedUser"].ToString();
            //if (Session["UserRole"].ToString() == "3")
            //{
            //    string siteName = Session["Site"].ToString();
            //    int siteNameCnt = 0;
            //    foreach (ListItem item in ddlSites.Items)
            //    {
            //        if (item.Value == siteName)
            //        {
            //            ddlSites.SelectedIndex = siteNameCnt;
            //        }
            //        siteNameCnt++;
            //    }
            //}

            //if (Session["UserRole"].ToString() == "3")
            //{
            //    LoadUsersDropDown();

            //    int userCnt = 0;
            //    string user = ds_wfTracking.Tables[0].Rows[0]["CounselingCompletedUser"].ToString();
            //    foreach (ListItem item in ddlUsers.Items)
            //    {
            //        if (item.Text == user)
            //        {
            //            ddlUsers.SelectedIndex = userCnt;
            //        }
            //        userCnt++;
            //    }
            //}
            //else 
            //{
            //    int userCnt = 0;
            //    string user = ds_wfTracking.Tables[0].Rows[0]["CounselingCompletedUser"].ToString();
            //    foreach (ListItem item in ddlUsers.Items)
            //    {
            //        if (item.Text == user)
            //        {
            //            ddlUsers.SelectedIndex = userCnt;
            //        }
            //        userCnt++;
            //    }
            //}
        }
    }

    private void LoadUsersDropDown()
    {
        DataSet siteusers_ds = new DataSet();
        Users u = new Users();
        if (Session["UserRole"].ToString() == "3")
        {
            siteusers_ds = u.GetSitesUsers("");
        }
        else 
        {
            siteusers_ds = u.GetSitesUsers(Session["Site"].ToString());
        }
        //ddlUsers.DataSource = siteusers_ds.Tables[0];
        //ddlUsers.DataTextField = "FullName";
        //ddlUsers.DataValueField = "UserID";
        //ddlUsers.DataBind();
    }

    private void LoadDropDowns()
    {
        if (Session["UserRole"].ToString() != "3")
        {
            LoadUsersDropDown();
        }
        if (Session["UserRole"].ToString() == "3")
        {
            //ddlSites.Visible = true;
            //SiteDB s = new SiteDB();
            //DataSet site_ds = s.GetSites();
            //ddlSites.DataSource = site_ds.Tables[0];
            //ddlSites.DataTextField = "SiteName";
            //ddlSites.DataValueField = "ID";
            //ddlSites.DataBind();
        }
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

            LoadProgressNote(patientId);
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
        Response.Redirect("~/WarfarinTracking.aspx");
    }
    protected void ddlNewStart_SelectedIndexChanged(object sender, EventArgs e)
    {
        tabcontrol.Value = "1";
        if (ddlNewStart.SelectedItem.Text == "Yes")
        {
            lblDateStarted.Visible = true;
            txtDateStarted.Visible = true;
            lblPreviousAdmitionDate.Visible = false;
        }
        else if (ddlNewStart.SelectedItem.Text == "No")
        {
            lblDateStarted.Visible = false;
            txtDateStarted.Visible = true;
            lblPreviousAdmitionDate.Visible = true;
        }
        else
        {
            lblDateStarted.Visible = false;
            txtDateStarted.Visible = false;
            lblPreviousAdmitionDate.Visible = false;
        }
    }
    protected void ddlSites_SelectedIndexChanged(object sender, EventArgs e)
    {
        //tabcontrol.Value = "1";
        //ddlUsers.Items.Clear();
        //ddlUsers.Items.Add("Select");

        //if (ddlSites.SelectedItem.Text != "Select")
        //{
        //    Users u = new Users();
        //    DataSet siteusers_ds = u.GetSitesUsers(ddlSites.SelectedItem.Value);
        //    ddlUsers.DataSource = siteusers_ds.Tables[0];
        //    ddlUsers.DataTextField = "FullName";
        //    ddlUsers.DataValueField = "UserID";
        //    ddlUsers.DataBind();
        //}
        //else
        //{
        //    ddlUsers.Items.Clear();
        //    ddlUsers.Items.Add("Select");
        //}
    }
    protected void btnSaveWarfarinTracking_Click(object sender, EventArgs e)
    {
        string user = "";

        try
        {
            tabcontrol.Value = "1";
            string patientId = Request.QueryString["patientId"];
            string dateStarted = "";
            string previousAdmitionDate = "";
            if (ddlNewStart.SelectedItem.Text == "Yes")
            {
                dateStarted = txtDateStarted.Text;
            }
            else if (ddlNewStart.SelectedItem.Text == "No")
            {
                previousAdmitionDate = txtDateStarted.Text;
            }
            string previousHistoryWarfarin = txtPreviousHistoryWarfarin.Text;
            string counselingCompletedDate = txtCounselingCompletedDate.Text;
            //string user = ddlUsers.SelectedItem.Text;
            if (counselingCompletedDate != String.Empty)
            {
                user = Session["FullName"].ToString();
            }
            Warfarin w = new Warfarin();
            string warfarinTrackingID = w.AddUpdateWarfarinTracking(patientId, hdnWarfarinTrackingID.Value, dateStarted, previousAdmitionDate,
                previousHistoryWarfarin, counselingCompletedDate, user);
            lblWarfarinTrackingMessage.Text = "Warfarin History Updated";
            lblWarfarinTrackingMessage.CssClass = "success";
            btnSaveWarfarinIndication.Enabled = true;
            lblBtnWarfarinIndicationValidation.Visible = false;
            btnAddLab.Enabled = true;
            lblVAlidateAddLab.Visible = false;
            LoadWarfarinHistory(patientId);
            LoadProgressNote(patientId);
        }
        catch (Exception ex)
        {
            lblWarfarinTrackingMessage.Text = "Error";
            lblWarfarinTrackingMessage.CssClass = "error";
        }
    }
    protected void btnSelectINRGoal_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "2";
        if (txtINRGoal.Text.Trim() != string.Empty)
        {
            lstSelectedINRGoals.Items.Add(txtINRGoal.Text);
            txtINRGoal.Text = "";
            txtINRGoal.Focus();
        }
    }
    protected void btnRemoveSelectedINRGoals_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "2";
        try
        {
            if (lstSelectedINRGoals.SelectedValue != "")
            {
                string selecteditem = lstSelectedINRGoals.SelectedItem.Text;
                lstSelectedINRGoals.Items.Remove(selecteditem);
                Warfarin w = new Warfarin();
                w.DeleteWarfarinWarfarinInrGoal(hdnWarfarinIndicationID.Value, selecteditem);
            }
        }
        catch (Exception ex)
        {
            lblWarfarinIndicationMessage.Text = "Error";
            lblWarfarinIndicationMessage.CssClass = "error";
        }
        txtINRGoal.Focus();
    }
    protected void ddlAnticoagulation_SelectedIndexChanged(object sender, EventArgs e)
    {
        tabcontrol.Value = "2";
        if (ddlAnticoagulation.SelectedItem.Text == "Yes")
        {
            lblListAnticoagulation.Visible = true;
            txtListAnticoagulation.Visible = true;
            txtListAnticoagulation.Focus();
        }
        else if (ddlAnticoagulation.SelectedItem.Text == "No")
        {
            lblListAnticoagulation.Visible = false;
            txtListAnticoagulation.Visible = false;
            ddlAnticoagulation.Focus();
        }
        else
        {
            lblListAnticoagulation.Visible = false;
            txtListAnticoagulation.Visible = false;
            ddlAnticoagulation.Focus();
        }
    }
    protected void btnSaveWarfarinIndication_Click(object sender, EventArgs e)
    {
        try
        {
            tabcontrol.Value = "2";
            string warfarinIndication = txtWarfarinIndication.Text;

            string listAnticoagulation = "";
            if (ddlAnticoagulation.SelectedItem.Value == "Yes")
            {
                listAnticoagulation = txtListAnticoagulation.Text;
            }
            else 
            {
                listAnticoagulation = "";
            }
            
            string warfarinPastMedicalHistory = txtWarfarinPastMedicalHistory.Text;
            string currentMedications = txtCurrentMedications.Text;
            string medicationsInteractWarfarin = txtMedicationsInteractWarfarin.Text;
            string drugsEffect = txtDrugsEffect.Text;
            Warfarin w = new Warfarin();
            string warfarinIndicationID = w.AddUpdateWarfarinIndication(hdnWarfarinIndicationID.Value,
                hdnWarfarinTrackingID.Value, warfarinIndication, listAnticoagulation, warfarinPastMedicalHistory,
                currentMedications, medicationsInteractWarfarin, drugsEffect);
            
            if (warfarinIndicationID != String.Empty)
            {
                hdnWarfarinIndicationID.Value = warfarinIndicationID;
            }

            foreach (ListItem selectedINRGoals in lstSelectedINRGoals.Items)
            {
                if (selectedINRGoals.ToString() != String.Empty)
                {
                    w.AddUpdateWarfarinWarfarinInrGoal(hdnWarfarinIndicationID.Value, selectedINRGoals.ToString());
                }
            }
            lblWarfarinIndicationMessage.Text = "Warfarin Indication Updated";
            lblWarfarinIndicationMessage.CssClass = "success";
            
            string patientId = Request.QueryString["patientId"];
            LoadProgressNote(patientId);
        }
        catch (Exception ex)
        {
            lblWarfarinIndicationMessage.Text = "Error";
            lblWarfarinIndicationMessage.CssClass = "error";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        tabcontrol.Value = "3";
        lab.Attributes.Add("class", "lab");
        btnDeleteLab.Visible = true;

        hdnLabID.Value = GridView1.SelectedDataKey.Value.ToString();

        lblLabDate.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text.ToString();
        txtHemoglobin.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text.ToString();
        txtHematocrit.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text.ToString();
        txtPlatelets.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text.ToString();
        txtINR.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[5].Text.ToString();
        txtWarfarinDose.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[6].Text.ToString();
    }
    protected void btnAddLab_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "3";
        lab.Attributes.Add("class", "lab");
        btnDeleteLab.Visible = false;

        lblLabDate.Text = DateTime.Now.ToShortDateString();
        txtHemoglobin.Text = "";
        txtHematocrit.Text = "";
        txtPlatelets.Text = "";
        txtINR.Text = "";
        txtWarfarinDose.Text = "";
    }
    protected void btnSaveLab_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "3";
        lblPopUpLabMessage.Text = "";

        try
        {
            Warfarin w = new Warfarin();
            w.AddUpdateWarfarinLab(hdnLabID.Value, hdnWarfarinTrackingID.Value,
                "", txtHemoglobin.Text, txtHematocrit.Text, txtPlatelets.Text,
                txtINR.Text, txtWarfarinDose.Text, Session["FullName"].ToString());
            lab.Attributes.Add("class", "divdisplaynone");
            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();

            lblLabDate.Text = "";
            txtHemoglobin.Text = "";
            txtHematocrit.Text = "";
            txtPlatelets.Text = "";
            txtINR.Text = "";
            txtWarfarinDose.Text = "";
            hdnLabID.Value = "";

            string patientId = Request.QueryString["patientId"];
            LoadProgressNote(patientId);
            CreateInrDoseGraph();
        }
        catch (Exception ex)
        {
            lblPopUpLabMessage.Text = "Error";
            lblPopUpLabMessage.CssClass = "error";
        }
    }
    protected void btnDeleteLab_Click(object sender, EventArgs e)
    {
        tabcontrol.Value = "3";

        try
        {
            Warfarin w = new Warfarin();
            w.DeleteAntibioticLab(hdnLabID.Value);
            lab.Attributes.Add("class", "divdisplaynone");
            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();

            lblLabDate.Text = "";
            txtHemoglobin.Text = "";
            txtHematocrit.Text = "";
            txtPlatelets.Text = "";
            txtINR.Text = "";
            txtWarfarinDose.Text = "";
            hdnLabID.Value = "";

            string patientId = Request.QueryString["patientId"];
            LoadProgressNote(patientId);
            CreateInrDoseGraph();
        }
        catch
        {
            lblPopUpLabMessage.Text = "Error";
            lblPopUpLabMessage.CssClass = "error";
        }
    }
    protected void btnCloseLab_Click(object sender, EventArgs e)
    {
        closeLabPopUp();
    }
    protected void btnLabPopUpClose_Click(object sender, EventArgs e)
    {
        closeLabPopUp();
    }
    private void closeLabPopUp()
    {
        tabcontrol.Value = "3";
        lab.Attributes.Add("class", "divdisplaynone");

        lblLabDate.Text = "";
        txtHemoglobin.Text = "";
        txtHematocrit.Text = "";
        txtPlatelets.Text = "";
        txtINR.Text = "";
        txtWarfarinDose.Text = "";
        hdnLabID.Value = "";
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        tabcontrol.Value = "3";
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        tabcontrol.Value = "3";
    }
    protected void GridView3_Sorting(object sender, GridViewSortEventArgs e)
    {
        tabcontrol.Value = "4";
    }
    protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        tabcontrol.Value = "4";
    }
}