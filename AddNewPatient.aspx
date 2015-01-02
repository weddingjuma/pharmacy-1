<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddNewPatient.aspx.cs" Inherits="AddNewPatient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    $(document).ready(function () {
        $("#<%=txtAllergies.ClientID%>").autocomplete({
            delay: 0,
            source: "api/getAllergies.ashx"
        });

        $("#<%=txtAllergies.ClientID%>").Watermark("Type Allergy Name");

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
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="InterierTitle">New Patient</div>
    <div class="patientInfo">
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
            <li>
                <asp:Label ID="lblAlergies" runat="server" Text="Allergies" Width="216px"></asp:Label>
                <asp:TextBox ID="txtAllergies" class="txtAllergies" runat="server"></asp:TextBox>
                <asp:Button ID="btnAdd" runat="server" Text="Select" OnClick="btnAdd_Click" CssClass="btn"
                        CausesValidation="False" />
                <div style=" height:5px;"></div>
                <asp:Label ID="Label2" runat="server" Text="Selected Allergies" Width="216px"></asp:Label>    
                <asp:ListBox ID="lstAllergies" runat="server" Rows="5" Width="153px"></asp:ListBox>
                <asp:Button ID="btnRemove" runat="server" Text="Remove" 
                    OnClick="btnRemove_Click" CssClass="btn" CausesValidation="False" />
            </li>
            <li></li>
            <li>
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn" onclick="btnSave_Click" />
            </li>
            <li>
                <asp:Label ID="lblPateintMessage" runat="server"></asp:Label>
            </li>
        </ul>
    </div>
    </div>
</asp:Content>

