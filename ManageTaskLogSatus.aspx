<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageTaskLogSatus.aspx.cs" Inherits="ManageTaskLogSatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div>
    <fieldset >
        <legend>Manage Task Log Satus</legend>
        <ul>
            
            <li>
                <label>Satus</label>
                <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                 ForeColor="Red" ValidationGroup="a" ControlToValidate="txtStatus"></asp:RequiredFieldValidator>
            </li>
            <li><label></label><asp:Label ID="lblError" runat="server"></asp:Label></li>
            <li><label>
                <asp:HiddenField ID="StatusID" runat="server" />
            </label>
                <asp:Button ID="btnSave" runat="server" Text="Save" 
                    CssClass="btn" ValidationGroup="a" onclick="btnSave_Click"/>
                <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn" 
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
            <asp:BoundField DataField="Status" HeaderText="Status" 
                SortExpression="Status" />
        </Columns>
    </asp:GridView></li>
        </ul>
    </fieldset>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [ID],[Status] FROM [TaskLogStatus]">
    </asp:SqlDataSource>
</div>
</asp:Content>

