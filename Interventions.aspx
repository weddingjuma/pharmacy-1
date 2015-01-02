<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Interventions.aspx.cs" Inherits="Interventions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="InterierTitle">Interventions</div>
    <div class="patientInfo">
        <div class="searchPatientDiv">
            <asp:Label ID="lblSearchNmae" runat="server" Text="Name:" ForeColor="White"></asp:Label>
            <asp:TextBox ID="txtSearchName" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" 
                onclick="btnSearch_Click"/>
            <asp:Button ID="btnReports" runat="server" Text="Reports" CssClass="btn" 
                onclick="btnReports_Click" Visible="False"/>
        </div>
    </div>
    <div class="patientInfo">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CssClass="data-table"
            AllowSorting="True" AutoGenerateColumns="False" 
            DataKeyNames="PatientID" 
            GridLines="None" onselectedindexchanged="GridView1_SelectedIndexChanged" 
            onpageindexchanging="GridView1_PageIndexChanging" 
            onrowdeleting="GridView1_RowDeleting" onsorting="GridView1_Sorting">
            <EmptyDataTemplate>
                <asp:Label ID="lblEmptyData" runat="server" Text="No patients in the database, please select 'Add New' or 'Add Wizard'."></asp:Label>   
            </EmptyDataTemplate>
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="PatientIN" HeaderText="Patient Identifier Number" 
                    SortExpression="PatientIN" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                <asp:BoundField DataField="DOB" HeaderText="Date of Birth" SortExpression="DOB" 
                    DataFormatString="{0:d}" />
                <asp:BoundField DataField="Height" HeaderText="Height" 
                    SortExpression="Height" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" 
                    SortExpression="Weight" />
                <asp:BoundField DataField="Sex" HeaderText="Gender" SortExpression="Sex" />
                <asp:BoundField DataField="Room" HeaderText="Room" SortExpression="Room" />
                <%--<asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" OnClientClick="return (confirm('Are you sure?'))"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>--%>
            </Columns>
        </asp:GridView>
        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="GetPatientsInerventions" 
            SelectCommandType="StoredProcedure" DeleteCommand="DeletePatient" 
            DeleteCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:ControlParameter ControlID="GridView1" Name="PatientID" 
                    PropertyName="SelectedValue" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="SiteID" SessionField="Site" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
    </div>
    <div class="patientInfo">
        <br />
        <asp:Button ID="btnAddNewPatientIntervention" runat="server" Text="Add New" 
            CssClass="btn" onclick="btnAddNewPatientIntervention_Click" />
        <%--<asp:Button ID="btnWizard" runat="server" Text="Add Wizard" CssClass="btn" 
            onclick="btnWizard_Click"/>--%>
    </div>
</asp:Content>

