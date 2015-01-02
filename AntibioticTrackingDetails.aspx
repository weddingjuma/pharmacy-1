<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AntibioticTrackingDetails.aspx.cs" Inherits="AntibioticTrackingDetails" %>

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

            $("#<%=txtStartDate.ClientID%>").datepicker();
            $("#<%=txtEndDate.ClientID%>").datepicker();
            $("#<%=txtlblSCQ2.ClientID%>").datepicker();

            $("#<%=txtAntibiotic.ClientID%>").autocomplete({
                delay: 0,
                source: "api/GetDrugs.ashx"
            });
            $("#<%=txtAntibiotic.ClientID%>").Watermark("Type Antibiotic");

            //            $('#close').click(function () {
            //                var antibiotic = $("#<%=txtAntibiotic.ClientID%>"),
            //            startdate = $("#<%=txtStartDate.ClientID%>"),
            //            enddate = $("#<%=txtEndDate.ClientID%>"),
            //            allFields = $([]).add(antibiotic).add(startdate).add(enddate);
            //                allFields.val("");
            //                $("#<%=antibiotics_prescribed.ClientID%>").css('display', 'none');
            //            });
            $("#<%=antibiotics_prescribed.ClientID%>").draggable();

            //            $('#closeLab').click(function () {
            //                $("#<%=lab.ClientID%>").css('display', 'none');
            //            });

            $("#<%=txtAntibioticIndication.ClientID%>").autocomplete({
                delay: 0,
                source: "api/GetAntibiotcIndications.ashx"
            });
            $("#<%=txtAntibioticIndication.ClientID%>").Watermark("Type Antibiotic Indication");

            $("#<%=ddlSCQ3.ClientID%>").change(function () {
                var strSCQ3 = "";
                strSCQ3 = $(this).val();
                if (strSCQ3 == "No") {
                    $("#<%=lblSCA3.ClientID%>").slideDown();
                    $("#<%=txtSCA3.ClientID%>").slideDown();
                } else {
                    $("#<%=txtSCA3.ClientID%>").slideUp();
                    $("#<%=lblSCA3.ClientID%>").slideUp();
                }
            });
            var strSCQ3 = $("#<%=ddlSCQ3.ClientID%>").val();
            if (strSCQ3 == "No") {
                $("#<%=lblSCA3.ClientID%>").css("display", "inline");
                $("#<%=txtSCA3.ClientID%>").css("display", "inline");
            } else {
                $("#<%=lblSCA3.ClientID%>").css("display", "none");
                $("#<%=txtSCA3.ClientID%>").css("display", "none");
            }


            $("#<%=ddlSCQ4.ClientID%>").change(function () {
                var strSCQ4 = "";
                strSCQ4 = $(this).val();
                if (strSCQ4 == "Yes") {
                    $("#<%=lblSCA4.ClientID%>").slideDown();
                    $("#<%=txtSCA4.ClientID%>").slideDown();
                } else {
                    $("#<%=txtSCA4.ClientID%>").slideUp();
                    $("#<%=lblSCA4.ClientID%>").slideUp();
                }
            });
            var strSCQ4 = $("#<%=ddlSCQ4.ClientID%>").val();
            if (strSCQ4 == "Yes") {
                $("#<%=lblSCA4.ClientID%>").css("display", "inline");
                $("#<%=txtSCA4.ClientID%>").css("display", "inline");
            } else {
                $("#<%=lblSCA4.ClientID%>").css("display", "none");
                $("#<%=txtSCA4.ClientID%>").css("display", "none");
            }

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

            $("#<%=cost_savings.ClientID%>").draggable();
            $("#<%=UpdateRecomendedAccepted.ClientID%>").draggable();
        });

        function printPartOfPage(elementId) {
            var printContent = document.getElementById(elementId);
            var windowUrl = 'about:blank';
            var uniqueName = new Date();
            var windowName = 'Print' + uniqueName.getTime();
            var printWindow = window.open(windowUrl, windowName, 'left=50000,top=50000,width=0,height=0');

            printWindow.document.write('<style>ul {list-style-type:none;}</style>' + printContent.innerHTML);
            printWindow.document.close();
            printWindow.focus();
            printWindow.print();
            printWindow.close();
        }

        function updateAccepted()
        {
            document.getElementById('<%=chkAccepted.ClientID %>').checked = false;
        }

        function updateRecommended() {
            document.getElementById('<%=chkRecommended.ClientID %>').checked = false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="InterierTitle">Antibiotic Tracking</div>
    <div class="patientInfo">
        <div id="tabs">
            <ul>
		        <li><a href="#tabs-1">Patient Information</a></li>
		        <li><a href="#tabs-2">Antibiotic Tracking</a></li>
                <li><a href="#tabs-3">Stewardship Checklist</a></li>
                <li><a href="#tabs-4">Labs</a></li>
                <li><a href="#tabs-5">Cost Savings</a></li>
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
                            <asp:Label ID="Label1" runat="server" Text="Antibiotics Prescribed"></asp:Label>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="ID" CssClass="data-table" GridLines="None" 
                                onrowdeleting="GridView1_RowDeleting" 
                                onselectedindexchanged="GridView1_SelectedIndexChanged">
                                <EmptyDataTemplate>Please add Antibiotics Prescribed by clicking button below.</EmptyDataTemplate>
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="AntibioticPrescribedName" 
                                        HeaderText="Antibiotic Prescribed" SortExpression="AntibioticPrescribedName"/>
                                    <asp:BoundField DataField="Dose" HeaderText="Dose" SortExpression="Dose" />
                                    <asp:BoundField DataField="Frequency" HeaderText="Frequency" 
                                        SortExpression="Frequency" />
                                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" 
                                        SortExpression="StartDate" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="EndDate" HeaderText="End Date" 
                                        SortExpression="EndDate" DataFormatString="{0:d}" />
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you Sure?')"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <div style=" height:5px;"></div>
                            <asp:Button ID="btnAddIntibioticInfo" runat="server" Text="Add New" 
                                CssClass="btn" onclick="btnAddIntibioticInfo_Click" />
                        </li>
                        <li></li>
                        <li>
                            <asp:Label ID="lblAntibioticIndication" runat="server" Text="Antibiotic Indication"></asp:Label><br />
                            <asp:TextBox ID="txtAntibioticIndication" runat="server" Width="320px"></asp:TextBox>
                            <asp:Button ID="btnAddAntibioticIndication" runat="server" Text="Select" CssClass="btn"
                                CausesValidation="False" OnClick="btnAddAntibioticIndication_Click"/>
                        </li>
                        <li><asp:ListBox ID="lstAntibioticIndication" runat="server" Rows="5" Width="326px"></asp:ListBox>
                            <asp:Button ID="btnRemoveAntibioticIndication" runat="server" Text="Remove" CssClass="btn" 
                                CausesValidation="False" OnClick="btnRemoveAntibioticIndication_Click"/>
                        </li>
                        <li></li>
                        <li><asp:Label ID="lblPastMedicalHistoryConditions" runat="server" Text="Past Medical History/Conditions"></asp:Label><br /></li>
                        <li><asp:TextBox ID="txtPastMedicalHistoryConditions" runat="server" Rows="5" 
                                TextMode="MultiLine" Width="326px"></asp:TextBox>
                        </li>
                        <li></li>
                        <li><asp:Label ID="lblOtherInformation" runat="server" Text="Other Information"></asp:Label></li>
                        <li><asp:TextBox ID="txtOtherInformation" runat="server" Rows="5" 
                                TextMode="MultiLine" Width="326px"></asp:TextBox>
                        </li>
                        <li>
                            <asp:Button ID="btnSaveAntibioticTracking" runat="server" Text="Save" 
                                CssClass="btn" onclick="btnSaveAntibioticTracking_Click" />
                        </li>
                        <li>
                            <asp:Label ID="lblAntibioticTracking" runat="server"></asp:Label>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="tabs-3">
                <asp:HiddenField ID="hdnAntibioticStewardshipChecklistID" runat="server" />
                <div class="wizard">
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
                            <asp:DropDownList ID="ddlSCQ3" runat="server">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                        <li>
                            <asp:Label ID="lblSCA3" runat="server"
                                Text="If not, what clinical pharmacy interventions do you recommend?"></asp:Label>
                            <asp:TextBox ID="txtSCA3" runat="server" Rows="2" TextMode="MultiLine" 
                                 Width="526px"></asp:TextBox> 
                        </li>
                        <li>
                            <asp:Label ID="lblSCQ4" runat="server" Text="Can the patient take oral antibiotics?"></asp:Label> 
                            <asp:DropDownList ID="ddlSCQ4" runat="server">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                        <li>
                            <asp:Label ID="lblSCA4" runat="server" 
                                Text="If yes, what clinical pharmacy interventions do you recommend?"></asp:Label>
                            <asp:TextBox ID="txtSCA4" runat="server" Rows="2" TextMode="MultiLine" 
                                Width="526px"></asp:TextBox> 
                        </li>
                        <li><asp:Label ID="Label3" runat="server" Text="Other Information"></asp:Label></li>
                        <li><asp:TextBox ID="txtSclOtherInfo" runat="server" Rows="5" 
                                TextMode="MultiLine" Width="326px"></asp:TextBox>
                        </li>
                        <li>
                            <asp:Button ID="btnSaveStewardshipChecklist" runat="server" Text="Save" 
                                CssClass="btn" onclick="btnSaveStewardshipChecklist_Click" />
                            <asp:Label ID="lblBtnValidation" runat="server" Text="* Please enter and save fields in Antibiotic Tracking tab." ForeColor="Red"></asp:Label>
                        </li>
                        <li>
                            <asp:Label ID="lblMessage" runat="server"></asp:Label> 
                        </li>
                    </ul>                    
                </div>
            </div>
            <div id="tabs-4">
                <div class="wizard">
                    <ul>
                        <li>
                            <asp:GridView ID="GridView2" runat="server" CssClass="data-table" 
                                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                                DataSourceID="SqlDataSource1" DataKeyNames="ID" GridLines="None" 
                                onselectedindexchanged="GridView2_SelectedIndexChanged">
                                <EmptyDataTemplate>Please add Lab by clicking button below.</EmptyDataTemplate>
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" SelectText="Update" />
                                    <asp:BoundField DataField="LabDate" HeaderText="Date" SortExpression="LabDate" 
                                        DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="WBC" HeaderText="WBC" SortExpression="WBC" />
                                    <asp:BoundField DataField="HGB" HeaderText="HGB" SortExpression="HGB" />
                                    <asp:BoundField DataField="HCT" HeaderText="HCT" SortExpression="HCT" />
                                    <asp:BoundField DataField="PLT" HeaderText="PLT" SortExpression="PLT" />
                                    <asp:BoundField DataField="Na" HeaderText="Na" SortExpression="Na" />
                                    <asp:BoundField DataField="Cl" HeaderText="Cl" SortExpression="Cl" />
                                    <asp:BoundField DataField="K" HeaderText="K" SortExpression="K" />
                                    <asp:BoundField DataField="CO2" HeaderText="CO2" SortExpression="CO2" />
                                    <asp:BoundField DataField="BUN" HeaderText="BUN" SortExpression="BUN" />
                                    <asp:BoundField DataField="SRCR" HeaderText="SRCR" SortExpression="SRCR" />
                                    <asp:BoundField DataField="Glucose" HeaderText="Glucose" 
                                        SortExpression="Glucose" />
                                    <asp:BoundField DataField="CRCL" HeaderText="CRCL" SortExpression="CRCL" />
                                </Columns>
                            </asp:GridView> 
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="GetAntibioticLabsByAntibioticTrackingID" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hdnAntibioticTrackingID" 
                                        Name="AntibioticTrackingID" PropertyName="Value" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </li>
                        <li>
                            <asp:Button ID="btnAddLab" runat="server" Text="Add" CssClass="btn" 
                                onclick="btnAddLab_Click"/>
                            <asp:Label ID="lblVAlidateAddLab" runat="server" Text="* Please enter and save fields in Antibiotic Tracking tab." ForeColor="Red"></asp:Label>
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
                            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="id" CssClass="data-table"
                                GridLines="None" onselectedindexchanged="GridView5_SelectedIndexChanged" 
                                onrowdatabound="GridView5_RowDataBound" 
                                onrowcommand="GridView5_RowCommand">
                                <EmptyDataTemplate>Please create Cost savings by clicking button below.</EmptyDataTemplate>
                                <Columns>
                                    <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
                                    <asp:BoundField DataField="DateEntered" HeaderText="Date Entered" 
                                        SortExpression="DateEntered" DataFormatString="{0:d}"/>
                                    <asp:BoundField DataField="AntibioticDrug1" HeaderText="Antibiotic 1" 
                                        SortExpression="AntibioticDrug1" />
                                    <asp:BoundField DataField="AntibioticDrug2" HeaderText="Antibiotic 2" 
                                        SortExpression="AntibioticDrug2" />
                                    <asp:BoundField DataField="CostSavings" HeaderText="Cost Savings" 
                                        SortExpression="CostSavings" />
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAccepted" runat="server" Text='<%# Eval("Accepted") %>' Visible="False"></asp:Label>
                                            <asp:Label ID="lblRecommended" runat="server" Text='<%# Eval("Recommended") %>' Visible="False"></asp:Label>
                                            <asp:CheckBoxList ID="chkStatus" runat="server" RepeatLayout="Flow" AutoPostBack="False" Enabled="False">
                                            </asp:CheckBoxList>
                                            <br />
                                            <asp:Button ID="btnSaveStatus" runat="server" Text="Update" CommandName="SaveActivity" CommandArgument='<%# Eval("id") + ";" + Eval("Accepted") + ";" + Eval("Recommended") %>' CausesValidation="False" />
                                            <br />By:<asp:Label ID="lblUpdatedBy" runat="server" Text='<%# Eval("UpdatedBy") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView> 
                        </li>
                        <li>
                            <asp:Button ID="btnAddCostSavings" runat="server" Text="Add" CssClass="btn" 
                                onclick="btnAddCostSavings_Click" />
                            <asp:Label ID="lblCostSavings" runat="server" Text="* Please enter and save fields in Antibiotic Tracking tab." ForeColor="Red"></asp:Label>
                        </li>
                        <li>
                            <asp:Label ID="lblAnalysisMessage" runat="server"></asp:Label> 
                        </li>
                    </ul>
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
                        <legend>Antibiotic Tracking</legend>
                        <ul>
                            <li>
                                <asp:Label ID="Label4" runat="server" Text="Antibiotics Prescribed"></asp:Label>
                            </li>
                            <li>
                                <asp:GridView ID="GridView3" runat="server" CssClass="data-table" 
                                    AutoGenerateColumns="False" GridLines="None">
                                    <EmptyDataTemplate>No Antibiotics prescribed.</EmptyDataTemplate>
                                    <Columns>
                                        <asp:BoundField DataField="AntibioticPrescribedName" 
                                            HeaderText="Antibiotic Prescribed" SortExpression="AntibioticPrescribedName"/>
                                        <asp:BoundField DataField="Dose" HeaderText="Dose" SortExpression="Dose" />
                                        <asp:BoundField DataField="Frequency" HeaderText="Frequency" 
                                            SortExpression="Frequency" />
                                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" 
                                            SortExpression="StartDate" DataFormatString="{0:d}" />
                                        <asp:BoundField DataField="EndDate" HeaderText="End Date" 
                                            SortExpression="EndDate" DataFormatString="{0:d}" />
                                    </Columns>
                                </asp:GridView> 
                            </li>
                            <li>
                                <asp:Label ID="Label6" runat="server" Text="Antibiotic Indication" 
                                    Width="216px"></asp:Label>
                                <asp:Label ID="lblPNAntibioticIndication" runat="server"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="Label13" runat="server" Text="Past Medical History/Conditions" Width="216px"></asp:Label>
                                <asp:Label ID="lblPNPastMedicalHistory" runat="server"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="Label14" runat="server" Text="Other Information" Width="216px"></asp:Label>
                                <asp:Label ID="lblPNOtherInfo" runat="server"></asp:Label>
                            </li>
                        </ul>
                    </fieldset>
                    <fieldset class="section">
                        <legend>Stewardship Checklist</legend>
                        <ul>
                            <li>
                                <asp:Label ID="Label15" runat="server" Text="Did cultures come back from the lab or are pending?" Width="216px"></asp:Label> 
                                <asp:Label ID="lblPNSCLQ1" runat="server"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="Label16" runat="server" Text="When will cultures be available (date)?" Width="216PX"></asp:Label> 
                                <asp:Label ID="lblPNSCLQ2" runat="server"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="Label17" runat="server" Text="Are the antibiotics appropriate?" Width="216PX"></asp:Label> 
                                <asp:Label ID="lblPNSCLQ3" runat="server"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="Label18" runat="server"
                                    Text="What clinical pharmacy interventions do you recommend?" Width="216px"></asp:Label>
                                <asp:Label ID="lblPNSCLQ4" runat="server"></asp:Label> 
                            </li>
                            <li>
                                <asp:Label ID="Label19" runat="server" Text="Can the patient take oral antibiotics?" Width="216px"></asp:Label> 
                                <asp:Label ID="lblPNSCLQ5" runat="server"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="Label20" runat="server" 
                                    Text="What clinical pharmacy interventions do you recommend?" Width="216px"></asp:Label>
                                <asp:Label ID="lblPNSCLQ6" runat="server"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="Label21" runat="server" Text="Other Information" Width="216px"></asp:Label>
                                <asp:Label ID="lblPNSCLQ7" runat="server"></asp:Label>
                            </li>
                        </ul>
                    </fieldset>
                    <fieldset class="section">
                        <legend>Labs</legend>
                        <ul>
                            <li>
                                <asp:GridView ID="GridView4" runat="server" CssClass="data-table" GridLines="None"
                                    DataSourceID="SqlDataSource2" AutoGenerateColumns="False">
                                <EmptyDataTemplate>No labs recorded.</EmptyDataTemplate>
                                <Columns>
                                    <asp:BoundField DataField="LabDate" HeaderText="Date" SortExpression="LabDate" 
                                        DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="WBC" HeaderText="WBC" SortExpression="WBC" />
                                    <asp:BoundField DataField="HGB" HeaderText="HGB" SortExpression="HGB" />
                                    <asp:BoundField DataField="HCT" HeaderText="HCT" SortExpression="HCT" />
                                    <asp:BoundField DataField="PLT" HeaderText="PLT" SortExpression="PLT" />
                                    <asp:BoundField DataField="Na" HeaderText="Na" SortExpression="Na" />
                                    <asp:BoundField DataField="Cl" HeaderText="Cl" SortExpression="Cl" />
                                    <asp:BoundField DataField="K" HeaderText="K" SortExpression="K" />
                                    <asp:BoundField DataField="CO2" HeaderText="CO2" SortExpression="CO2" />
                                    <asp:BoundField DataField="BUN" HeaderText="BUN" SortExpression="BUN" />
                                    <asp:BoundField DataField="SRCR" HeaderText="SRCR" SortExpression="SRCR" />
                                    <asp:BoundField DataField="Glucose" HeaderText="Glucose" 
                                        SortExpression="Glucose" />
                                    <asp:BoundField DataField="CRCL" HeaderText="CRCL" SortExpression="CRCL" />
                                </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="GetRecentAntibioticLabsByAntibioticTrackingID" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hdnAntibioticTrackingID" 
                                        Name="AntibioticTrackingID" PropertyName="Value" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            </li>
                        </ul>
                    </fieldset>
                </div>
                <input id="btnPrint" type="button" value="Print" class="btn" onclick="printPartOfPage('tabs-6');"/>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hdnAntibioticTrackingID" runat="server" />
    <asp:HiddenField ID="tabcontrol" Value="0" runat="server" />
    <asp:HiddenField ID="hdnAntibioticAntibioticPrescribedID" runat="server" />
    <asp:HiddenField ID="hdnLabID" runat="server" />
    <asp:HiddenField ID="hdnCostSavingsID" runat="server" />
    <div id="antibiotics_prescribed" class="antibiotics_prescribed" title="Antibiotics Prescribed" runat="server">
        <div class="popupHeading">
            <div style="float:left;">Antibiotics Prescribed</div>
            <div id="close" style="float:right;padding-left:10px; padding-right:10px;">
                <asp:Button ID="btnClosePopUpAntibioticsPrescribed" runat="server" 
                    class="btnClose" onclick="btnClosePopUpAntibioticsPrescribed_Click" 
                    />
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
                </li>
                <li>
                    <asp:Button ID="btnSaveAntibioticsPrescribed" runat="server" Text="Save" 
                        CssClass="btn" ValidationGroup="s" 
                        onclick="btnSaveAntibioticsPrescribed_Click" />
                    <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn" 
                        onclick="btnClose_Click" />
                </li>
            </ul>
	    </fieldset>
        </div>
    </div>
    <div id="lab" class="lab" runat="server">
        <div class="popupHeading">
            <div style="float:left;">Lab</div>
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
                    <asp:Label ID="lblLabDate" runat="server" Text="Label"></asp:Label>
                </li>
                <li>
		            <label>WBC</label>
                    <asp:TextBox ID="txtWBC" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtWBC" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>HGB</label>
                    <asp:TextBox ID="txtHGB" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtHGB" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>HCT</label>
                    <asp:TextBox ID="txtHCT" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtHCT" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>PLT</label>
                    <asp:TextBox ID="txtPLT" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtPLT" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>Na</label>
                    <asp:TextBox ID="txtNa" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtNa" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>Cl</label>
                    <asp:TextBox ID="txtCl" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator16" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtCl" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>K</label>
                    <asp:TextBox ID="txtK" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator17" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtK" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>CO2</label>
                    <asp:TextBox ID="txtCO2" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator18" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtCO2" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>BUN</label>
                    <asp:TextBox ID="txtBUN" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator19" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtBUN" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>SRCR</label>
                    <asp:TextBox ID="txtSRCR" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator20" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtSRCR" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>Glucose</label>
                    <asp:TextBox ID="txtGlucose" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator21" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtGlucose" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
                    <asp:Button ID="btnSaveLab" runat="server" Text="Save" 
                        CssClass="btn" ValidationGroup="l" onclick="btnSaveLab_Click" />
                    <asp:Button ID="btnDeleteLab" runat="server" Text="Delete" CssClass="btn" 
                        onclick="btnDeleteLab_Click" OnClientClick="return confirm('Are you Sure?')"/>
                    <asp:Button ID="btnCloseLab" runat="server" Text="Close" CssClass="btn" 
                        onclick="btnCloseLab_Click" />
                </li>
            </ul>
	    </fieldset>
        </div>
    </div>
    <div id="cost_savings" class="cost_savings" runat="server">
        <div class="popupHeading">
            <div style="float:left;">Antibiotic Cost Saving</div>
            <div id="closeCostSavingsPopUp" style="float:right;padding-left:10px; padding-right:10px;">
                <asp:Button ID="btnCostSavingsPopUpClose" runat="server" class="btnClose" 
                onclick="btnCostSavingsPopUpClose_Click" />
            </div>
        </div>
        <div style="margin-top:10px;">
            <fieldset>
                <ul>
                    <li>
                        <label>Date</label>
                        <asp:Label ID="lblCostSavingsDateEntered" runat="server"></asp:Label>
                    </li>
                    <li>
                        <%--<label>Days Therapy</label>--%>
                        <asp:Label ID="lblDaysTherapyLabel" runat="server" Text="Days Therapy" Visible="False"></asp:Label>
                        <asp:Label ID="lblDaysTherapy" runat="server" Visible="False"></asp:Label>
                    </li>
                </ul>
            </fieldset>
	        <fieldset>
            <legend>Antibiotic Drug 1</legend>
            <ul>
                <li>
		            <label>Antibiotic Drug</label>
                    <asp:DropDownList ID="ddlAntibioticDrug1" runat="server" 
                        AppendDataBoundItems="True" Width="150px">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="*" 
                        ControlToValidate="ddlAntibioticDrug1" ValidationGroup="c" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>Frequency</label>
                    <asp:DropDownList ID="ddlFrequency1" runat="server" AppendDataBoundItems="True" Width="150px">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="*" 
                        ControlToValidate="ddlFrequency1" ValidationGroup="c" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>Physician</label>
                    <asp:DropDownList ID="ddlPhysician1" runat="server" AppendDataBoundItems="True" Width="150px">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="*" 
                        ControlToValidate="ddlPhysician1" ValidationGroup="c" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </li>
            </ul>
            </fieldset>
            <fieldset>
            <legend>Antibiotic Drug 2</legend>
            <ul>
                <li>
		            <label>Antibiotic Drug</label>
                     <asp:DropDownList ID="ddlAntibioticDrug2" runat="server" 
                        AppendDataBoundItems="True" Width="150px">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="*" 
                        ControlToValidate="ddlAntibioticDrug2" ValidationGroup="c" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>Frequency</label>
                    <asp:DropDownList ID="ddlFrequency2" runat="server" AppendDataBoundItems="True" Width="150px">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ErrorMessage="*" 
                        ControlToValidate="ddlFrequency2" ValidationGroup="c" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </li>
                <li>
		            <label>Physician</label>
                    <asp:DropDownList ID="ddlPhysician2" runat="server" AppendDataBoundItems="True" Width="150px">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ErrorMessage="*" 
                        ControlToValidate="ddlPhysician2" ValidationGroup="c" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </li>
                <li>
                    <asp:Label ID="lblCostSavingsMessage" runat="server"></asp:Label>
                </li>
            </ul>            
            </fieldset>
            <fieldset>
            <ul>
                <li>
                    <asp:Button ID="btnSaveCostSavings" runat="server" Text="Save" 
                        CssClass="btn" ValidationGroup="c" onclick="btnSaveCostSavings_Click" />
                    <asp:Button ID="btnDeleteCostSavings" runat="server" Text="Delete" CssClass="btn" 
                        OnClientClick="return confirm('Are you Sure?')" 
                        onclick="btnDeleteCostSavings_Click"/>
                    <asp:Button ID="btnCloseCostSavings" runat="server" Text="Close" CssClass="btn" 
                        onclick="btnCloseCostSavings_Click"/>
                </li>
            </ul>
	    </fieldset>
        </div>
    </div>
    <div id="UpdateRecomendedAccepted" class="UpdateRecomendedAccepted" runat="server">
        <div class="popupHeading">
            <div style="float:left;">Update Activity</div>
            <div id="closeUpdateRecomendedAccepted" style="float:right;padding-left:10px; padding-right:10px;">
                <asp:Button ID="btnUpdateRecomendedAcceptedClose" runat="server" class="btnClose" 
                onclick="btnUpdateRecomendedAcceptedClose_Click" />
            </div>
        </div>
        <div style="margin-top:10px;">
            <fieldset>
                <ul>
                    <li>
                        <label>Accepted</label>
                        <asp:CheckBox ID="chkAccepted" runat="server" onclick="updateRecommended()"/>
                    </li>
                    <li>
                        <label>Recommended</label>
                        <asp:CheckBox ID="chkRecommended" runat="server" onclick="updateAccepted()"/>
                    </li>
                    <li>
                        <asp:Button ID="btnSaveRecomendedAccepted" runat="server" Text="Save" CssClass="btn"
                            onclick="btnSaveRecomendedAccepted_Click" />
                        <asp:Button ID="btnCloseUpdateRecomendedAccepted" runat="server" Text="Close" CssClass="btn"
                            onclick="btnCloseUpdateRecomendedAccepted_Click" />
                    </li>
                    <li>
                        <asp:Label ID="lblUpdateRecomendedAccepted" runat="server"></asp:Label>
                    </li>
                </ul>
            </fieldset>
        </div>
    </div>
</asp:Content>

