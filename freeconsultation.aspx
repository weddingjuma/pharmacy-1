<%@ Page Title="" Language="C#" MasterPageFile="~/Unsecure.master" AutoEventWireup="true" CodeFile="freeconsultation.aspx.cs" Inherits="freeconsultation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript" src="Scripts/jquery.maskedinput-1.3.js"></script>
<script type="text/javascript">

    $(document).ready(function(){
        $("#<%=Phone.ClientID %>").mask("(999)-999-9999");
    });

    function ValidateForm() {
        if ($('#<%=LastName.ClientID%>').val() == "" || $('#<%=LastName.ClientID %>').val() == null) {
            $('#<%=lblError.ClientID%>').text('Enter Last Name');
            return false;
        }
        if ($('#<%=FirstName.ClientID%>').val() == "" || $('#<%=FirstName.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID%>').text('Enter First Name');
            return false;
        }
        if ($('#<%=Phone.ClientID%>').val() == "" || $('#<%=Phone.ClientID %>').val() == null) {
            $('#<%=lblError.ClientID%>').text('Enter Phone');
            return false;
        }
        if (!/^\(?[\d]{3}\)?[\s-]?[\d]{3}[\s-]?[\d]{4}$/.test($('#<%=Phone.ClientID %>').val()))
        {
            $('#<%=lblError.ClientID%>').text('Invalid Phone');
            return false;
        }

        if ($('#<%=Email.ClientID %>').val() == "" || $('#<%=Email.ClientID %>').val() == null) {
            $('#<%=lblError.ClientID%>').text('Enter Email');
            return false;
        }

        if (!/^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$/.test($('#<%=Email.ClientID %>').val())) {
            $('#<%=lblError.ClientID%>').text('Invalid Email');
            return false;
        }

        if  ( (!$('#<%=ClinicalPharmacyInterventions.ClientID %>').is(':checked')) &&
                (!$('#<%=AntibioticTracking.ClientID %>').is(':checked')) &&
                (!$('#<%=WarfarinTracking.ClientID %>').is(':checked')) &&
                (!$('#<%=TemperatureMonitoring.ClientID %>').is(':checked'))){
            $('#<%=lblError.ClientID%>').text('Check at list one of the products');
            return false;
        
         }

        return true;
    }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="InterierTitle">Free Consultation</div>
<div style="min-height:400px">
<fieldset>
    <ul>
        <li>
            <p>Leave your contact information and we will call you to discuss your needs</p>        
        </li>
        <li>
            <label>Last Name:</label><asp:TextBox ID="LastName" runat="server"></asp:TextBox>
        </li>
        <li>
            <label>First Name:</label><asp:TextBox ID="FirstName" runat="server"></asp:TextBox>
        </li>
        <li>
            <label>Phone:</label><asp:TextBox ID="Phone" runat="server"></asp:TextBox>
        </li>
        <li>
            <label>Email:</label><asp:TextBox ID="Email" runat="server"></asp:TextBox>
        </li>
        
        <li>
            <div style="width:120px; float:left ; padding-right:2px;">Which Product are you Inquiring about?  Check all that apply</div>
            <div style="float:left" >
            <asp:CheckBox ID="ClinicalPharmacyInterventions" runat="server" Text=""  />Clinical Pharmacy Interventions<br />
            <asp:CheckBox ID="AntibioticTracking" runat="server" Text=""  />Antibiotic Tracking<br />
            <asp:CheckBox ID="WarfarinTracking" runat="server" Text=""  />Warfarin Tracking<br />
            <asp:CheckBox ID="TemperatureMonitoring" runat="server" Text=""  />Temperature/Task Monitoring<br />
            </div>
            <div style="clear:both ;"></div>
        </li>
        <li>
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
        </li>
        <li><label></label>
            <asp:Button ID="Button1" runat="server" Text="Send" CssClass="btn"  OnClientClick="return ValidateForm();"
                onclick="Button1_Click" /></li>
    </ul>
</fieldset>

</div>
<div style="clear:both" ></div>
<div class="orangebox">
    <img src="images/makeyourpharmacy.png" />
 </div>
</asp:Content>

