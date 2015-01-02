<%@ Page Title="" Language="C#" MasterPageFile="~/Unsecure.master" AutoEventWireup="true" CodeFile="sitemap.aspx.cs" Inherits="sitemap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<title>Sitemap</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="margin-top:30px">
        <div style="margin-left:20px"><h1>Site Map</h1></div>
        
        <ul>
        
            <li><a href="Default.aspx">Home</a></li>
            <li><a href="solutions.aspx">Solutions</a></li>
            <li><a href="products.aspx">Products</a></li>
            <li><a href="freeconsultation.aspx">Free Cosultation</a></li>
            <li><a href="contact.aspx">Contact us</a></li>
        </ul> 
    </div>
</asp:Content>

