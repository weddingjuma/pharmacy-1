using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class WizardPatient : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }

        if (!Page.IsPostBack)
        {
            CreateBindAntibioticsPrescribedTable();
            BindDropDowns();
        }

        int wizardStepsCountTotal = Wizard1.WizardSteps.Count;
        Session["Interventions"] = Convert.ToBoolean(Session["Interventions"]);
        if (Convert.ToBoolean(Session["Interventions"]) == false)
        {
            wizardStepsCountTotal--;
        }
        Session["Antibiotic"] = Convert.ToBoolean(Session["AntibioticTracking"]);
        if (Convert.ToBoolean(Session["Antibiotic"]) == false)
        {
            wizardStepsCountTotal--;
        }
        Session["Warfarin"] = Convert.ToBoolean(Session["WarfarinTracking"]);
        if (Convert.ToBoolean(Session["Warfarin"]) == false)
        {
            wizardStepsCountTotal--;
        }
        //Session["Admin"] = true;
        int wizardSteps = 0;

        //First Step
        wizardSteps++;
        Wizard1.WizardSteps[0].Title = "Step " + wizardSteps;
        lblWizardPage1.Text = "Step " + wizardSteps + " of " + wizardStepsCountTotal;

        //Second Step
        if (Convert.ToBoolean(Session["Interventions"]))
        {
            //Load all controls for the step
            wizardSteps++;
            Wizard1.WizardSteps[wizardSteps - 1].Title = "Step " + wizardSteps;
            lblWizardPage2.Text = "Step " + wizardSteps + " of " + wizardStepsCountTotal;
        }
        else
        {
            //Wizard1.WizardSteps.Remove(Wizard1.WizardSteps[wizardSteps - 1]);
        }

        //Third Step
        if (Convert.ToBoolean(Session["Antibiotic"]))
        {
            //Load all controls for the step
            wizardSteps++;
            Wizard1.WizardSteps[wizardSteps - 1].Title = "Step " + wizardSteps;
            lblWizardPage3.Text = "Step " + wizardSteps + " of " + wizardStepsCountTotal;
        }
        else
        {
            //Wizard1.WizardSteps.Remove(Wizard1.WizardSteps[wizardSteps - 1]);
        }

        //Fourth Step
        if (Convert.ToBoolean(Session["Warfarin"]))
        {
            //Load all controls for the step
            wizardSteps++;
            Wizard1.WizardSteps[wizardSteps - 1].Title = "Step " + wizardSteps;
            lblWizardPage4.Text = "Step " + wizardSteps + " of " + wizardStepsCountTotal;
            lblCompletedBy.Text = Session["FullName"].ToString();
        }
        else
        {
            //Wizard1.WizardSteps.Remove(Wizard1.WizardSteps[wizardSteps - 1]);
        }
    }

    private void BindDropDowns()
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

        //if (Session["UserRole"].ToString() != "3")
        //{
        //    Users u = new Users();
        //    DataSet siteusers_ds = u.GetSitesUsers(Session["Site"].ToString());
        //    ddlUsers.DataSource = siteusers_ds.Tables[0];
        //    ddlUsers.DataTextField = "FullName";
        //    ddlUsers.DataValueField = "UserID";
        //    ddlUsers.DataBind();
        //}

        //if (Session["UserRole"].ToString() == "3")
        //{
        //    ddlSites.Visible = true;
        //    SiteDB s = new SiteDB();
        //    DataSet site_ds = s.GetSites();
        //    ddlSites.DataSource = site_ds.Tables[0];
        //    ddlSites.DataTextField = "SiteName";
        //    ddlSites.DataValueField = "ID";
        //    ddlSites.DataBind();
        //}
    }

    private void CreateBindAntibioticsPrescribedTable()
    {
        DataTable tblAntibioticsPrescribed = new DataTable();
        DataColumn id = new DataColumn("id", typeof(System.Int32));
        id.AutoIncrement = true;
        id.AutoIncrementSeed = 1;
        id.ReadOnly = true;
        tblAntibioticsPrescribed.Columns.Add(id);

        tblAntibioticsPrescribed.Columns.Add("antibiotic_name", Type.GetType("System.String"));
        tblAntibioticsPrescribed.Columns.Add("dose", Type.GetType("System.String"));
        tblAntibioticsPrescribed.Columns.Add("frequency", Type.GetType("System.String"));
        tblAntibioticsPrescribed.Columns.Add("start_date", Type.GetType("System.DateTime"));
        tblAntibioticsPrescribed.Columns.Add("end_date", Type.GetType("System.DateTime"));
        Session["myDataTable"] = tblAntibioticsPrescribed;

        GridView1.DataSource = tblAntibioticsPrescribed;
        GridView1.DataBind();
    }
    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (Convert.ToBoolean(Session["WarfarinTracking"]))
        {
            
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
    protected void btnAddInervention_Click(object sender, EventArgs e)
    {
        //if (txtIntervention.Text.Trim() != string.Empty)
        //{
        //    lstIntervention.Items.Add(txtIntervention.Text);
        //    txtIntervention.Text = "";
        //    txtIntervention.Focus();
        //}
    }
    protected void btnRemoveInervention_Click(object sender, EventArgs e)
    {
        //if (lstIntervention.SelectedValue != "")
        //{
        //    string selecteditem = lstIntervention.SelectedItem.Text;
        //    lstIntervention.Items.Remove(selecteditem);
        //}
        //txtIntervention.Focus();
    }
    protected void btnSelectINRGoal_Click(object sender, EventArgs e)
    {
        if (txtINRGoal.Text.Trim() != string.Empty)
        {
            lstSelectedINRGoals.Items.Add(txtINRGoal.Text);
            txtINRGoal.Text = "";
            txtINRGoal.Focus();
        }
    }
    protected void btnRemoveSelectedINRGoals_Click(object sender, EventArgs e)
    {
        if (lstSelectedINRGoals.SelectedValue != "")
        {
            string selecteditem = lstSelectedINRGoals.SelectedItem.Text;
            lstSelectedINRGoals.Items.Remove(selecteditem);
        }
        txtINRGoal.Focus();
    }
    protected void Wizard1_ActiveStepChanged(object sender, EventArgs e)
    {
        bool intervetions = Convert.ToBoolean(Session["Interventions"]);
        bool antibiotic = Convert.ToBoolean(Session["AntibioticTracking"]);
        bool warfarin = Convert.ToBoolean(Session["WarfarinTracking"]);

        if (Wizard1.ActiveStep.ID == "wsPatientInfo")
        {
            if (intervetions == false && antibiotic == false && warfarin == false)
            {
                Wizard1.WizardSteps[0].StepType = WizardStepType.Finish;
            }

            if (intervetions == true && antibiotic == false && warfarin == false)
            {
                Wizard1.WizardSteps[1].StepType = WizardStepType.Finish;
            }

            if (intervetions == true && antibiotic == true && warfarin == false)
            {
                Wizard1.WizardSteps[2].StepType = WizardStepType.Finish;
            }
        }

        if (Wizard1.ActiveStep.ID == "wsInterventions")
        {
            DataSet ds = new DataSet();
            Physician ph = new Physician();
            ds = ph.GetPhysicians("");
            ddlPhysician.DataSource = ds.Tables[0];
            ddlPhysician.DataTextField = "fullname";
            ddlPhysician.DataValueField = "PhysicianID";
            ddlPhysician.DataBind();

            if (intervetions == false)
            {
                Wizard1.ActiveStepIndex = 2;
            }
        }
        
        if (Wizard1.ActiveStep.ID == "wsAntibiotic")
        {
            if (antibiotic == false)
            {
                Wizard1.ActiveStepIndex = 3;
            }

            if (warfarin == false)
            {
                Wizard1.WizardSteps[2].StepType = WizardStepType.Finish;
            }
        }
    }
    protected void btnAddAntibioticIndication_Click(object sender, EventArgs e)
    {
        if (txtAntibioticIndication.Text.Trim() != string.Empty)
        {
            lstAntibioticIndication.Items.Add(txtAntibioticIndication.Text);
            txtAntibioticIndication.Text = "";
            txtAntibioticIndication.Focus();
        }
    }
    protected void btnRemoveAntibioticIndication_Click(object sender, EventArgs e)
    {
        if ( lstAntibioticIndication.SelectedValue != "")
        {
            string selecteditem = lstAntibioticIndication.SelectedItem.Text;
            lstAntibioticIndication.Items.Remove(selecteditem);
        }
        txtAntibioticIndication.Focus();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        DataTable tblAntibioticsPrescribed = (DataTable)Session["myDataTable"];
        DataRow drRow = tblAntibioticsPrescribed.NewRow();

        drRow["antibiotic_name"] = txtAntibiotic.Text;
        drRow["dose"] = ddlDose.SelectedItem.Text;
        drRow["frequency"] = ddlFrequency.SelectedItem.Text;
        drRow["start_date"] = Convert.ToDateTime(txtStartDate.Text);
        if (txtEndDate.Text != String.Empty)
        {
            drRow["end_date"] = Convert.ToDateTime(txtEndDate.Text);
        }
        tblAntibioticsPrescribed.Rows.Add(drRow);
        GridView1.DataSource = tblAntibioticsPrescribed;
        GridView1.DataBind();
        Session["myDataTable"] = tblAntibioticsPrescribed;
        txtAntibiotic.Text = "";
        txtStartDate.Text = "";
        txtEndDate.Text = "";
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataTable tblAntibioticsPrescribed = (DataTable)Session["myDataTable"];
        GridView1.EditIndex = e.NewEditIndex;
        GridView1.DataSource = tblAntibioticsPrescribed;
        GridView1.DataBind();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DataTable tblAntibioticsPrescribed = (DataTable)Session["myDataTable"];
        GridView1.EditIndex = -1;
        GridView1.DataSource = tblAntibioticsPrescribed;
        GridView1.DataBind();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        DataTable tblAntibioticsPrescribed = (DataTable)Session["myDataTable"];

        TextBox txtAnt = (TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("txtAnt");
        DropDownList ddlDose = (DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlDose");
        DropDownList ddlFrequency = (DropDownList)GridView1.Rows[e.RowIndex].Cells[3].FindControl("ddlFrequency");
        TextBox txtSdate = (TextBox)GridView1.Rows[e.RowIndex].Cells[4].FindControl("txtSdate");
        TextBox txtEdate = (TextBox)GridView1.Rows[e.RowIndex].Cells[5].FindControl("txtEdate");

        tblAntibioticsPrescribed.Rows[e.RowIndex]["antibiotic_name"] = txtAnt.Text;
        tblAntibioticsPrescribed.Rows[e.RowIndex]["dose"] = ddlDose.SelectedItem;
        tblAntibioticsPrescribed.Rows[e.RowIndex]["frequency"] = ddlFrequency.SelectedItem;
        tblAntibioticsPrescribed.Rows[e.RowIndex]["start_date"] = Convert.ToDateTime(txtSdate.Text);
        if (txtEdate.Text != String.Empty)
        {
            tblAntibioticsPrescribed.Rows[e.RowIndex]["end_date"] = Convert.ToDateTime(txtEdate.Text);
        }
        GridView1.EditIndex = -1;
        GridView1.DataSource = tblAntibioticsPrescribed;
        GridView1.DataBind();
        Session["myDataTable"] = tblAntibioticsPrescribed;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataTable tblAntibioticsPrescribed = (DataTable)Session["myDataTable"];
        tblAntibioticsPrescribed.Rows.RemoveAt(e.RowIndex);
        GridView1.DataSource = tblAntibioticsPrescribed;
        GridView1.DataBind();
        Session["myDataTable"] = tblAntibioticsPrescribed;
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        Doses dss = new Doses();
        DataSet dsDose = dss.GetDoses();
        frequencies fr = new frequencies();
        DataSet dsFr = fr.Getfrequencies();

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DropDownList ddlDose = (DropDownList)e.Row.FindControl("ddlDose");
            Label lblDose = (Label)e.Row.FindControl("lblDose");
            if (ddlDose != null)
            {
                ddlDose.DataSource = dsDose.Tables[0];
                ddlDose.DataTextField = "Dose";
                ddlDose.DataValueField = "DoseID";
                ddlDose.DataBind();
                ddlDose.SelectedIndex = ddlDose.Items.IndexOf(ddlDose.Items.FindByText(lblDose.Text));
            }

            DropDownList ddlFrequency = (DropDownList)e.Row.FindControl("ddlFrequency");
            Label lblFrequency = (Label)e.Row.FindControl("lblFrequency");
            if (ddlFrequency != null)
            {
                ddlFrequency.DataSource = dsFr.Tables[0];
                ddlFrequency.DataTextField = "frequency";
                ddlFrequency.DataValueField = "FrequencyID";
                ddlFrequency.DataBind();
                ddlFrequency.SelectedIndex = ddlFrequency.Items.IndexOf(ddlFrequency.Items.FindByText(lblFrequency.Text));
            }
        }
    }
    protected void ddlSCQ3_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSCQ3.SelectedItem.Text == "No")
        {
            lblSCA3.Visible = true;
            txtSCA3.Visible = true;
            txtSCA3.Focus();
        }
        else {
            lblSCA3.Visible = false;
            txtSCA3.Visible = false;
            ddlSCQ3.Focus();
        }
    }
    protected void ddlSCQ4_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSCQ4.SelectedItem.Text == "No")
        {
            lblSCA4.Visible = false;
            txtSCA4.Visible = false;
            ddlSCQ4.Focus();
        }
        else
        {
            lblSCA4.Visible = true;
            txtSCA4.Visible = true;
            txtSCA4.Focus();
        }
    }
    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Wizard1.Visible = false;

        //save Patient Info
        string patientIN = txTPatientIN.Text;
        string firstName = txtFirstName.Text;
        string lastName = txtLastName.Text;
        string age = txtAge.Text;
        string weight = txtWeight.Text;
        string height = txtHeight.Text;
        string sex = ddlSex.SelectedItem.Text;
        string room = txtRoom.Text;
        string dob = txtDob.Text;
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

        //save Interventions
        if (Convert.ToBoolean(Session["Inerventions"]) == true)
        {
            string minutes = txtMinutes.Text;
            string physician = ddlPhysician.SelectedItem.Text;
            string interventionType = txtIntervention.Text;
            InterventionsDB I = new InterventionsDB();
            string InterventionsID = I.AddUpdateInterventions("", interventionType, patientId, physician, minutes, Session["UserID"].ToString());
            //foreach (ListItem interventionType in lstIntervention.Items)
            //{
            //    if (interventionType.ToString() != String.Empty)
            //    {
            //        I.AddInterventionsIntervention(InterventionsID, interventionType.ToString());
            //    }
            //}
        }

        //save Antibiotics
        if (Convert.ToBoolean(Session["Antibiotic"]) == true)
        {
            string medHistory = txtPastMedicalHistoryConditions.Text;
            string otherInfo = txtOtherInformation.Text;
            Antibiotic Antibiotic = new Antibiotic();
            string antibioticTrackingID = Antibiotic.AddUpdateAntibioticTracking("", patientId, medHistory, otherInfo, Session["FullName"].ToString());

            string cultures = ddlSCQ1.SelectedItem.Text;
            string culturesDate = txtlblSCQ2.Text;
            string antibioticsAppropriate = ddlSCQ3.SelectedItem.Text;
            string antibioticsAppropriateComments = txtSCA3.Text;
            string oralAntibiotics = ddlSCQ4.Text;
            string oralAntibioticsComments = txtSCA4.Text;
            Antibiotic.AddUpdateAntibioticStewardshipChecklist("",antibioticTrackingID, cultures, culturesDate, antibioticsAppropriate, antibioticsAppropriateComments,
                oralAntibiotics, oralAntibioticsComments,"");
            foreach (ListItem antibioticIndication in lstAntibioticIndication.Items)
            {
                if (antibioticIndication.ToString() != String.Empty)
                {
                    Antibiotic.AddUpdateAntibioticAntibioticIndication(antibioticTrackingID, antibioticIndication.ToString());
                }
            }
            DataTable tblAntibioticsPrescribed = (DataTable)Session["myDataTable"];
            if (tblAntibioticsPrescribed.Rows.Count != 0)
            {
                foreach (DataRow dr in tblAntibioticsPrescribed.Rows)
                {
                    Antibiotic.AddUpdateAntibioticAntibioticPrescribed("",antibioticTrackingID, dr["antibiotic_name"].ToString(), dr["dose"].ToString(),
                        dr["frequency"].ToString(), dr["start_date"].ToString(), dr["end_date"].ToString());
                }
            }
        }

        //save Warfarin
        if (Convert.ToBoolean(Session["Warfarin"]) == true)
        {
            string dateStarted ="";
            string previousAdmitionDate = "";
            if (ddlNewStart.SelectedItem.Text == "Yes")
            {
                dateStarted = txtDateStarted.Text;
            }
            else if (ddlNewStart.SelectedItem.Text == "No") { 
                previousAdmitionDate = txtDateStarted.Text;
            }
            string previousHistoryWarfarin = txtPreviousHistoryWarfarin.Text;
            string counselingCompletedDate = txtCounselingCompletedDate.Text;
            //string user = ddlUsers.SelectedItem.Text;
            string user = Session["FullName"].ToString(); 
            Warfarin w = new Warfarin();
            string warfarinTrackingID = w.AddUpdateWarfarinTracking(patientId, "", dateStarted, previousAdmitionDate,
                previousHistoryWarfarin, counselingCompletedDate, user);
            
            string warfarinIndication = txtWarfarinIndication.Text;
            string listAnticoagulation = txtListAnticoagulation.Text;
            string warfarinPastMedicalHistory = txtWarfarinPastMedicalHistory.Text;
            string currentMedications = txtCurrentMedications.Text;
            string medicationsInteractWarfarin = txtMedicationsInteractWarfarin.Text;
            string drugsEffect = txtDrugsEffect.Text;
            string warfarinIndicationID = w.AddUpdateWarfarinIndication("",warfarinTrackingID, warfarinIndication, listAnticoagulation, warfarinPastMedicalHistory,
                currentMedications, medicationsInteractWarfarin, drugsEffect);
            foreach (ListItem selectedINRGoals in lstSelectedINRGoals.Items)
            {
                if (selectedINRGoals.ToString() != String.Empty)
                {
                    w.AddUpdateWarfarinWarfarinInrGoal(warfarinIndicationID, selectedINRGoals.ToString());
                }
            }
        }

        lblWizardFinishMessage.Text = "You successfully added a new patient.";
        lblWizardFinishMessage.CssClass = "success";
    }
    protected void ddlNewStart_SelectedIndexChanged(object sender, EventArgs e)
    {
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
    protected void ddlAnticoagulation_SelectedIndexChanged(object sender, EventArgs e)
    {
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
    protected void ddlSites_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (ddlSites.SelectedItem.Text != "Select")
        //{
        //    Users u = new Users();
        //    DataSet siteusers_ds = u.GetSitesUsers(ddlSites.SelectedItem.Value);
        //    ddlUsers.DataSource = siteusers_ds.Tables[0];
        //    ddlUsers.DataTextField = "FullName";
        //    ddlUsers.DataValueField = "UserID";
        //    ddlUsers.DataBind();
        //}
        //else {
        //    ddlUsers.Items.Clear();
        //    ddlUsers.Items.Add("Select");
        //}
    }
}