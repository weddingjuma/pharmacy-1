<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="InterventionReportView.aspx.cs" Inherits="InterventionReportView" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="InterierTitle">
        <asp:Button ID="btnSearch" runat="server" Text="Reports" CssClass="btn" 
            Font-Size="X-Small" onclick="btnSearch_Click"/>
    </div>
    <div class="patientInfo">
        <div style="width:700px; overflow:auto;">
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
                AutoDataBind="true" EnableDatabaseLogonPrompt="False" 
                EnableParameterPrompt="False" ToolPanelView="None" BestFitPage="False" 
                PageZoomFactor="75" 
                HasCrystalLogo="False" 
                PrintMode="ActiveX"/>
        </div>
    </div>
</asp:Content>

