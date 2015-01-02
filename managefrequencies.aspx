<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="managefrequencies.aspx.cs" Inherits="managefrequencies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    function ValidateForm() {

        if ($('#<%=txtFrequency.ClientID %>').val() == "" || $('#<%=txtFrequency.ClientID %>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Frequency');
            return false;
        }

        return true;
    }
    function ValidateDelete() {
        if ($('#<%=FrequencyID.ClientID %>').val() == "" || $('#<%=FrequencyID.ClientID %>').val() == null) {
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
        <legend>Manage Frequencies</legend>
        <ul>
            <li>
                <label>Dose</label>
                <asp:TextBox ID="txtFrequency" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                 ValidationGroup="a" ControlToValidate="txtFrequency" ForeColor="Red"></asp:RequiredFieldValidator>
            </li>
            <li>
                <label>Description</label>
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                 ValidationGroup="a" ControlToValidate="txtDescription" ForeColor="Red"></asp:RequiredFieldValidator>
            </li>
            <li><label></label><asp:Label ID="lblError" runat="server"></asp:Label></li>
            <li><label>
                <asp:HiddenField ID="FrequencyID" runat="server" />
            </label><asp:Button ID="Button1" runat="server" Text="Save" 
                    onclick="Button1_Click" ValidationGroup="a" CssClass="btn" />
                <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn" 
                    onclick="btnNew_Click" />
                    <asp:Button ID="cmDelete" runat="server" Text="Delete" 
                    OnClientClick="return confirm('Are you sure?')" CssClass="btn" 
                    onclick="cmDelete_Click" />
                    </li>
            <li>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="FrequencyID" 
        DataSourceID="SqlDataSource1" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" GridLines="None" CssClass="data-table" >
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Frequency" HeaderText="Frequency" 
                SortExpression="Frequency" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="DEscription" />
        </Columns>
    </asp:GridView></li>
        </ul>
    </fieldset>

</div>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [FrequencyID], [Frequency],[Description] FROM [Frequencies]">
    </asp:SqlDataSource>
</asp:Content>

