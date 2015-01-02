<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="InterventionsReports.aspx.cs" Inherits="InterventionsReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    $(document).ready(function () {
        $("#<%=txtStartDate.ClientID%>").datepicker();
        $("#<%=txtEndDate.ClientID%>").datepicker();
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="InterierTitle">Interventions Reports</div>
    <div class="patientInfo">
        <%--<div>
            <ul style="list-style-type:square;">
                <li><asp:HyperLink ID="hplTotalInterventionsPerSite" runat="server" NavigateUrl="~/TotalInterventionsPerSsite.aspx" ForeColor="#71B8E0">Total Interventions Per Site</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/InterventionsByDate.aspx" ForeColor="#71B8E0">Interventions By Date</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/InterventionsByuser.aspx" ForeColor="#71B8E0">Interventions By User</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/TotalMinutesSpentPerIntervention.aspx" ForeColor="#71B8E0">Total Minutes Spent By Date</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/testreport.aspx" ForeColor="#71B8E0">test</asp:HyperLink></li>
            </ul>
        </div>--%>
        <div class="wizard">
            <ul>
                <li>
                    <asp:Label ID="lblReportName" runat="server" Text="Report Name:" Width="100px"></asp:Label>
                    <asp:DropDownList ID="ddlReportName" runat="server" AppendDataBoundItems="True" 
                        AutoPostBack="True" onselectedindexchanged="ddlReportName_SelectedIndexChanged">
                        <asp:ListItem Value="0">Select  Report</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="ddlReportName" ValidationGroup="s" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </li>
                <li>
                    <asp:Label ID="lblSearchNmae" runat="server" Text="Start Date:" Width="100px"></asp:Label>
                    <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtStartdate" ValidationGroup="s"></asp:RequiredFieldValidator>
                </li>
                <li>
                    <asp:Label ID="lblEndDate" runat="server" Text="End Date:" 
                        Width="100px"></asp:Label>
                    <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEndDate" ValidationGroup="s"></asp:RequiredFieldValidator>
                </li>
                <li>
                    <asp:Label ID="lblUser" runat="server" Text="User" Width="100px"></asp:Label>
                    <asp:DropDownList ID="ddlUserList" runat="server" AppendDataBoundItems="True" 
                        Enabled="False">
                        <asp:ListItem>All</asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li>
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" 
                    onclick="btnSearch_Click" ValidationGroup="s" />
                </li>
            </ul>
        </div>
    </div>
</asp:Content>

