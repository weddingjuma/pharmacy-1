<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CompoundedLookup.aspx.cs" Inherits="CompoundedLookup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script type="text/javascript">
    function ValidateForm() {

        
        if ($('#<%=txtname.ClientID %>').val() == "" || $('#<%=txtname.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter look up value');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }
        if ($('#<%=ddltype.ClientID%>').val() == "" || $('#<%=ddltype.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Select Look up type');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }

        return true;
    }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<div>
    <fieldset>
        <asp:HiddenField ID="ID" runat="server" />
        <legend>Manage Compounded Dgud Look ups</legend>
        <ul>
            <li>
                <label>Name</label><asp:TextBox ID="txtname" runat="server" MaxLength="50"></asp:TextBox></li>
            <li>
                <label>Type</label>
                <asp:DropDownList ID="ddltype" runat="server">
                    <asp:ListItem ></asp:ListItem>
                    <asp:ListItem Value="Compounded Drug">Compounded Drug</asp:ListItem>
                    <asp:ListItem Value="Additive Strength">Additive Strength</asp:ListItem>
                    <asp:ListItem Value="Concentration">Concentration</asp:ListItem>
                    <asp:ListItem Value="Form">Form</asp:ListItem>
                </asp:DropDownList>
            </li>
            <li><label></label><asp:Label ID="lblError" runat="server"></asp:Label></li>
            <li><label></label>
                <asp:Button ID="cmdSave" runat="server" Text="Save" onclick="cmdSave_Click" OnClientClick="return ValidateForm();" CssClass="btn" />
                <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn" 
                    onclick="btnNew_Click"  />
            </li>
            <li>
                    <asp:GridView ID="GridView1" runat="server" DataKeyNames="ID" 
                        GridLines="None" AutoGenerateColumns="False" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        CssClass="data-table" onrowdeleting="GridView1_RowDeleting" >
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Select" Text="Select"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="Delete" Text="Delete" CommandArgument='<%#Bind("ID")%>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="name" HeaderText ="Name" />
                        <asp:BoundField DataField="type" HeaderText="Type" />
                    </Columns>
                    </asp:GridView>
            </li>
        </ul>
    </fieldset>

</div>
</asp:Content>

