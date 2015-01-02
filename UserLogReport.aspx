<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UserLogReport.aspx.cs" Inherits="UserLogReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    $(document).ready(function () {
        $("#<%=txtStartDate.ClientID%>").datepicker();
        $("#<%=txtEndDate.ClientID%>").datepicker();
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="InterierTitle">User Logs Reports</div>
    <div class="patientInfo">
        <div class="wizard">
            <ul>
                <li>
                    <asp:Label ID="lblReportName" runat="server" Text="Report Name:" Width="100px"></asp:Label>
                    <asp:DropDownList ID="ddlReportName" runat="server" AppendDataBoundItems="True">
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
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" 
                    onclick="btnSearch_Click" ValidationGroup="s" />
                </li>
            </ul>
        </div>
    </div>
</asp:Content>

