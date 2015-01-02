<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="WarfarinTrackingDetails.aspx.cs" Inherits="WarfarinTrackingDetails" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    $(document).ready(function () {
        var hv = $('#<%=tabcontrol.ClientID%>').val();
        if (hv == 0) {
            $("#tabs").tabs({ active: 0 });
        }
        if (hv == 1) {
            $("#tabs").tabs({ active: 1 });
        }
        if (hv == 2) {
            $("#tabs").tabs({ active: 2 });
        }
        if (hv == 3) {
            $("#tabs").tabs({ active: 3 });
        }
        if (hv == 4) {
            $("#tabs").tabs({ active: 4 });
        }
        if (hv == 5) {
            $("#tabs").tabs({ active: 5 });
        }
        $("#<%=txtAllergies.ClientID%>").autocomplete({
            delay: 0,
            source: "api/getAllergies.ashx"
        });
        $("#<%=txtAllergies.ClientID%>").Watermark("Type Allergy Name");
        $("#<%=txtINRGoal.ClientID%>").Watermark("Type INR Goal");
        $("#<%=txtDateStarted.ClientID%>").datepicker();
        $("#<%=txtCounselingCompletedDate.ClientID%>").datepicker();

        $("#<%=txtINRGoal.ClientID%>").autocomplete({
            delay: 0,
            source: "api/GetWarfarinInrGoal.ashx"
        });

        $("#<%=lab.ClientID%>").draggable();

        //$("#<%=txtDob.ClientID %>").mask("99/99/9999");
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

    function printPartOfPage(elementId) {
        var printContent = document.getElementById(elementId);
        var windowUrl = 'about:blank';
        var uniqueName = new Date();
        var windowName = 'Print' + uniqueName.getTime();
        var printWindow = window.open(windowUrl, windowName, 'left=50000,top=50000,width=0,height=0');
        //var printWindow = window.open(windowUrl, windowName, 'width=500,height=500');

        printWindow.document.write('<style>ul {list-style-type:none;}</style>' + printContent.innerHTML);
        printWindow.document.close();
        printWindow.focus();
        printWindow.print();
        printWindow.close();
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="InterierTitle">Warfarin Tracking</div>
    <div class="patientInfo">
        <div id="tabs">
            <ul>
		        <li><a href="#tabs-1">Patient Information</a></li>
		        <li><a href="#tabs-2">Warfarin History</a></li>
                <li><a href="#tabs-3">Indication/PMH/INR Goal</a></li>
                <li><a href="#tabs-4">Labs/Dosing</a></li>
                <li><a href="#tabs-5">Dose-INR</a></li>
                <li><a href="#tabs-6">Summary</a></li>
	        </ul>
            <div id="tabs-1">
                <div class="wizard">
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
                        <li><asp:Label ID="lblAge" runat="server" Text="Age" Width="216px"></asp:Label>
                            <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ErrorMessage="*" ControlToValidate="txtAge" ForeColor="Red"></asp:RequiredFieldValidator>
                        </li>
                        <li>
                            <asp:Label ID="lblDob" runat="server" Text="Date of Birth" Width="216px"></asp:Label>
                            <asp:TextBox ID="txtDob" runat="server"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="* Date is invalid mm/dd/yyyy" ControlToValidate="txtDob" Operator="DataTypeCheck" Type="Date" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtDob" ForeColor="Red"></asp:RequiredFieldValidator>
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
                            <asp:Label ID="lblAlergies" runat="server" Text="Allergies" Width="216px"></asp:Label>
                            <asp:TextBox ID="txtAllergies" class="txtAllergies" runat="server"></asp:TextBox>
                            <asp:Button ID="btnAddAllergies" runat="server" Text="Select" 
                                CausesValidation="False" CssClass="btn" onclick="btnAddAllergies_Click"/>
                            <div style=" height:5px;"></div>
                            <asp:Label ID="Label2" runat="server" Text="Selected Allergies" Width="216px"></asp:Label>
                            <asp:ListBox ID="lstAllergies" runat="server" Rows="5" Width="128px"></asp:ListBox>
                            <asp:Button ID="btnRemoveAllergies" runat="server" Text="Remove"  CssClass="btn"
                                CausesValidation="False" onclick="btnRemoveAllergies_Click" />
                        </li>
                        <li>
                            <asp:Label ID="lblAllergyMessage" runat="server"></asp:Label>  
                        </li>
                        <li></li>
                        <li>
                            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn" 
                                onclick="btnSave_Click" />
                            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn" 
                                onclick="btnBack_Click" />
                        </li>
                        <li>
                            <asp:Label ID="lblPateintMessage" runat="server"></asp:Label>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="tabs-2">
                <div class="wizard">
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
                        <li></li>
                        <li>
                            <asp:Label ID="lblPreviousHistoryWarfarin" runat="server" Text="Previous History on Warfarin"></asp:Label>
                        </li>
                        <li>
                            <asp:TextBox ID="txtPreviousHistoryWarfarin" runat="server" Rows="5" 
                                TextMode="MultiLine" Width="333px"></asp:TextBox>
                        </li>
                        <li></li>
                        <li>
                            <asp:Label ID="lblCounselingCompletedDateTitle" runat="server" Text="Counseling Completed (date and sign)" CssClass="wizardlable_warfarin"></asp:Label>
                        </li>
                        <li>
                            <asp:Label ID="lblCounselingCompletedDate" runat="server" Text="Date" Width="100px"></asp:Label>
                            <asp:TextBox ID="txtCounselingCompletedDate" runat="server"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="rfvCounselingCompletedDate" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCounselingCompletedDate"></asp:RequiredFieldValidator>--%>
                            <%--<asp:DropDownList ID="ddlUsers" runat="server" AppendDataBoundItems="True">
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
                        <li>
                            <asp:Button ID="btnSaveWarfarinTracking" runat="server" Text="Save" 
                                CssClass="btn" onclick="btnSaveWarfarinTracking_Click" />
                        </li>
                        <li>
                            <asp:Label ID="lblWarfarinTrackingMessage" runat="server"></asp:Label>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="tabs-3">
                <div class="wizard">
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
                        <li>
                            <asp:Button ID="btnSaveWarfarinIndication" runat="server" Text="Save" 
                                CssClass="btn" onclick="btnSaveWarfarinIndication_Click"/>
                            <asp:Label ID="lblBtnWarfarinIndicationValidation" runat="server" Text="* Please enter and save fields in Warfarin History tab." ForeColor="Red"></asp:Label>
                        </li>
                        <li>
                            <asp:Label ID="lblWarfarinIndicationMessage" runat="server"></asp:Label>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="tabs-4">
                <div class="wizard">
                    <ul>
                        <li>
                            <asp:GridView ID="GridView1" runat="server" CssClass="data-table" 
                                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                                DataSourceID="SqlDataSource1" GridLines="None" DataKeyNames="ID" 
                                onselectedindexchanged="GridView1_SelectedIndexChanged" 
                                onpageindexchanging="GridView1_PageIndexChanging" onsorting="GridView1_Sorting">
                                <EmptyDataTemplate>Please add Lab by clicking button below.</EmptyDataTemplate>
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" SelectText="Update" />
                                    <asp:BoundField DataField="LabDate" HeaderText="Date" SortExpression="LabDate"  DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="hemoglobin" HeaderText="Hemoglobin" 
                                        SortExpression="hemoglobin" />
                                    <asp:BoundField DataField="hematocrit" HeaderText="Hematocrit" 
                                        SortExpression="hematocrit" />
                                    <asp:BoundField DataField="platelets" HeaderText="Platelets" 
                                        SortExpression="platelets" />
                                    <asp:BoundField DataField="inr" HeaderText="INR" SortExpression="inr" />
                                    <asp:BoundField DataField="WarfarinDose" HeaderText="Warfarin Dose (mg)" 
                                        SortExpression="WarfarinDose" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="GetWarfarinLabsByWarfarinTrackingID" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hdnWarfarinTrackingID" 
                                        Name="WarfarinTrackingID" PropertyName="Value" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </li>
                        <li>
                            <asp:Button ID="btnAddLab" runat="server" Text="Add" CssClass="btn" 
                                onclick="btnAddLab_Click"/>
                            <asp:Label ID="lblVAlidateAddLab" runat="server" Text="* Please enter and save fields in Warfarin History tab." ForeColor="Red"></asp:Label>
                        </li>
                        <li>
                            <asp:Label ID="lblLabMessage" runat="server"></asp:Label> 
                        </li>
                    </ul>
                </div>
            </div>
            <div id="tabs-5">
                <div class="wizard">
                    <ul>
                        <li>
                            <asp:GridView ID="GridView3" runat="server" CssClass="data-table" 
                                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                                DataSourceID="SqlDataSource3" GridLines="None" DataKeyNames="ID" 
                                onpageindexchanging="GridView3_PageIndexChanging" onsorting="GridView3_Sorting">
                                <EmptyDataTemplate>No Labs recorded.</EmptyDataTemplate>
                                <Columns>
                                    <asp:BoundField DataField="LabDate" HeaderText="Date" SortExpression="LabDate"  DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="inr" HeaderText="INR" SortExpression="inr" />
                                    <asp:BoundField DataField="WarfarinDose" HeaderText="Warfarin Dose (mg)" 
                                        SortExpression="WarfarinDose" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="GetWarfarinLabsByWarfarinTrackingID" 
                                SelectCommandType="StoredProcedure" 
                                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hdnWarfarinTrackingID" 
                                        Name="WarfarinTrackingID" PropertyName="Value" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </li>
                    </ul>
                </div>
                <div> 
                    <asp:Chart ID="Chart1" runat="server" Width="600px">
                        <Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
            </div>
            <div id="tabs-6">
                <div class="wizard">
                    <asp:Label ID="lblPNMessage" runat="server" Visible="False"></asp:Label>
                    <fieldset class="section">
                        <legend>Patient Information</legend>
                        <ul>
                            <li>
                                <asp:Label ID="lblProgressNote" runat="server" Text="Patient Identifier Number" 
                                    Width="216px"></asp:Label>
                                <asp:Label ID="lblPNPateintIdentifierNumber" runat="server"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="Label5" runat="server" Text="Patient Name" Width="216px"></asp:Label>
                                <asp:Label ID="lblPNName" runat="server"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="Label7" runat="server" Text="Age" Width="216px"></asp:Label>
                                <asp:Label ID="lblPNAge" runat="server"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="Label8" runat="server" Text="Weight (lbs)" Width="216px"></asp:Label>
                                <asp:Label ID="lblPNWeight" runat="server"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="Label9" runat="server" Text="Height (in)" Width="216px"></asp:Label>
                                <asp:Label ID="lblPNHeight" runat="server"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="Label10" runat="server" Text="Gender" Width="216px"></asp:Label>
                                <asp:Label ID="lblPNGender" runat="server"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="Label11" runat="server" Text="Room" Width="216px"></asp:Label>
                                <asp:Label ID="lblPNRoom" runat="server"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="Label12" runat="server" Text="Allergies" Width="216px"></asp:Label>
                                <asp:Label ID="lblPNAlergies" runat="server"></asp:Label>
                            </li>
                        </ul>
                    </fieldset>
                    <fieldset class="section">
                        <legend>Warfarin History</legend>
                        <ul>
                            <li>
                                <asp:Label ID="lblPNDateStartedTitle" runat="server" Text="Date Started" 
                                    Visible="False" Width="216px"></asp:Label>
                                <asp:Label ID="lblPNPrevAdmDateTitle" runat="server" 
                                    Text="Previous Admission Date" Visible="False" Width="216px"></asp:Label>
                                <asp:Label ID="lblPNDateStarted" runat="server"></asp:Label>
                            </li>
                            <li></li>
                            <li>
                                <asp:Label ID="lblPNPrevHistWarfTitle" runat="server" Text="Previous History on Warfarin"></asp:Label>
                            </li>
                            <li>
                                <asp:TextBox ID="txtPNPrevHistWarf" runat="server" Rows="5" 
                                    TextMode="MultiLine" Width="333px" ReadOnly="True"></asp:TextBox>
                            </li>
                            <li></li>
                            <li>
                                <asp:Label ID="lblPNCounselingCompletedTitle" runat="server" Text="Counseling Completed" Width="216px"></asp:Label>
                                <asp:Label ID="lblPNCounselingCompletedDate" runat="server"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="lblPNCounselingCompletedByTitle" runat="server" Text="Counseling Completed By" Width="216px"></asp:Label>
                                <asp:Label ID="lblPNCounselingCompletedBy" runat="server"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="lblPNWarfHistStaticText" runat="server" Text="Baseline INR and CBC should be obtained prior to initiation of warfarin therapy" Font-Bold="True"></asp:Label>
                            </li>
                        </ul>
                    </fieldset>
                    <fieldset class="section">
                        <legend>Indication/PMH/INR Goal</legend>
                            <ul>
                            <li>
                                <asp:Label ID="lblPNWarfarinIndicationTitle" runat="server" Text="Warfarin Indication"></asp:Label>
                            </li>
                            <li>
                                <asp:TextBox ID="txtPNWarfarinIndication" runat="server" Rows="5" TextMode="MultiLine" Width="333px" ReadOnly="True"></asp:TextBox>
                            </li>
                            <li></li>
                            <li>
                                <asp:Label ID="lblPNINRGoalTitle" runat="server" Text="INR Goal"></asp:Label>
                            </li>
                            <li>
                                <asp:ListBox ID="lstPNINRGoal" runat="server" Rows="5" Width="333px"></asp:ListBox>
                            </li>
                            <li></li>
                            <li>
                                <asp:Label ID="lblPNAnticoagulationTitle" runat="server" Text="Anticoagulation"></asp:Label>
                            </li>
                            <li>
                                <asp:TextBox ID="txtPNAnticoagulation" Width="333px" runat="server" TextMode="MultiLine" ReadOnly="True" Rows="5"></asp:TextBox> 
                            </li>
                            <li>
                                <asp:Label ID="lblPNPastMedicalHistory" runat="server" Text="Past Medical History/Conditions"></asp:Label>
                            </li>
                            <li>
                                <asp:TextBox ID="txtPNPastMedicalHistory" runat="server" Rows="5" TextMode="MultiLine" Width="333px" ReadOnly="True"></asp:TextBox>
                            </li>
                            <li>
                                <asp:Label ID="lblPNCurrentMedications" runat="server" Text="Current Medications"></asp:Label>
                            </li>
                            <li>
                                <asp:TextBox ID="txtPNCurrentMedications" runat="server" Rows="5" TextMode="MultiLine" Width="333px" ReadOnly="True"></asp:TextBox>
                            </li>
                            <li>
                                <asp:Label ID="lblPNMedicationsInteractWarfarin" runat="server" Text="Do any of these medications interact with warfarin?"></asp:Label>
                            </li>
                            <li>
                                <asp:TextBox ID="txtPNMedicationsInteractWarfarin" runat="server" Rows="5" TextMode="MultiLine" Width="333px" ReadOnly="True"></asp:TextBox>
                            </li>
                            <li>
                                <asp:Label ID="lblPNDrugsEffects" runat="server" Text="What effect will these drugs have on warfarin?"></asp:Label>
                            </li>
                            <li>
                                <asp:TextBox ID="txtPNDrugsEffects" runat="server" Rows="5" TextMode="MultiLine" Width="333px" ReadOnly="True"></asp:TextBox>
                            </li>
                        </ul>
                    </fieldset>
                    <fieldset class="section">
                        <legend>Labs</legend>
                        <ul>
                            <li>
                                <asp:GridView ID="GridView2" runat="server" CssClass="data-table" 
                                    AutoGenerateColumns="False" DataSourceID="SqlDataSource2" GridLines="None">
                                    <EmptyDataTemplate>No recent Labs for this patient and by this user recorded.</EmptyDataTemplate>
                                    <Columns>
                                        <asp:BoundField DataField="LabDate" HeaderText="Lab Date" 
                                            SortExpression="LabDate" DataFormatString="{0:d}"/>
                                        <asp:BoundField DataField="hemoglobin" HeaderText="Hemoglobin" 
                                            SortExpression="hemoglobin" />
                                        <asp:BoundField DataField="hematocrit" HeaderText="Hematocrit" 
                                            SortExpression="hematocrit" />
                                        <asp:BoundField DataField="platelets" HeaderText="Platelets" 
                                            SortExpression="platelets" />
                                        <asp:BoundField DataField="inr" HeaderText="inr" SortExpression="inr" />
                                        <asp:BoundField DataField="WarfarinDose" HeaderText="Warfarin Dose" 
                                            SortExpression="WarfarinDose" />
                                        <asp:BoundField DataField="EnteredBy" HeaderText="Entered By" 
                                            SortExpression="EnteredBy" />
                                    </Columns>
                                </asp:GridView> 
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="GetRecentWarfarinLabsByWarfarinTrackingID" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="hdnWarfarinTrackingID" 
                                            Name="WarfarinTrackingID" PropertyName="Value" Type="Int32" />
                                        <asp:SessionParameter Name="EnteredBy" SessionField="FullName" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </li>
                        </ul>
                    </fieldset>
                    <input id="btnPrint" type="button" value="Print" class="btn" onclick="printPartOfPage('tabs-6');"/>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hdnWarfarinTrackingID" runat="server" />
    <asp:HiddenField ID="hdnWarfarinIndicationID" runat="server" />
    <asp:HiddenField ID="tabcontrol" Value="0" runat="server" />
    <asp:HiddenField ID="hdnLabID" runat="server" />
    <div id="lab" class="lab" runat="server">
        <div class="popupHeading">
            <div style="float:left;">Today's Lab/Dosing</div>
            <div id="closeLab" style="float:right;padding-left:10px; padding-right:10px;">
                <asp:Button ID="btnLabPopUpClose" runat="server" class="btnClose" 
                    onclick="btnLabPopUpClose_Click"/>
            </div>
        </div>
        <div style="margin-top:10px;">
	        <fieldset>
            <ul>
                <li>
		            <label>Date</label>
                    <asp:Label ID="lblLabDate" runat="server"></asp:Label>
                    <%--<asp:TextBox ID="txtLabDate" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtLabDate" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </li>
                <li>
		            <label>Hemoglobin</label>
                    <asp:TextBox ID="txtHemoglobin" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtHemoglobin" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>Hematocrit</label>
                    <asp:TextBox ID="txtHematocrit" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtHematocrit" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>Platelets</label>
                    <asp:TextBox ID="txtPlatelets" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtPlatelets" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>INR</label>
                    <asp:TextBox ID="txtINR" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="* INR have to be numeric" 
                        ControlToValidate="txtINR" Type="Double" Display="Dynamic" Operator="DataTypeCheck" ValidationGroup="l" ForeColor="Red"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtINR" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>Warfarin Dose (mg)</label>
                    <asp:TextBox ID="txtWarfarinDose" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtWarfarinDose" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
                    <asp:Button ID="btnSaveLab" runat="server" Text="Save" 
                        CssClass="btn" ValidationGroup="l" onclick="btnSaveLab_Click" />
                    <asp:Button ID="btnDeleteLab" runat="server" Text="Delete" CssClass="btn" 
                        onclick="btnDeleteLab_Click" OnClientClick="return confirm('Are you Sure?')"/>
                    <asp:Button ID="btnCloseLab" runat="server" Text="Close" CssClass="btn" 
                        onclick="btnCloseLab_Click" />
                </li>
                <li>
                    <asp:Label ID="lblPopUpLabMessage" runat="server"></asp:Label>
                </li>
            </ul>
	    </fieldset>
        </div>
    </div>
</asp:Content>

