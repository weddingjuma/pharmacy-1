<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="WizardPatient.aspx.cs" Inherits="WizardPatient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
	
    </style>
<script type="text/javascript">
    $(document).ready(function () {
        $("#<%=txtAllergies.ClientID%>").autocomplete({
            delay: 0,
            source: "api/getAllergies.ashx"
            //            select: function( event, ui ) {
            //                $("#<%=lstAllergies.ClientID%>").append('<option value="' + ui.item.label + '">' + ui.item.label + '</option>');
            //			}
        });
        $("#<%=txtIntervention.ClientID%>").autocomplete({
            delay: 0,
            source: "api/GetInterventionTypes.ashx"
        });
        $("#<%=txtIntervention.ClientID%>").Watermark("Type Intervention Type");
        $("#<%=txtAntibioticIndication.ClientID%>").autocomplete({
            delay: 0,
            source: "api/GetAntibiotcIndications.ashx"
        });
        $("#<%=txtAntibiotic.ClientID%>").autocomplete({
            delay: 0,
            source: "api/GetDrugs.ashx"
        });
        $("#<%=txtAntibiotic.ClientID%>").Watermark("Type Antibiotic");
        $("#<%=txtINRGoal.ClientID%>").autocomplete({
            delay: 0,
            source: "api/GetWarfarinInrGoal.ashx"
        });

		$("#btnAddIntibioticInfo").click(function () {
		    $('#antibiotics_prescribed').css('display', 'inline');
		    $("#<%=txtStartDate.ClientID%>").datepicker();
		    $("#<%=txtEndDate.ClientID%>").datepicker();
		});

		$(".datepicker").datepicker();
		
        $(".getdrugs").autocomplete({
		    delay: 0,
		    source: "api/GetDrugs.ashx"
		});

		$("#<%=txtlblSCQ2.ClientID%>").datepicker();
		$("#<%=txtDateStarted.ClientID%>").datepicker();
		$("#<%=txtCounselingCompletedDate.ClientID%>").datepicker();

		$("#btnClose").click(function () {
            var antibiotic = $("#<%=txtAntibiotic.ClientID%>"),
            startdate = $("#<%=txtStartDate.ClientID%>"),
            enddate = $("#<%=txtEndDate.ClientID%>"),
            allFields = $([]).add(antibiotic).add(startdate).add(enddate);
            allFields.val("");
		    $('#antibiotics_prescribed').css('display', 'none');
		});
		$('.btn').hover(function () {
		    $(this).css('background', 'url(images/Buttons_on.png)');
		},
        function () {
            $(this).css('background', 'url(images/Buttons_off.png)');
        });

        $('#close').click(function () {
            $('#antibiotics_prescribed').css('display', 'none');
        });

        $("#antibiotics_prescribed").draggable();

        $("#<%=txtDob.ClientID %>").mask("99/99/9999");
        //$("#<%=txtDob.ClientID%>").datepicker();
        $("#<%=txtDob.ClientID%>").blur(function () {
            dob = new Date($("#<%=txtDob.ClientID%>").val());
            if (isNaN(dob) == false) {
                var today = new Date();
                var age = Math.floor((today - dob) / (365.25 * 24 * 60 * 60 * 1000));
                $('#<%=txtAge.ClientID%>').val(age);
            }
        });
        $('#<%=feets.ClientID %>').change(function () {
            $('#<%=txtHeight.ClientID %>').val($('#<%=feets.ClientID %>').val() * 12 + parseInt($('#<%=inches.ClientID %>').val()));
        });
        $('#<%=inches.ClientID %>').change(function () {
            $('#<%=txtHeight.ClientID %>').val($('#<%=feets.ClientID %>').val() * 12 + parseInt($('#<%=inches.ClientID %>').val()));
        });
    });

    function displayelement(val,element) {
        if (val === "No")
            document.getElementById('color').style.display = 'block';
        else
            document.getElementById('color').style.display = 'none';
    }

    function validateText(oSrc, args) {
        if (args.Value == 'Type Intervention Type') {
            args.IsValid = false;
        }
        //args.IsValid = (args.Value.length >= 8);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="InterierTitle">New Patient Wizard</div>
    <div class="patientInfo">
        <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" 
        Font-Names="Verdana" Font-Size="Small" Height="100%"  
        onnextbuttonclick="Wizard1_NextButtonClick" 
        onactivestepchanged="Wizard1_ActiveStepChanged" DisplaySideBar="False" 
        Width="100%" onfinishbuttonclick="Wizard1_FinishButtonClick">
        <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" 
            Font-Size="0.9em" ForeColor="White" HorizontalAlign="Left" />
        <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
            ForeColor="#284775" />
        <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
        <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" 
            VerticalAlign="Top"/>
        <StepNavigationTemplate>
            <div style="padding:5px 0px 5px 0px; text-align:center;">
                <asp:Button ID="StepPreviousButton" runat="server" CssClass="btn"   
                    CausesValidation="False" CommandName="MovePrevious" Text="Previous" />
                <asp:Button ID="StepNextButton" runat="server" CssClass="btn"  
                    CommandName="MoveNext" Text="Next"/>
            </div>    
        </StepNavigationTemplate>
        <StartNavigationTemplate>
            <div style="padding:5px 0px 5px 0px; text-align:center;">
                <asp:Button ID="StepNextButton" runat="server" CssClass="btn"   
                    CommandName="MoveNext" Text="Next"/>
            </div>
        </StartNavigationTemplate>
        <FinishNavigationTemplate>
            <div style="padding:5px 0px 5px 0px; text-align:center;">
                <asp:Button ID="StepPreviousButton" runat="server" CssClass="btn"
                    CausesValidation="False" CommandName="MovePrevious" Text="Previous" />
                <asp:Button ID="StepFinishButton" runat="server" CssClass="btn" 
                    CausesValidation="True" CommandName="MoveComplete" Text="Finish" />
            </div>
        </FinishNavigationTemplate>
        <StepStyle BorderWidth="0px" ForeColor="#5D7B9D" VerticalAlign="Top" />
        <WizardSteps>
            <asp:WizardStep runat="server" title="Patient Information" ID="wsPatientInfo">
                <div class="wizard">
                <fieldset>
                    <div class="wizardtitle">
                        <div class="wizardtitleleft">
                            <asp:Label ID="lblTitle" runat="server" Text="Patient Information" 
                                Font-Bold="True"></asp:Label>
                        </div>
                        <div class="wizardtitleright">
                            <asp:Label ID="lblWizardPage1" runat="server" Font-Bold="True"></asp:Label>
                        </div>
                    </div>
                    <div class="detailwizard">
                        <ul>
                            <li><asp:Label ID="lblPatientIN" runat="server" Text="Patient Identifier Number" 
                                    Width="216px"></asp:Label>
                                <asp:TextBox ID="txTPatientIN" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ErrorMessage="*" ControlToValidate="txTPatientIN" ForeColor="Red"></asp:RequiredFieldValidator>
                            </li>
                            <li><asp:Label ID="lblFirstName" runat="server" Text="First Name" Width="216px"></asp:Label>
                                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ErrorMessage="*" ControlToValidate="txtFirstName" ForeColor="Red"></asp:RequiredFieldValidator>
                            </li>
                            <li><asp:Label ID="lblLastName" runat="server" Text="Last Name" Width="216px"></asp:Label>
                                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ErrorMessage="*" ControlToValidate="txtLastName" ForeColor="Red"></asp:RequiredFieldValidator>
                            </li>
                            <li>
                                <asp:Label ID="lblDob" runat="server" Text="Date of Birth" Width="216px"></asp:Label>
                                <asp:TextBox ID="txtDob" runat="server"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="* Date is invalid mm/dd/yyyy" ControlToValidate="txtDob" Operator="DataTypeCheck" Type="Date" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtDob" ForeColor="Red"></asp:RequiredFieldValidator>
                            </li>
                            <li><asp:Label ID="lblAge" runat="server" Text="Age" Width="216px"></asp:Label>
                                <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ErrorMessage="*" ControlToValidate="txtAge" ForeColor="Red"></asp:RequiredFieldValidator>
                            </li>
                            <li><asp:Label ID="lblWeight" runat="server" Text="Weight (lbs)" Width="216px"></asp:Label>
                                <asp:TextBox ID="txtWeight" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ErrorMessage="*" ControlToValidate="txtWeight" ForeColor="Red"></asp:RequiredFieldValidator>
                            </li>
                            <li>
                                <asp:Label ID="Label23" runat="server" Text="Height (feet/in)" Width="216px"></asp:Label>
                                (feet)
                                <asp:DropDownList ID="feets" runat="server">
                                <asp:ListItem Value="0" Selected="True" >0</asp:ListItem>
                                <asp:ListItem Value="1" >1</asp:ListItem>
                                <asp:ListItem Value="2" >2</asp:ListItem>
                                <asp:ListItem Value="3" >3</asp:ListItem>
                                <asp:ListItem Value="4" >4</asp:ListItem>
                                <asp:ListItem Value="5" >5</asp:ListItem>
                                <asp:ListItem Value="6" >6</asp:ListItem>
                                <asp:ListItem Value="7" >7</asp:ListItem>
                                </asp:DropDownList>
                                (in)
                                <asp:DropDownList ID="inches" runat="server">
                                <asp:ListItem Value="0" Selected="True" >0</asp:ListItem>
                                <asp:ListItem Value="1" >1</asp:ListItem>
                                <asp:ListItem Value="2" >2</asp:ListItem>
                                <asp:ListItem Value="3" >3</asp:ListItem>
                                <asp:ListItem Value="4" >4</asp:ListItem>
                                <asp:ListItem Value="5" >5</asp:ListItem>
                                <asp:ListItem Value="6" >6</asp:ListItem>
                                <asp:ListItem Value="7" >7</asp:ListItem>
                                <asp:ListItem Value="8" >8</asp:ListItem>
                                <asp:ListItem Value="9" >9</asp:ListItem>
                                <asp:ListItem Value="10" >10</asp:ListItem>
                                <asp:ListItem Value="11" >11</asp:ListItem>
                                <asp:ListItem Value="12" >12</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li><asp:Label ID="lblHeight" runat="server" Text="Height (in)" Width="216px"></asp:Label>
                                <asp:TextBox ID="txtHeight" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ErrorMessage="*" ControlToValidate="txtHeight" ForeColor="Red"></asp:RequiredFieldValidator>
                            </li>
                            <li><asp:Label ID="lblSex" runat="server" Text="Gender" Width="216px"></asp:Label>
                                <asp:DropDownList ID="ddlSex" runat="server">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li><asp:Label ID="lblRoom" runat="server" Text="Room" Width="216px"></asp:Label>
                                <asp:TextBox ID="txtRoom" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ErrorMessage="*" ControlToValidate="txtRoom" ForeColor="Red"></asp:RequiredFieldValidator>
                            </li>
                            <li>
                                <asp:Label ID="lblAllergies" runat="server" Text="Allergies" Width="216px"></asp:Label>
                                <asp:TextBox ID="txtAllergies" class="txtAllergies" runat="server"></asp:TextBox>
                                <asp:Button ID="btnAdd" runat="server" Text="Select" OnClick="btnAdd_Click" CssClass="btn"
                                     CausesValidation="False" />
                                <div style=" height:5px;"></div>
                                <asp:Label ID="Label2" runat="server" Text="Selected Allergies" Width="216px"></asp:Label>    
                                <asp:ListBox ID="lstAllergies" runat="server" Rows="5" Width="153px"></asp:ListBox>
                                <asp:Button ID="btnRemove" runat="server" Text="Remove" 
                                    OnClick="btnRemove_Click" CssClass="btn" CausesValidation="False" />
                            </li>
                        </ul>
                    </div>
                </fieldset>
                </div>
            </asp:WizardStep>
            <asp:WizardStep runat="server" title="Interventions" ID="wsInterventions">
                <div class="wizard">
                <fieldset>
                    <div class="wizardtitle">
                        <div class="wizardtitleleft">
                            <asp:Label ID="lblInterventionTiltle" runat="server" Text="Interventions" 
                                Font-Bold="True" Width="200px"></asp:Label>
                        </div>
                        <div class="wizardtitleright">
                            <asp:Label ID="lblWizardPage2" runat="server" Font-Bold="True"></asp:Label>
                        </div>
                    </div>
                    <div class="detailwizard">
                        <ul>
                            <li>
                                <asp:Label ID="lblIntervention" runat="server" Text="Intervention" Width="200px"></asp:Label>
                                <asp:TextBox ID="txtIntervention" class="txtIntervention" runat="server"></asp:TextBox>
                                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtIntervention"
                                ClientValidationFunction="validateText" ForeColor="Red"></asp:CustomValidator>
                                <%--<asp:Button ID="btnAddInervention" runat="server" Text="Select" 
                                    BackColor="#FFFBFF" BorderColor="#CCCCCC" CssClass="btn" CausesValidation="False" 
                                    OnClick="btnAddInervention_Click" />
                                <div style="height:5px;"></div>
                                <asp:Label ID="Label3" runat="server" Width="200px" Text="Selected Intervetions"></asp:Label>
                                <asp:ListBox ID="lstIntervention" runat="server" Rows="5" Width="153px"></asp:ListBox>
                                <asp:Button ID="btnRemoveInervention" runat="server" Text="Remove" CssClass="btn"
                                    CausesValidation="False" 
                                    OnClick="btnRemoveInervention_Click" />--%>
                            </li>
                            <li>
                                <asp:Label ID="lblMinutes" runat="server" Text="Minutes Spent" Width="200px"></asp:Label>
                                <asp:TextBox ID="txtMinutes" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="txtMinutes" ForeColor="Red"></asp:RequiredFieldValidator>
                            </li>
                            <li>
                                <asp:Label ID="lblPhysician" runat="server" Text="Physician" Width="200px"></asp:Label>
                                <asp:DropDownList ID="ddlPhysician" runat="server"></asp:DropDownList>
                            </li>
                        </ul>
                    </div>
                </fieldset>
                </div>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Antibiotic Tracking" ID="wsAntibiotic">
            <div class="wizard">
                <fieldset>
                    <div class="wizardtitle">
                        <div class="wizardtitleleft">
                            <asp:Label ID="lblAntibioticsTitle" runat="server" Text="Antibiotic Tracking" 
                                Font-Bold="True"></asp:Label>
                        </div>
                        <div class="wizardtitleright">
                            <asp:Label ID="lblWizardPage3" runat="server" Font-Bold="True"></asp:Label>
                        </div>
                    </div>
                </fieldset>
                <div class="detailwizard">
                    <fieldset class="section">
                        <legend>General Information</legend>
                        <ul>
                            <li>
                                <asp:Label ID="Label1" runat="server" Text="Antibiotics Prescribed"></asp:Label>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                    GridLines="None" CssClass="data-table"
                                    OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                                    OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
                                    DataKeyNames="id" OnRowDeleting="GridView1_RowDeleting" 
                                    OnRowDataBound="GridView1_RowDataBound">
                                    <EmptyDataTemplate>Please add Antibiotics Prescribed by clicking button below.</EmptyDataTemplate>
                                    <Columns>
                                        <asp:TemplateField HeaderText="Antibiotics Prescribed">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAnt" runat="server" Text='<%# Bind("antibiotic_name") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtAnt" runat="server" Text='<%# Bind("antibiotic_name") %>'  CssClass="getdrugs"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Dose">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDose" runat="server" Text='<%# Bind("dose") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="ddlDose" runat="server" AppendDataBoundItems="True"></asp:DropDownList>
                                                <asp:Label ID="lblDose" runat="server" Text='<%# Bind("dose") %>' Visible="False"></asp:Label>
                                            </EditItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Frequency">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFrq" runat="server" Text='<%# Bind("frequency") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="ddlFrequency" runat="server" AppendDataBoundItems="True"></asp:DropDownList>
                                                <asp:Label ID="lblFrequency" runat="server" Text='<%# Bind("frequency") %>' Visible="False"></asp:Label>
                                            </EditItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Start Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSdate" runat="server" Text='<%# Bind("start_date","{0:d}") %>'></asp:Label>
                                            </ItemTemplate> 
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtSdate" runat="server" Text='<%# Bind("start_date", "{0:d}") %>' CssClass="datepicker" Width="70px"></asp:TextBox>
                                            </EditItemTemplate>                             
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="End Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEdate" runat="server" Text='<%# Bind("end_date", "{0:d}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtEdate" runat="server" Text='<%# Bind("end_date", "{0:d}") %>' CssClass="datepicker" Width="70px"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                    CommandName="Delete" Text="Delete"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <div style=" height:5px;"></div>
                                <input id="btnAddIntibioticInfo" type="button" class="btn" value="Add New" />
                            </li>
                            <li></li>
                            <li>
                                <asp:Label ID="lblAntibioticIndication" runat="server" Text="Antibiotic Indication"></asp:Label>
                                <asp:TextBox ID="txtAntibioticIndication" runat="server"></asp:TextBox>
                                <asp:Button ID="btnAddAntibioticIndication" runat="server" Text="Select" 
                                     CssClass="btn" CausesValidation="False" OnClick="btnAddAntibioticIndication_Click"/>
                            </li>
                            <li><asp:ListBox ID="lstAntibioticIndication" runat="server" Rows="5" Width="326px"></asp:ListBox>
                                <asp:Button ID="btnRemoveAntibioticIndication" runat="server" Text="Remove" 
                                    CssClass="btn" CausesValidation="False" OnClick="btnRemoveAntibioticIndication_Click"/>
                            </li>
                            <li></li>
                            <li><asp:Label ID="lblPastMedicalHistoryConditions" runat="server" Text="Past Medical History/Conditions"></asp:Label><br /></li>
                            <li><asp:TextBox ID="txtPastMedicalHistoryConditions" runat="server" Rows="5" 
                                    TextMode="MultiLine" Width="326px"></asp:TextBox>
                            </li>
                            <li></li>
                            <li><asp:Label ID="lblOtherInformation" runat="server" Text="Other Information"></asp:Label></li>
                            <li><asp:TextBox ID="txtOtherInformation" runat="server" Rows="5" 
                                    TextMode="MultiLine" Width="326px"></asp:TextBox></li>
                        </ul>
                    </fieldset>
                    <fieldset class="section">
                        <legend>Stewardship Checklist</legend>
                        <ul>
                            <li>
                                <asp:Label ID="lblSCQ1" runat="server" Text="Did cultures come back from the lab or are pending?"></asp:Label> 
                                <asp:DropDownList ID="ddlSCQ1" runat="server">
                                    <asp:ListItem>Yes</asp:ListItem>
                                    <asp:ListItem>No</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li>
                                <asp:Label ID="lblSCQ2" runat="server" Text="When will cultures be available (date)?"></asp:Label> 
                                <asp:TextBox ID="txtlblSCQ2" runat="server"></asp:TextBox>
                            </li>
                            <li></li>
                            <li>
                                <asp:Label ID="lblSCQ3" runat="server" Text="Are the antibiotics appropriate?"></asp:Label> 
                                <asp:DropDownList ID="ddlSCQ3" runat="server" AutoPostBack="True" 
                                    OnSelectedIndexChanged="ddlSCQ3_SelectedIndexChanged">
                                    <asp:ListItem>Yes</asp:ListItem>
                                    <asp:ListItem>No</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li>
                                <asp:Label ID="lblSCA3" runat="server" 
                                    Text="If not, what clinical pharmacy interventions do you recommend?" 
                                    Visible="False"></asp:Label>
                                <%--<div id="divSCA3" style="height:2px;display:none;" runat="server"></div>--%>
                                <asp:TextBox ID="txtSCA3" runat="server" Rows="2" TextMode="MultiLine" 
                                    Visible="False" Width="526px"></asp:TextBox> 
                            </li>
                            <li>
                                <asp:Label ID="lblSCQ4" runat="server" Text="Can the patient take oral antibiotics?"></asp:Label> 
                                <asp:DropDownList ID="ddlSCQ4" runat="server" AutoPostBack="True" 
                                    OnSelectedIndexChanged="ddlSCQ4_SelectedIndexChanged">
                                    <asp:ListItem>Yes</asp:ListItem>
                                    <asp:ListItem>No</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li>
                                <asp:Label ID="lblSCA4" runat="server" 
                                    Text="If yes, what clinical pharmacy interventions do you recommend?"></asp:Label>
                                <%--<div id="div1" style="height:2px;display:none;" runat="server"></div>--%>
                                <asp:TextBox ID="txtSCA4" runat="server" Rows="2" TextMode="MultiLine" 
                                    Width="526px"></asp:TextBox> 
                            </li>
                        </ul>
                    </fieldset>
                </div>
            </div>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Warfarin Tracking" ID="wzWarfarinTracking">
            <div class="wizard">
                <fieldset>
                    <div class="wizardtitle">
                        <div class="wizardtitleleft">
                            <asp:Label ID="lblWarfarinTitle" runat="server" Text="Warfarin Tracking" 
                                Font-Bold="True"></asp:Label>
                        </div>
                        <div class="wizardtitleright">
                            <asp:Label ID="lblWizardPage4" runat="server" Font-Bold="True"></asp:Label>
                        </div>
                    </div>
                </fieldset>
                <div class="detailwizard">
                    <fieldset class="section">
                        <legend>Warfarin History</legend>
                        <ul>
                            <li>
                                <asp:Label ID="lblNewStart" runat="server" Text="New Start"></asp:Label>
                                <asp:DropDownList ID="ddlNewStart" runat="server" 
                                    OnSelectedIndexChanged="ddlNewStart_SelectedIndexChanged" 
                                    AutoPostBack="True">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>Yes</asp:ListItem>
                                    <asp:ListItem>No</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvNewStart" runat="server" ErrorMessage="*" 
                                    ControlToValidate="ddlNewStart" InitialValue="Select" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblDateStarted" runat="server" Text="Date Started" 
                                    Visible="False"></asp:Label>
                                <asp:Label ID="lblPreviousAdmitionDate" runat="server" 
                                    Text="Previous Admission Date" Visible="False"></asp:Label>
                                <asp:TextBox ID="txtDateStarted" runat="server" Visible="False"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDateStarted" runat="server" ErrorMessage="*" 
                                    ControlToValidate="txtDateStarted" ForeColor="Red"></asp:RequiredFieldValidator>
                            </li>
                            <li>
                                <asp:Label ID="lblPreviousHistoryWarfarin" runat="server" Text="Previous History on Warfarin"></asp:Label>
                            </li>
                            <li>
                                <asp:TextBox ID="txtPreviousHistoryWarfarin" runat="server" Rows="5" 
                                    TextMode="MultiLine" Width="333px"></asp:TextBox>
                            </li>
                            <li></li>
                            <li>
                                <asp:Label ID="lblCounselingCompletedDate" runat="server" Text="Counseling Completed (date and sign)" CssClass="wizardlable_warfarin"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="Label3" runat="server" Text="Date" Width="100px"></asp:Label>
                                <asp:TextBox ID="txtCounselingCompletedDate" runat="server"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="rfvCounselingCompletedDate" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCounselingCompletedDate"></asp:RequiredFieldValidator>
                                <asp:DropDownList ID="ddlUsers" runat="server" AppendDataBoundItems="True">
                                    <asp:ListItem>Select</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvUsers" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlUsers" InitialValue="Select"></asp:RequiredFieldValidator>
                                <asp:DropDownList ID="ddlSites" runat="server" AppendDataBoundItems="True" 
                                    AutoPostBack="True" OnSelectedIndexChanged="ddlSites_SelectedIndexChanged" 
                                    Visible="False">
                                    <asp:ListItem>Select</asp:ListItem>
                                </asp:DropDownList>--%>
                            </li>
                            <li>
                                <asp:Label ID="lblCompletedByTitle" runat="server" Text="Completed By" Width="100px"></asp:Label>
                                <asp:Label ID="lblCompletedBy" runat="server"></asp:Label>
                            </li>
                            <li></li>
                            <li>
                                <asp:Label ID="lblBaseline" runat="server" Text="Baseline INR and CBC should be obtained prior to initiation of warfarin therapy" Font-Bold="True"></asp:Label>
                            </li>
                        </ul>
                    </fieldset>
                    <fieldset class="section">
                        <legend>Warfarin Indication</legend>
                        <ul>
                            <li>
                                <asp:Label ID="lblWarfarinIndication" runat="server" Text="Warfarin Indication"></asp:Label>
                            </li>
                            <li>
                                <asp:TextBox ID="txtWarfarinIndication" runat="server" Rows="5" TextMode="MultiLine" Width="333px"></asp:TextBox>
                            </li>
                            <li></li>
                            <li>
                                <asp:Label ID="lblINRGoal" runat="server" Text="INR Goal"></asp:Label>
                                <asp:TextBox ID="txtINRGoal" runat="server"></asp:TextBox>
                                <asp:Button ID="btnSelectINRGoal" runat="server" Text="Select" CssClass="btn" 
                                    OnClick="btnSelectINRGoal_Click" CausesValidation="False"/>
                            </li>
                            <li>
                                <asp:ListBox ID="lstSelectedINRGoals" runat="server" Rows="5" Width="326px"></asp:ListBox>
                                <asp:Button ID="btnRemoveSelectedINRGoals" runat="server" Text="Remove" 
                                    CssClass="btn" OnClick="btnRemoveSelectedINRGoals_Click" 
                                    CausesValidation="False"/>
                            </li>
                            <li></li>
                            <li>
                                <asp:Label ID="lblAnticoagulation" runat="server" Text="Is the patient on any other anticoagulation?"></asp:Label>
                                <asp:DropDownList ID="ddlAnticoagulation" runat="server" AutoPostBack="True" 
                                    OnSelectedIndexChanged="ddlAnticoagulation_SelectedIndexChanged">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>Yes</asp:ListItem>
                                    <asp:ListItem>No</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li>
                                <asp:Label ID="lblListAnticoagulation" runat="server" 
                                    Text="Please list" Visible="False"></asp:Label>
                                <asp:TextBox ID="txtListAnticoagulation" runat="server" Rows="2" TextMode="MultiLine" 
                                    Visible="False" Width="526px"></asp:TextBox> 
                            </li>
                            <li>
                                <asp:Label ID="lblWarfarinPastMedicalHistory" runat="server" Text="Past Medical History/Conditions"></asp:Label>
                            </li>
                            <li>
                                <asp:TextBox ID="txtWarfarinPastMedicalHistory" runat="server" Rows="5" TextMode="MultiLine" Width="333px"></asp:TextBox>
                            </li>
                            <li>
                                <asp:Label ID="lblCurrentMedications" runat="server" Text="Current Medications"></asp:Label>
                            </li>
                            <li>
                                <asp:TextBox ID="txtCurrentMedications" runat="server" Rows="5" TextMode="MultiLine" Width="333px"></asp:TextBox>
                            </li>
                            <li>
                                <asp:Label ID="lblMedicationsInteractWarfarin" runat="server" Text="Do any of these medications interact with warfarin?"></asp:Label>
                            </li>
                            <li>
                                <asp:TextBox ID="txtMedicationsInteractWarfarin" runat="server" Rows="5" TextMode="MultiLine" Width="333px"></asp:TextBox>
                            </li>
                            <li>
                                <asp:Label ID="lblDrugsEffect" runat="server" Text="What effect will these drugs have on warfarin?"></asp:Label>
                            </li>
                            <li>
                                <asp:TextBox ID="txtDrugsEffect" runat="server" Rows="5" TextMode="MultiLine" Width="333px"></asp:TextBox>
                            </li>
                        </ul>
                    </fieldset>
                </div>
            </div>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
    <asp:Label ID="lblWizardFinishMessage" runat="server"></asp:Label>
    </div>
    <div id="antibiotics_prescribed" class="antibiotics_prescribed_wizard" title="Antibiotics Prescribed">
        <div class="popupHeading">
            <div style="float:left;">Antibiotics Prescribed</div>
            <div id="close" style="float:right;padding-left:10px; padding-right:10px;">
                <span class="ui-icon ui-icon-circle-close"></span>
            </div>
        </div>
        <div style="margin-top:10px;">
	        <fieldset>
                <ul>
                    <li>
		                <label>Antibiotic</label>
                        <asp:TextBox ID="txtAntibiotic" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" 
                            ControlToValidate="txtAntibiotic" ValidationGroup="s" ForeColor="Red"></asp:RequiredFieldValidator>
                    </li>
                    <li>
		                <label>Dose</label>
                        <asp:DropDownList ID="ddlDose" runat="server"></asp:DropDownList>
                    </li>
                    <li>
		                <label>Frequency</label>
                        <asp:DropDownList ID="ddlFrequency" runat="server"></asp:DropDownList>
                    </li>
                    <li>
                        <label>Start Date</label>
                        <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" 
                            ControlToValidate="txtStartDate" ValidationGroup="s" ForeColor="Red"></asp:RequiredFieldValidator>
                    </li>
                    <li>
                        <label>End Date</label>
                        <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator
                            ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" 
                            ControlToValidate="txtEndDate" ValidationGroup="s" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                    </li>
                    <li>
                        <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click"  
                                ValidationGroup="s" CssClass="btn" />
                        <input id="btnClose" type="button" class="btn" value="Close" />
                    </li>
                </ul>
	        </fieldset>
        </div>
    </div>
</asp:Content>

