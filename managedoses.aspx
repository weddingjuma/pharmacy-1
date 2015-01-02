<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="managedoses.aspx.cs" Inherits="managedoses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
     function ValidateForm() {

         if ($('#<%=txtDose.ClientID %>').val() == "" || $('#<%=txtDose.ClientID %>').val() == null) {
              $('#<%=lblError.ClientID %>').text('Please Enter Dose');
              return false;
          }
          
          return true;
      }
      function ValidateDelete() {
          if ($('#<%=DoseID.ClientID %>').val() == "" || $('#<%=DoseID.ClientID %>').val() == null) {
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
        <legend>Manage Doses</legend>
        <ul>
            
            <li>
                <label>Dose</label>
                <asp:TextBox ID="txtDose" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                 ForeColor="Red" ValidationGroup="a" ControlToValidate="txtDose"></asp:RequiredFieldValidator>
            </li>
            <li>
                <label>Description</label>
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                 ControlToValidate="txtDescription" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
            </li>
            <li><label></label><asp:Label ID="lblError" runat="server"></asp:Label></li>
            <li><label>
                <asp:HiddenField ID="DoseID" runat="server" />
            </label><asp:Button ID="Button1" runat="server" Text="Save" 
                    onclick="Button1_Click" CssClass="btn" ValidationGroup="a"/>
                <asp:Button ID="btnNew" runat="server" Text="new" CssClass="btn" 
                    onclick="btnNew_Click"/>
                    <asp:Button ID="CmdDelete" runat="server" Text="Delete" 
                    OnClientClick="return confirm('Are you sure?')" CssClass="btn" 
                    onclick="CmdDelete_Click"/>
                    </li>
            <li>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DoseID" 
        DataSourceID="SqlDataSource1" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" GridLines="None" CssClass="data-table">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Dose" HeaderText="Dose" 
                SortExpression="Dose" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="DEscription" />
        </Columns>
    </asp:GridView></li>
        </ul>
    </fieldset>

</div>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [DoseID], [Dose],[Description] FROM [Doses]">
    </asp:SqlDataSource>
</asp:Content>

