<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="managetasks.aspx.cs" Inherits="ManageTasks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    function ValidateForm() {

        if ($('#<%=txtTask.ClientID %>').val() == "" || $('#<%=txtTask.ClientID %>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Task');
            return false;
        }

        return true;
    }
    function ValidateDelete() {
        if ($('#<%=TaskID.ClientID %>').val() == "" || $('#<%=TaskID.ClientID %>').val() == null) {
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
        <legend>Manage Tasks</legend>
        <ul>
            <li>
                <label>Task</label>
                <asp:TextBox ID="txtTask" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                 ValidationGroup="a" ForeColor="Red" ControlToValidate="txtTask"></asp:RequiredFieldValidator>
            </li>
            <li><label></label><asp:Label ID="lblError" runat="server"></asp:Label></li>
            <li><label>
                <asp:HiddenField ID="TaskID" runat="server" />
            </label>
                <asp:Button ID="Button1" runat="server" Text="Save" 
                    onclick="Button1_Click" CssClass="btn" ValidationGroup="a"  />
                <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn" 
                    onclick="btnNew_Click"/>
                    <asp:Button ID="cmdDelete" runat="server" Text="Delete" 
                    OnClientClick="return confirm('Are you sure');" CssClass="btn" 
                    onclick="cmdDelete_Click"  />
                    </li>
            <li>
            <asp:GridView ID="GridView1" runat="server"  
         AutoGenerateColumns="False" DataKeyNames="TaskID" 
        CssClass="data-table"
        onselectedindexchanged="GridView1_SelectedIndexChanged" GridLines="None" >
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Task" HeaderText="Task" 
                SortExpression="Task" />
        </Columns> 
    </asp:GridView></li>
        </ul>
    </fieldset>
</div>
</asp:Content>

