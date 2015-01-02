<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="WarfarinTracking.aspx.cs" Inherits="WarfarinTracking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="InterierTitle">Warfarin Tracking</div>
    <div class="patientInfo">
        <div class="searchPatientDiv">
            <asp:Label ID="lblSearchNmae" runat="server" Text="Name:" ForeColor="White"></asp:Label>
            <asp:TextBox ID="txtSearchName" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" 
                onclick="btnSearch_Click"/>
            <asp:Button ID="btnReports" runat="server" Text="Reports" CssClass="btn" 
                onclick="btnReports_Click" Visible="False"/>
            <asp:HyperLink ID="hplWarfarinGuideline" runat="server" Target="_blank" 
                NavigateUrl="~/guidelines/WarfarinTreatmentReference.pdf" 
                Font-Underline="True" ForeColor="White">Warfarin Treatment Reference</asp:HyperLink>
        </div>
    </div>
    <div class="patientInfo">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CssClass="data-table"
            AllowSorting="True" AutoGenerateColumns="False" 
            DataKeyNames="PatientID" 
            GridLines="None" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            onrowdeleting="GridView1_RowDeleting" 
            onpageindexchanging="GridView1_PageIndexChanging" onsorting="GridView1_Sorting">
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
            SelectCommand="GetPatientsWarfarinTracking" 
            SelectCommandType="StoredProcedure" DeleteCommandType="StoredProcedure" DeleteCommand="DeletePatient">
            <SelectParameters>
                <asp:SessionParameter Name="SiteID" SessionField="Site" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:ControlParameter ControlID="GridView1" Name="PatientID" 
                    PropertyName="SelectedValue" />
            </DeleteParameters>
        </asp:SqlDataSource>--%>
    </div>
    <div class="patientInfo">
        <br />
        <asp:Button ID="btnAddNewPatientWarfarin" runat="server" Text="Add New" 
            CssClass="btn" onclick="btnAddNewPatientWarfarin_Click" />
        <%--<asp:Button ID="btnWizard" runat="server" Text="Add Wizard" CssClass="btn" onclick="btnWizard_Click" 
            />--%>
    </div>
</asp:Content>

