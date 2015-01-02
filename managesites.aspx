<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="managesites.aspx.cs" Inherits="managesites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    function ValidateForm() {

        if ($('#<%=txtSiteName.ClientID %>').val() == "" || $('#<%=txtSiteName.ClientID %>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Site Name');
            return false;
        }

        return true;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div>
    <fieldset >
        <legend>Manage Sites</legend>
        <ul>
            <li>
                <label>Site Name</label>
                <asp:TextBox ID="txtSiteName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                 ControlToValidate="txtSiteName" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
            </li>
            <li><label>Status</label><asp:CheckBox ID="chkActive" runat="server" /></li>
            <li><label>Interventions</label><asp:CheckBox ID="chInterventions" runat="server" /></li>
            <li><label>Temp Task Log</label><asp:CheckBox ID="chTempTaskLog" runat="server" /></li>
            <li><label>Antibiotic Tracking</label><asp:CheckBox ID="chAntibioticTracking" runat="server" /></li>
            <li><label>Task Logs Tracking</label><asp:CheckBox ID="chTaskLogsTracking" runat="server" /></li>
            <li><label>Warfarin Tracking</label><asp:CheckBox ID="chWarfarinTracking" runat="server" /></li>
            <li><label>Compounding Log</label><asp:CheckBox ID="chCompoundingLog" runat="server" /></li>
            <li><label></label><asp:Label ID="lblError" runat="server"></asp:Label></li>
            <li>
                <label>
                    <asp:HiddenField ID="SiteID" runat="server" />
                </label>
                    <asp:Button ID="Button1" runat="server" Text="Save" 
                    onclick="Button1_Click" ValidationGroup="a" CssClass="btn"/>
                <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn" 
                    onclick="btnNew_Click" />
            </li>
            <li>
            <asp:GridView ID="GridView1" runat="server"  
         AutoGenerateColumns="False" DataKeyNames="ID" 
        
        onselectedindexchanged="GridView1_SelectedIndexChanged" GridLines="None" CssClass="data-table" >
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="SiteName" HeaderText="Site Name" 
                SortExpression="Task" />
            <asp:CheckBoxField DataField="Active" HeaderText="Status" />
            <asp:CheckBoxField DataField="Interventions" HeaderText="Interventions" />
            <asp:CheckBoxField DataField="TempTaskLog" HeaderText="Temp Task Log" />
            <asp:CheckBoxField DataField="TaskLogsTracking" HeaderText="Task Logs" />
            <asp:CheckBoxField DataField="AntibioticTracking" HeaderText="Antibiotic" />
            <asp:CheckBoxField DataField="WarfarinTracking" HeaderText="Warfarin" />
            <asp:CheckBoxField DataField="CompoundingLog" HeaderText="Compounding Log" />
        </Columns> 
    </asp:GridView></li>
        </ul>
    </fieldset>
</div>
</asp:Content>

