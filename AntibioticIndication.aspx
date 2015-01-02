<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AntibioticIndication.aspx.cs" Inherits="AntibioticIndication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <fieldset >
            <legend>Antibiotic Indications</legend>
            <ul>
                <li>
                    <label>Antibiotic Indication</label>
                    <asp:TextBox ID="txtAntibioticIndication" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtAntibioticIndication" ValidationGroup="a" ForeColor="Red"></asp:RequiredFieldValidator>
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
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn" 
                        onclick="btnDelete_Click" onclientclick="return(confirm('Are you sure?'))"
                     />
                </li>
                <li>
                        <asp:GridView ID="GridView1" runat="server" GridLines="None" 
                            CssClass="data-table" AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSource1" DataKeyNames="AntibiotcIndicationID" AllowPaging="True" 
                            AllowSorting="True" 
                            onselectedindexchanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="AntibioticIndication" HeaderText="Antibiotic Indication" 
                                    SortExpression="AntibioticIndication" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [AntibioticIndications]"></asp:SqlDataSource>
                </li>
            </ul>
        </fieldset>
    </div>
</asp:Content>

