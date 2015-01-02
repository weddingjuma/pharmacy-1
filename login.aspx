<%@ Page Title="" Language="C#" MasterPageFile="~/Unsecure.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script type="text/javascript" >
    function ValidateForm() {
        
        if ($('#<%=txtUserID.ClientID %>').val() == "" || $('#<%=txtUserID.ClientID %>').val() == null) {
            $('#<%=lblError.ClientID%>').text('Enter User ID');
            return false;
        }
        if ($('#<%=txtPassword.ClientID %>').val() == "" || $('#<%=txtPassword.ClientID %>').val() == null) {
            $('#<%=lblError.ClientID%>').text('Enter Password');
            return false;
        }
        return true;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="loginbox">
    <fieldset>
        <ul>
            <li><label>User ID</label><asp:TextBox ID="txtUserID" runat="server" Width="130px"></asp:TextBox></li>
       
            <li><label>Password</label><asp:TextBox ID="txtPassword" runat="server" 
                    TextMode="Password" Width="130px" ></asp:TextBox></li>
            <li>
                <asp:Label ID="lblError" runat="server" Text="" CssClass="error"></asp:Label>
            </li>
            <li><label></label>
                <asp:Button CssClass="btn"  ID="cmdSubmit" runat="server" Text="Sign in" 
                    onclick="cmdSubmit_Click" OnClientClick="return ValidateForm();" /></li>
        </ul>
    </fieldset>
</div>

</asp:Content>

