<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript" >
    function ValidateForm() {

        
        
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
        if ($('#<%=txtPassword.ClientID %>').val() == "" || $('#<%=txtPassword.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Password');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }

        return true;
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<fieldset >
    <ul>
        <li><label>Password</label><asp:TextBox ID="txtPassword" MaxLength="50" runat="server" TextMode="Password" ></asp:TextBox></li>
        <li><label>First Name</label><asp:TextBox ID="txtFirstName" MaxLength="50" runat="server"></asp:TextBox></li>
        <li><label>Last Name</label><asp:TextBox ID="txtLastName" MaxLength="50" runat="server"></asp:TextBox></li>
        <li><label>Email</label><asp:TextBox ID="txtEmail" MaxLength="150" runat="server"></asp:TextBox></li>
        <li><label>Phone</label><asp:TextBox ID="txtPhone" MaxLength="50" runat="server"></asp:TextBox></li>
        <li><label>Address</label><asp:TextBox ID="txtAddress" MaxLength="50" runat="server"></asp:TextBox></li>
        <li><label>City</label><asp:TextBox ID="txtCity" MaxLength="50" runat="server"></asp:TextBox></li>
        <li><label>State</label><asp:TextBox ID="txtState" MaxLength="50" runat="server"></asp:TextBox></li>
        <li><label>Zip Code</label><asp:TextBox ID="txtZipCode" MaxLength="10" runat="server"></asp:TextBox></li>
        <li><label></label><asp:Label ID="lblError" runat="server"></asp:Label></li>
            <li><label></label>
                <asp:Button ID="cmdSave" runat="server" Text="Save" onclick="cmdSave_Click" OnClientClick="return ValidateForm();" CssClass="btn" />
            </li>
    </ul>
</fieldset>
</asp:Content>

