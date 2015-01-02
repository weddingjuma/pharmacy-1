<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="manageusers.aspx.cs" Inherits="manageusers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script type="text/javascript" >
    function ValidateForm() {

        if ($('#<%=txtUserID.ClientID %>').val() == "" || $('#<%=txtUserID.ClientID %>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter UserID');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }
        if ($('#<%=hUserID.ClientID %>').val() != "" && $('#<%=hUserID.ClientID %>').val() != null) {
            if($('#<%=hUserID.ClientID %>').val() != $('#<%=txtUserID.ClientID %>').val()){
                $('#<%=lblError.ClientID %>').text('You can not modify UserID');
                $('#<%=lblError.ClientID %>').addClass('error');
                return false;
            }
        }
        if ($('#<%=txtFirstName.ClientID %>').val() == "" || $('#<%=txtFirstName.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter First Name');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }
        if ($('#<%=txtLastName.ClientID %>').val() == "" || $('#<%=txtLastName.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Last Name');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }
        if ($('#<%=txtEmail.ClientID %>').val() == "" || $('#<%=txtEmail.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Email');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }
        if ($('#<%=ddlUserRole.ClientID%>').val() == "" || $('#<%=ddlUserRole.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Select User Role');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }
        if ($('#<%=ddlSites.ClientID%>').val() == "" || $('#<%=ddlSites.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Select Site');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }

        return true;
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <fieldset >
        <legend>Manage Users</legend>
        <ul>
            <li><label>UserID</label><asp:TextBox ID="txtUserID" MaxLength="50" runat="server"></asp:TextBox><asp:HiddenField
                    ID="hUserID" runat="server" />
            </li>
            <li><label>Password</label><asp:TextBox ID="txtPassword" MaxLength="50" runat="server" TextMode="Password" ></asp:TextBox></li>
            <li><label>First Name</label><asp:TextBox ID="txtFirstName" MaxLength="50" runat="server"></asp:TextBox></li>
            <li><label>Last Name</label><asp:TextBox ID="txtLastName" MaxLength="50" runat="server"></asp:TextBox></li>
            <li><label>Email</label><asp:TextBox ID="txtEmail" MaxLength="150" runat="server"></asp:TextBox></li>
            <li><label>Phone</label><asp:TextBox ID="txtPhone" MaxLength="50" runat="server"></asp:TextBox></li>
            <li><label>Address</label><asp:TextBox ID="txtAddress" MaxLength="50" runat="server"></asp:TextBox></li>
            <li><label>City</label><asp:TextBox ID="txtCity" MaxLength="50" runat="server"></asp:TextBox></li>
            <li><label>State</label><asp:TextBox ID="txtState" MaxLength="50" runat="server"></asp:TextBox></li>
            <li><label>Zip Code</label><asp:TextBox ID="txtZipCode" MaxLength="10" runat="server"></asp:TextBox></li>
            <li><label>Role</label><asp:DropDownList ID="ddlUserRole" runat="server" AppendDataBoundItems="true" >
             <asp:ListItem ></asp:ListItem>
                </asp:DropDownList>
            </li> 
            <li><label>Site</label><asp:DropDownList ID="ddlSites" runat="server" AppendDataBoundItems="true" >
            <asp:ListItem ></asp:ListItem>
                </asp:DropDownList>
            </li>
            <li><label>Active</label><asp:CheckBox ID="chkActive" runat="server" /></li>
            <li><label></label><asp:Label ID="lblError" runat="server"></asp:Label></li>
            <li><label></label>
                <asp:Button ID="cmdSave" runat="server" Text="Save" onclick="cmdSave_Click" OnClientClick="return ValidateForm();" CssClass="btn" />
                <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn" 
                    onclick="btnNew_Click"  />
            </li>
                <li>
                    <asp:GridView ID="GridView1" runat="server" DataKeyNames="UserID" 
                        GridLines="None" AutoGenerateColumns="False" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" CssClass="data-table" >
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="UserID" HeaderText="UserID" />
                        <asp:BoundField DataField="SiteName" HeaderText ="Site" />
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="LastName" />
                    </Columns>
                        
                    </asp:GridView>
                </li>
        </ul>
    </fieldset>

</asp:Content>

