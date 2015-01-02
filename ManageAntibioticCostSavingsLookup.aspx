<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageAntibioticCostSavingsLookup.aspx.cs" Inherits="ManageAntibioticCostSavingsLookup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="float:left">
        <fieldset >
            <legend>Antibiotics Cost Savings Lookpup</legend>
            <ul>
               <li>
                    <label>Days Therapy</label>
                    <asp:TextBox ID="txtDaysTherapy" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtDaysTherapy" ForeColor="Red" ValidationGroup="d"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                        ErrorMessage="* Must be Numeric" ControlToValidate="txtDaysTherapy" 
                        Operator="DataTypeCheck" Type="Integer" ValidationGroup="d" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                    <asp:Button ID="btnDaysTherapy" runat="server" Text="Save" ValidationGroup="d" 
                        onclick="btnDaysTherapy_Click" CssClass="btn" />
                   <asp:Label ID="lblDaysTherapyMessage" runat="server"></asp:Label>
                </li>
                <li></li><li></li>
                <li>
                    <label>Description</label>
                    <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtDescription" ValidationGroup="a" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
                    <label>Type</label>
                    <asp:DropDownList ID="ddlType" runat="server">
                        <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                        <asp:ListItem>Drug</asp:ListItem>
                        <asp:ListItem>Frequency</asp:ListItem>
                        <%--<asp:ListItem>DaysTherapy</asp:ListItem>--%>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="ddlType" ForeColor="Red" ValidationGroup="a" InitialValue="0"></asp:RequiredFieldValidator>
                </li>
                <li>
                    <label>Cost</label>
                    <asp:TextBox ID="txtCost" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Must be numeric" ControlToValidate="txtCost" ValidationGroup="a" ForeColor="Red" Operator="DataTypeCheck" Type="Currency" Display="Dynamic"></asp:CompareValidator>
                </li>
                <li>
                    <label></label>
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                </li>
                <li>
                    <label>
                        <asp:HiddenField ID="ID" runat="server" />
                    </label>
                    <asp:Button ID="cmdSubmit" runat="server" Text="Save" CssClass="btn"
                        onclick="cmdSubmit_Click" ValidationGroup="a" />
                    <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn" 
                        onclick="btnNew_Click" />
                </li>
                <li>
                    <asp:GridView ID="GridView1" runat="server" CssClass="data-table" 
                        AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                        DataKeyNames="id" DataSourceID="SqlDataSource1" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" GridLines="None">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="Description" HeaderText="Description" 
                                SortExpression="Description" />
                            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                            <asp:BoundField DataField="Conversion" HeaderText="Conversion" 
                                SortExpression="Conversion" />
                            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                        </Columns>
                    </asp:GridView>  
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="GetAntibioticsCostSavingsTrackingLookup" 
                        SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </li>
            </ul>
        </fieldset>
    </div>
</asp:Content>

