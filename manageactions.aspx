<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="manageactions.aspx.cs" Inherits="manageactions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    function ValidateForm() {

        if ($('#<%=txtAction.ClientID %>').val() == "" || $('#<%=txtAction.ClientID %>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Action');
            return false;
        }

        return true;
    }
    function ValidateDelete() {
        if ($('#<%=ActionID.ClientID %>').val() == "" || $('#<%=ActionID.ClientID %>').val() == null) 
        {
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
        <legend>Manage Actions</legend>
        <ul>
            
            <li>
                <label>Action</label>
                <asp:TextBox ID="txtAction" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*" ControlToValidate="txtAction" ValidationGroup="a" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </li>
            <li><label></label><asp:Label ID="lblError" runat="server"></asp:Label></li>
            <li><label>
                <asp:HiddenField ID="ActionID" runat="server" />
            </label>
                <asp:Button ID="Button1" runat="server" Text="Save" 
                    onclick="Button1_Click" CssClass="btn" ValidationGroup="a"  />
                <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn" 
                    onclick="btnNew_Click" />
                    <asp:Button ID="Button2" runat="server" Text="Delete" 
                     OnClientClick="return (confirm('Are you sure?'))" CssClass="btn" 
                    onclick="Button2_Click" />
                    </li>
            <li>
            <asp:GridView ID="GridView1" runat="server"  
         AutoGenerateColumns="False" DataKeyNames="ActionID" 
        CssClass="data-table"
        onselectedindexchanged="GridView1_SelectedIndexChanged" GridLines="None" >
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Action" HeaderText="Action" 
                SortExpression="Action" />
        </Columns> 
    </asp:GridView></li>
        </ul>
    </fieldset>

</div>
</asp:Content>

