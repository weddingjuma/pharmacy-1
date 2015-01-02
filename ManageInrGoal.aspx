<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageInrGoal.aspx.cs" Inherits="ManageInrGoal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div>
    <fieldset >
        <legend>Manage Warfarin INR Goal</legend>
        <ul>
            
            <li>
                <label>INR Goal</label>
                <asp:TextBox ID="txtInrGoal" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                 ForeColor="Red" ValidationGroup="a" ControlToValidate="txtInrGoal"></asp:RequiredFieldValidator>
            </li>
            <li>
                <label>Description</label>
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                 ControlToValidate="txtDescription" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
            </li>
            <li><label></label><asp:Label ID="lblError" runat="server"></asp:Label></li>
            <li><label>
                <asp:HiddenField ID="InrID" runat="server" />
            </label>
                <asp:Button ID="btnSave" runat="server" Text="Save" 
                    onclick="btnSave_Click" CssClass="btn" ValidationGroup="a"/>
                <asp:Button ID="btnNew" runat="server" Text="new" CssClass="btn" 
                    onclick="btnNew_Click"/>
                    <asp:Button ID="CmdDelete" runat="server" Text="Delete" 
                    OnClientClick="return confirm('Are you sure?')" CssClass="btn" 
                    onclick="CmdDelete_Click"/>
            </li>
            <li>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
                    DataSourceID="SqlDataSource1" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" GridLines="None" CssClass="data-table">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="inr_goal" HeaderText="INR Goal" 
                            SortExpression="inr_goal" />
                        <asp:BoundField DataField="Description" HeaderText="Description" 
                            SortExpression="Description" />
                    </Columns>
                </asp:GridView>
            </li>
        </ul>
    </fieldset>
</div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [ID], [inr_goal],[Description] FROM [WarfarinInr]">
</asp:SqlDataSource>
</asp:Content>

