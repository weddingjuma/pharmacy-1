using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class freeconsultation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string subject = "New request for free consultation";
        string body;
        body = "<p>First Name: " + FirstName.Text + "</p>";
        body += "<p>LastName: " + LastName.Text + "</p>";
        body += "<p>Phone: " + Phone.Text  + "</p>";
        body += "<p>Phone: " + Email.Text  + "</p>";
        body += "<p>Customer  Inquiring about :</p>";
        if (ClinicalPharmacyInterventions.Checked) body += "<p>Clinical Pharmacy Interventions</p>";
        if (AntibioticTracking.Checked) body += "<p>Antibiotic Tracking</p>";
        if (WarfarinTracking.Checked) body += "<p>Warfarin Tracking</p>";
        if (TemperatureMonitoring.Checked) body += "<p>Temperature/Task Monitoring</p>";
        Support su = new Support();
        su.sendEmail(subject, body);
        lblError.Text = "Thank you for inquiring our represantative will contact you shortly";
    }
}