<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="guidelines.aspx.cs" Inherits="guidelines" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div>
    <fieldset >
    <legend>Treatment Reference</legend>
    <ul>
        <li>
            <label>Antibiotic</label>
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </li>
        <li>
            <label>Warfarin</label>
            <asp:FileUpload ID="FileUpload2" runat="server" />
        </li>
        <li><label></label>
            <asp:Button ID="Button1" runat="server" Text="Submit" 
                onclick="Button1_Click" />
        </li>
        <li>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </li>
    </ul>
    </fieldset>
</div>
</asp:Content>

