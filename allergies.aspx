<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="allergies.aspx.cs" Inherits="allergies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <fieldset >
            <legend>Allergies</legend>
            <ul>
                <li>
                    <label>Allergy</label>
                    <asp:TextBox ID="txtAllergy" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtAllergy" ValidationGroup="a" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li>
                    <label></label>
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                </li>
                <li>
                    <label>
                        <asp:HiddenField ID="AllergyID" runat="server" />
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
                            DataSourceID="SqlDataSource1" DataKeyNames="ID" AllowPaging="True" 
                            AllowSorting="True" 
                            onselectedindexchanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="Allergy" HeaderText="Allergy" 
                                    SortExpression="Allergy" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [Allergies]"></asp:SqlDataSource>
                </li>
            </ul>
        </fieldset>
    </div>

</asp:Content>

