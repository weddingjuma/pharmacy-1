<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Temperature.aspx.cs" Inherits="Temperature" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
    <fieldset >
        <legend>Manage Temperature</legend>
        <ul>
            <li>
                <label>Temperature</label>
                <asp:TextBox ID="txtTemperature" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*" ControlToValidate="txtTemperature" ValidationGroup="a" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </li>
            <li><label></label><asp:Label ID="lblError" runat="server"></asp:Label></li>
            <li><label>
                <asp:HiddenField ID="TemperatureID" runat="server" />
            </label>
                <asp:Button ID="btnSave" runat="server" Text="Save" 
                    onclick="btnSave_Click" CssClass="btn" ValidationGroup="a"  />
                <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn" 
                    onclick="btnNew_Click" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                     OnClientClick="return (confirm('Are you sure?'))" CssClass="btn" 
                    onclick="btnDelete_Click" />
                    </li>
            <li>
            <asp:GridView ID="GridView1" runat="server"  
         AutoGenerateColumns="False" DataKeyNames="ID" 
        CssClass="data-table"
        onselectedindexchanged="GridView1_SelectedIndexChanged" GridLines="None" >
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Temperature" HeaderText="Temperature" 
                SortExpression="Temperature" />
        </Columns> 
    </asp:GridView></li>
        </ul>
    </fieldset>
</div>
</asp:Content>

