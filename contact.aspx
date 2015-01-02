<%@ Page Title="" Language="C#" MasterPageFile="~/Unsecure.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="InterierTitle">Contact Us</div>
<div style="min-height:400px">
<fieldset >
    <ul>
        <li><label>Toll Free Phone:</label><asp:Label ID="lblPhone" runat="server" Text=""></asp:Label></li>
        <li><label>Email:</label><a href="" runat="server" id="email"></a></li>
        <li><label>Website:</label><a href="" runat="server" id="url"></a></li>
        <li>
            <asp:Label ID="lblContent" runat="server" Text=""></asp:Label>
        
        </li>
    </ul>
</fieldset>
    
    
    
</div>
<div style="clear:both" ></div>
<div class="orangebox">
    <img src="images/makeyourpharmacy.png" />
 </div>

</asp:Content>

