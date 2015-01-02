<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="manageinterventionstypes.aspx.cs" Inherits="manageinterventionstypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    $(document).ready(function(){
        //$("#<%=txtCost.ClientID %>").mask("99.99");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div>
        <fieldset >
            <legend>Manage Interventions Types</legend>
            <ul>
                <li>
                    <label>Site</label>
                    <asp:DropDownList ID="ddlSites" runat="server" AutoPostBack="True" 
                        AppendDataBoundItems="True" 
                        onselectedindexchanged="ddlSites_SelectedIndexChanged">
                    </asp:DropDownList>
                </li>
                <li>
                    <label>Intervention Types</label>
                    <asp:TextBox ID="txtIntervention" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*" ControlToValidate="txtIntervention" ValidationGroup="a" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
                    <label>Cost</label>
                    <asp:TextBox ID="txtCost" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="*" ControlToValidate="txtCost" ValidationGroup="a" 
                        ForeColor="Red"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator1"
                            runat="server" ErrorMessage="Cost is invalid 99.99" ValidationGroup="a" Type="Currency" ControlToValidate="txtCost" Display="Dynamic" Operator="DataTypeCheck" ForeColor="Red"></asp:CompareValidator>
                </li>
                <li>
                    <label></label>
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </li>
                <li>
                    <label>
                        <asp:HiddenField ID="InterventionID" runat="server" />
                    </label>
                    <asp:Button ID="cmdSubmit" runat="server" Text="Save" CssClass="btn"
                        onclick="cmdSubmit_Click" ValidationGroup="a" />
                    <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn" 
                        onclick="btnNew_Click" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn"
                     OnClientClick="return confirm('Are you sure?')" onclick="btnDelete_Click"/>
                </li>
                <li>
                    <asp:GridView ID="GridView1" runat="server" GridLines="None" 
                            CssClass="data-table" AutoGenerateColumns="False" 
                            DataKeyNames="ID" AllowPaging="True" 
                            AllowSorting="True" 
                            onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        onpageindexchanging="GridView1_PageIndexChanging" onsorting="GridView1_Sorting">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="InterventionType" HeaderText="Intervention Type" 
                                    SortExpression="InterventionType" />
                                <asp:BoundField DataField="Cost" HeaderText="Cost" 
                                    SortExpression="Cost" />
                            </Columns>
                        </asp:GridView>
                </li>
            </ul>
        </fieldset>
    </div>
    <asp:HiddenField ID="hdnSite" runat="server" />
</asp:Content>

