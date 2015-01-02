<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Physicians.aspx.cs" Inherits="Physicians" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script type="text/javascript" >
        function ValidateForm() {
            if ($('#<%=ddSite.ClientID %>').val() == "" || $('#<%=ddSite.ClientID %>').val() == null) {
                $('#<%=lblError.ClientID %>').text('Please Select Site');
                return false;
            }
            if ($('#<%=txtFirstName.ClientID %>').val() == "" || $('#<%=txtFirstName.ClientID %>').val() == null) {
                $('#<%=lblError.ClientID %>').text('Please Enter First Name');
                return false;
            }
            if ($('#<%=txtLastName.ClientID %>').val() == "" || $('#<%=txtLastName.ClientID %>').val() == null) {
                $('#<%=lblError.ClientID %>').text('Please Enter Last Name');
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div>
    <fieldset >
        <legend>Manage Physicians</legend>
        <ul>
            <li><label>Site ID</label><asp:DropDownList ID="ddSite" runat="server" AppendDataBoundItems="true" >
            <asp:ListItem ></asp:ListItem>
                </asp:DropDownList>
            </li>
            <li><label>First Name</label><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></li>
            <li><label>Last Name</label><asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></li>
            <li><label>Phone</label><asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></li>
            <li><label>Email</label><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></li>
            <li><label>Active</label><asp:CheckBox ID="chkActive" runat="server" /></li>
            <li><asp:Label ID="lblError" runat="server"></asp:Label></li>
            <li>
                <label>
                    <asp:HiddenField ID="PhysicianID" runat="server" />
                </label>
                <asp:Button ID="Button1" runat="server" Text="Save" 
                    onclick="Button1_Click" OnClientClick="return ValidateForm();" CssClass="btn"/>
                <asp:Button ID="btnnew" runat="server" Text="New" CssClass="btn" 
                    onclick="btnnew_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn" 
                 OnClientClick="return confirm('Are you sure?')" onclick="btnDelete_Click"/>
            </li>
            <li>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PhysicianID" 
        DataSourceID="SqlDataSource1" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" GridLines="None" CssClass="data-table">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="PhysicianFirstName" HeaderText="First Name" 
                SortExpression="PhysicianFirstName" />
            <asp:BoundField DataField="PhysicianLastName" HeaderText="Last Name" 
                SortExpression="PhysicianLastName" />
            <asp:BoundField DataField="PhysicianPhone" HeaderText="Phone" 
                SortExpression="PhysicianPhone" />
            <asp:BoundField DataField="PhysicianEmail" HeaderText="Email" 
                SortExpression="PhysicianEmail" />
            <asp:CheckBoxField DataField="Active" HeaderText="Active" 
                SortExpression="Active" />
        </Columns>
    </asp:GridView></li>
        </ul>
    </fieldset>

</div>
<div>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [PhysicianID], [PhysicianFirstName], [PhysicianLastName], [PhysicianPhone], [PhysicianEmail], [Active] FROM [Physicians]">
    </asp:SqlDataSource>
</div>
</asp:Content>

