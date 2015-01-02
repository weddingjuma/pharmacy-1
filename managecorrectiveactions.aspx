<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="managecorrectiveactions.aspx.cs" Inherits="managecorrectiveactions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    function ValidateForm() {

        if ($('#<%=txtCorrectiveAction.ClientID %>').val() == "" || $('#<%=txtCorrectiveAction.ClientID %>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Corrective Action');
            return false;
        }

        return true;
    }
    function ValidateDelete() {
        if ($('#<%=CorrectiveActionID.ClientID %>').val() == "" || $('#<%=CorrectiveActionID.ClientID %>').val() == null) {
            alert('Nothing to delete');
            return false;
        }
        if (!confirm('Do you really want to delete?')) {
            return false;
        }
        return true;
    }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div>
    <fieldset >
        <legend>Manage Corrective Actions</legend>
        <ul>
            
            <li>
                <label>Corrective Action</label>
                <asp:TextBox ID="txtCorrectiveAction" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtCorrectiveAction"
                 ValidationGroup="a" ForeColor="Red"></asp:RequiredFieldValidator>
            </li>
            <li><label></label><asp:Label ID="lblError" runat="server" Text=""></asp:Label></li>
            <li><label>
                <asp:HiddenField ID="CorrectiveActionID" runat="server" />
            </label><asp:Button ID="Button1" runat="server" Text="Save" 
                    onclick="Button1_Click" ValidationGroup="a" CssClass="btn" />
                <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn" 
                    onclick="btnNew_Click" />
             <asp:Button ID="cmdDelete" runat="server" Text="Delete" 
                     OnClientClick="return confirm('Are you sure?')" CssClass="btn" 
                    onclick="cmdDelete_Click" />
             </li>
            <li>
            <asp:GridView ID="GridView1" runat="server"  
         AutoGenerateColumns="False" DataKeyNames="CorrectiveActionID" 
        CssClass="data-table"
        onselectedindexchanged="GridView1_SelectedIndexChanged" GridLines="None" >
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="CorrectiveAction" HeaderText="Corrective Action" 
                SortExpression="CorrectiveAction" />
        </Columns> 
    </asp:GridView></li>
        </ul>
    </fieldset>

</div>
</asp:Content>
