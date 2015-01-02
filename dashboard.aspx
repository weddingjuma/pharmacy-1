<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="InterierTitle">Products</div>
<div class="patientInfo">
    <div id="MessageDiv" style="margin:5px auto 10px auto; width:300px;">
        <asp:Label ID="lblMessage" runat="server" Font-Size="14px" Font-Bold="True"></asp:Label>
    </div>
    <table style="" width="90%" cellpadding="0" cellspacing="0">
        <tr>
            <td width="50%" style="border-left:1px solid #000000;border-top:1px solid #000000; border-bottom:1px solid #000000; text-align:center; padding:10px;"><span style="font-weight:bold ;">Clinical Pharmacy<br />Intervention Software</span></td>
            <td width="50%" style="border:1px solid #000000;text-align:left; padding:10px;">
            <ul>
            <li>Customizable</li>
            <li>Users can track daily and monthly interventions</li>
            <li>Printable reports</li>
            <li> Cost savings analysis</li>
            </ul> 
            </td>
        </tr>
        <tr>
            <td style="border-left:1px solid #000000; border-bottom:1px solid #000000; text-align:center; padding:10px;"><span style="font-weight:bold ;">Temperature/Task<br />Monitoring Software</span></td>
            <td style="border-left:1px solid #000000;border-right:1px solid #000000;border-bottom:1px solid #000000;text-align:left; padding:10px;">
                <ul>
                    <li>Customizable</li>
                    <li>Reduce paper monitoring temperature/task logs</li>
                    <li>Easily retrievable/printable temperature/task logs</li>
                    <li>Satisfy regulatory agencies</li>
                    <li>Reduce likelihood of missing essential tasks</li>
                </ul> 
            </td>
        </tr>
        <tr>
            <td style="border-left:1px solid #000000; border-bottom:1px solid #000000; text-align:center; padding:10px;"><span style="font-weight:bold ;">Clinical Antibiotic<br />Monitoring Software</span> </td>
            <td style="border-left:1px solid #000000;border-right:1px solid #000000;border-bottom:1px solid #000000;text-align:left; padding:10px;">
                <ul>
                    <li>Customizable</li>
                    <li>Standardized form</li>
                    <li>Lab monitoring</li>
                    <li>Antibiotic appropriateness</li>
                    <li>Better Clinical Outcomes</li> 
                </ul>
            </td>
        </tr>
        <tr>
            <td style="border-left:1px solid #000000;border-bottom:1px solid #000000; text-align:center; padding:10px;"><span style="font-weight:bold ;">Clinical Warfarin<br />Monitoring Software</span></td>
            <td style="border-left:1px solid #000000;border-right:1px solid #000000;border-bottom:1px solid #000000;text-align:left; padding:10px;">
                <ul>
                    <li>Standardized form</li>
                    <li>Daily tracking and monitoring of patients</li>
                    <li>Printable reports</li>
                    <li>Retrospective analysis of dosing</li>
                    <li>INR/dose/lab tracking</li>
                    <li>No more paper forms</li> 
                </ul>
            </td>
        </tr>
    </table>
</div>
</asp:Content>

