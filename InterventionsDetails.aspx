<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="InterventionsDetails.aspx.cs" Inherits="InterventionsDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            var hv = $('#<%=tabcontrol.ClientID%>').val();
            if (hv == 0) {
                $("#tabs").tabs({
                    active: 0
                });
            }
            if (hv == 1) {
                $("#tabs").tabs({
                    active: 1
                });
            }
            if (hv == 2) {
                $("#tabs").tabs({ active: 2 });
            }
            
            $("#<%=txtAllergies.ClientID%>").autocomplete({
                delay: 0,
                 source: function(request, response) {
                    $.ajax({
                        url: "api/getAllergies.ashx",
                        dataType: "json",
                        cache: false,
                        type: "get",
                        data: { term: request.term }
                    }).done(function(data) {
                        response(data);
                    });
                }
            });

            $("#<%=txtIntervention.ClientID%>").autocomplete({
                delay: 0,
                source: function(request, response) {
                    $.ajax({
                        url: "api/GetInterventionTypes.ashx",
                        dataType: "json",
                        cache: false,
                        type: "get",
                        data: { term: request.term }
                    }).done(function(data) {
                        response(data);
                    });
                }
            });

            $("#<%=txtAllergies.ClientID%>").Watermark("Type Allergy Name");
            $("#<%=txtIntervention.ClientID%>").Watermark("Type Intervention Type");

            $('#close').click(function () {
                $('#<%=IntervetionDetail.ClientID%>').css('display', 'none');
            });

            $("#<%=IntervetionDetail.ClientID%>").draggable();

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

        function validateText(oSrc, args) {
            if (args.Value == 'Type Intervention Type') {
                args.IsValid = false;
            }
            //args.IsValid = (args.Value.length >= 8);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="InterierTitle">Interventions</div>
    <div class="patientInfo">
        <div id="tabs">
            <ul>
		        <li><a href="#tabs-1">Patient Information</a></li>
		        <li><a href="#tabs-2">Patient Allergies</a></li>
                <li><a href="#tabs-3">Patient Interventions</a></li>
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
                            <asp:Label ID="Label1" runat="server" Text="Height (feet/in)" Width="216px"></asp:Label>
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
                            <asp:Label ID="lblAlergies" runat="server" Text="Allergies"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtAllergies" class="txtAllergies" runat="server" Width="250px"></asp:TextBox>
                            <asp:Button ID="btnAddAllergies" runat="server" Text="Select" 
                                CausesValidation="False" CssClass="btn" onclick="btnAddAllergies_Click"/>
                            <div style=" height:5px;"></div>
                            <asp:ListBox ID="lstAllergies" runat="server" Rows="5" Width="253px"></asp:ListBox>
                            <asp:Button ID="btnRemoveAllergies" runat="server" Text="Remove"  CssClass="btn"
                                CausesValidation="False" onclick="btnRemoveAllergies_Click" />
                        </li>
                        <li>
                            <asp:Button ID="btnSaveAlergies" runat="server" Text="Save" CssClass="btn" 
                                onclick="btnSaveAlergies_Click" CausesValidation="False" />
                        </li>
                        <li>
                            <asp:Label ID="lblAllergyMessage" runat="server"></asp:Label>  
                        </li>
                    </ul>
                </div>
            </div>
            <div id="tabs-3">
                <div>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CssClass="data-table" 
                        DataKeyNames="InterventionsID" DataSourceID="SqlDataSource1" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" GridLines="None" 
                        onpageindexchanged="GridView1_PageIndexChanged">
                        <EmptyDataTemplate>
                            <asp:Label ID="lblEmptyData" runat="server" Text="No patient interventions recorded, please click 'Add'."></asp:Label>
                        </EmptyDataTemplate>
                        <Columns>
                            <asp:TemplateField HeaderText="#"> 
                                <ItemTemplate> 
                                    <%# Container.DataItemIndex + 1 %> 
                                </ItemTemplate> 
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="InterventionType" HeaderText="Intervention Type" 
                                SortExpression="InterventionType" />
                            <asp:BoundField DataField="Physician" HeaderText="Physician" 
                                SortExpression="Physician" />
                            <asp:BoundField DataField="Minutes" HeaderText="Minutes" 
                                SortExpression="Minutes" />
                            <asp:BoundField DataField="EnteredBy" HeaderText="User Name" 
                                SortExpression="EnteredBy" />
                            <asp:BoundField DataField="EnteredDateTime" HeaderText="Entered Date" 
                                SortExpression="EnteredDateTime" DataFormatString="{0:d}" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CssClass="selectButton"
                                        CommandName="Select" Text="Update"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="GetInterventionsByPatientID" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="PatientID" QueryStringField="PatientId" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div>
                    <br />
                    <asp:Button ID="btnNewIntervetion" runat="server" Text="Add" CssClass="btn" 
                        onclick="btnNewIntervetion_Click" CausesValidation="False" />  
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="tabcontrol" Value="0" runat="server" />
    <div id="IntervetionDetail" runat="server">
        <div class="popupHeading">
            <div style="float:left;">Intervention Detail</div>
            <div id="close" style="float:right;padding-left:10px; padding-right:10px;">
                <span class="ui-icon ui-icon-circle-close"></span>
            </div>
        </div>
        <div style="margin-top:10px;">
            <fieldset>
            <ul>
                <li>
                    <label>Intervention</label>
                    <asp:TextBox ID="txtIntervention" class="txtIntervention" runat="server"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtIntervention"
                     ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>--%>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtIntervention"
                    ValidationGroup="a" ClientValidationFunction="validateText" ForeColor="Red"></asp:CustomValidator>
                    <%--<asp:Button ID="btnAddInervention" runat="server" Text="Select" CssClass="btn" 
                        CausesValidation="False" onclick="btnAddInervention_Click" />--%>
                    <%--<div style="height:5px;"></div>
                    <asp:ListBox ID="lstIntervention" runat="server" Rows="5" Width="200px"></asp:ListBox>
                    <asp:Button ID="btnRemoveInervention" runat="server" Text="Remove" CssClass="btn"
                            CausesValidation="False" onclick="btnRemoveInervention_Click" />--%>
                </li>
                <li>
                    <label>Minutes Spent</label>
                    <asp:TextBox ID="txtMinutes" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*"
                     ControlToValidate="txtMinutes" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                </li>
                <li>
                    <label>Physician</label>
                    <asp:DropDownList ID="ddlPhysician" runat="server"></asp:DropDownList>
                </li>
                <li></li>
                <li>
                    <asp:Button ID="btnSaveIntervetion" runat="server" Text="Save" CssClass="btn" 
                        onclick="btnSaveIntervetion_Click" ValidationGroup="a" /> 
                    <asp:Button ID="btnDeleteIntervetion" runat="server" Text="Delete" 
                        CssClass="btn" onclick="btnDeleteIntervetion_Click" 
                        onclientclick="return(confirm('Are you sure?'))" />
                    <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn" 
                        onclick="btnClose_Click"/>
                </li>
                <li>
                    <asp:Label ID="lblInterventionMsg" runat="server"></asp:Label>
                </li>
            </ul>
            </fieldset>
        </div>
        <asp:HiddenField ID="hdnInterventionID" runat="server" />
    </div>
</asp:Content>

