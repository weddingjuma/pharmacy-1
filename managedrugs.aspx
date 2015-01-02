<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="managedrugs.aspx.cs" Inherits="managedrugs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  <script type="text/javascript" >
      function ValidateForm() {
          
          if ($('#<%=txtDrug.ClientID %>').val() == "" || $('#<%=txtDrug.ClientID %>').val() == null) {
              $('#<%=lblError.ClientID %>').text('Please Enter Drug');
              return false;
          }
          
          return true;
      }
      function ValidateDelete() {
          if ($('#<%=DrugID.ClientID %>').val() == "" || $('#<%=DrugID.ClientID %>').val() == null) {
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
        <legend>Manage Drugs</legend>
        <ul>
            <li>
                <label>Drug</label>
                <asp:TextBox ID="txtDrug" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                 ValidationGroup="a" ControlToValidate="txtDrug" ForeColor="Red"></asp:RequiredFieldValidator>
             </li>
            <li><label></label><asp:Label ID="lblError" runat="server"></asp:Label></li>
            <li><label>
                <asp:HiddenField ID="DrugID" runat="server" />
            </label><asp:Button ID="Button1" runat="server" Text="Save" 
                    onclick="Button1_Click" CssClass="btn" ValidationGroup="a" />
                <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn" 
                    onclick="btnNew_Click" />
                <asp:Button ID="cmdDelete" runat="server" Text="Delete" 
                    OnClientClick="return confirm('Are you sure?')" CssClass="btn" 
                    onclick="cmdDelete_Click" />
            </li>
            <li>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DrugID" 
        DataSourceID="SqlDataSource1" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" GridLines="None" CssClass="data-table" >
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Drug" HeaderText="Drug" 
                SortExpression="Drug" />
            
        </Columns>
    </asp:GridView></li>
        </ul>
    </fieldset>

</div>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [DrugID], [Drug] FROM [Drugs]">
    </asp:SqlDataSource>
</asp:Content>

