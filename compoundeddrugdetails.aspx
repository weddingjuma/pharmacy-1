<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="compoundeddrugdetails.aspx.cs" Inherits="compoundeddrugdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    $(document).ready(function () {
        $("#<%=popupform.ClientID%>").draggable();
        $('#<%=txtExpiryDate.ClientID%>').datepicker();
        $("#<%=txtDrug.ClientID%>").autocomplete({
            delay: 0,
            source: "api/GetCompoundedLookup.ashx?type=1"
        });
        $("#<%=txtStrength.ClientID%>").autocomplete({
            delay: 0,
            source: "api/GetCompoundedLookup.ashx?type=2"
        });
        $("#<%=txtConcentration.ClientID%>").autocomplete({
            delay: 0,
            source: "api/GetCompoundedLookup.ashx?type=3"
        });
        $("#<%=txtForm.ClientID%>").autocomplete({
            delay: 0,
            source: "api/GetCompoundedLookup.ashx?type=4"
        });
        if ($('#<%=ID.ClientID %>').val() == '' || $('#<%=ID.ClientID %>').val() == null) {
            $('#<%=cmdDelete.ClientID %>').hide();
        }

    });
    function ValidateForm() {


        if ($('#<%=txtDrug.ClientID %>').val() == "" || $('#<%=txtDrug.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Additive/Solution being used');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }
        if ($('#<%=txtStrength.ClientID %>').val() == "" || $('#<%=txtStrength.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Additive Strength');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }
        if ($('#<%=txtConcentration.ClientID %>').val() == "" || $('#<%=txtConcentration.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Concentration');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }

        if ($('#<%=txtForm.ClientID %>').val() == "" || $('#<%=txtForm.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Form');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }
        if ($('#<%=txtSize.ClientID %>').val() == "" || $('#<%=txtSize.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Size');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }

        if ($('#<%=txtLot.ClientID %>').val() == "" || $('#<%=txtLot.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Lot');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }

        if ($('#<%=txtExpiryDate.ClientID %>').val() == "" || $('#<%=txtExpiryDate.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter MFG Expiry Date');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }
        if ($('#<%=txtDrugManufacturer.ClientID %>').val() == "" || $('#<%=txtDrugManufacturer.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Drug Manufacturer');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }
        
        if ($('#<%=txtQty.ClientID %>').val() == "" || $('#<%=txtQty.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Used Quantity ');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }
        return true;
    }
    function closePopUp() {
        $('#<%=popupform.ClientID %>').hide();
        $('#<%=txtDrug.ClientID %>').val('');
        $('#<%=txtStrength.ClientID %>').val('');
        $('#<%=txtConcentration.ClientID %>').val('');
        $('#<%=txtForm.ClientID %>').val('');
        //$('#<%=ID.ClientID %>').val('');
        $('#<%=txtQty.ClientID %>').val('');
        $('#<%=txtSize.ClientID %>').val('');
        $('#<%=txtLot.ClientID %>').val('');
        $('#<%=txtExpiryDate.ClientID %>').val('');
        $('#<%=txtDrugManufacturer.ClientID %>').val('');


        return false;
    }
    function ConfirmDelete() {
            var cd;
            cd = confirm('Are you sure you want to delete?');
            if (cd == true) {
                closePopUp();
                return true;
            }
            return false;
    }
    
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="InterierTitle">Compounding Log Detail</div>
    <div class="patientInfo">
        <div class="searchPatientDiv">
            <asp:Label ID="lblCompoundedLogLabel" runat="server" Text="Compounded Drug:" 
                ForeColor="White"></asp:Label>
            <asp:Label ID="lblCompoundedDrug" runat="server" ForeColor="White" Font-Bold="True" Font-Underline="True"></asp:Label>
         </div>
    </div>
    <div class="patientInfo">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="ID" CssClass="data-table" 
            GridLines="None" onselectedindexchanged="GridView1_SelectedIndexChanged"  
            PageSize="50" 
            onpageindexchanging="GridView1_PageIndexChanging">
            <EmptyDataTemplate>
                <asp:Label ID="lblEmptyGridView1" runat="server" Text="No Compouneded Drug details in the database, please select 'Add New'."></asp:Label>
            </EmptyDataTemplate>
            <Columns>
                <asp:TemplateField ShowHeader="True" HeaderText="Additive/Solution<br>being used" 
                    SortExpression="CompoundedDrug">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Select" Text='<%#Bind("Additive")%>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Additive&lt;br&gt;Strength" 
                    SortExpression="Strength">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Strength") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Strength") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Concentration" HeaderText="Concentration" 
                    SortExpression="Concentration"  />
                <asp:BoundField DataField="Form" HeaderText="Form" 
                    SortExpression="Form" />
                <asp:TemplateField HeaderText=" Size&lt;br&gt;(Vial/Bag)" SortExpression="Size">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Size") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Size") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Lot&lt;br&gt;number" SortExpression="Lot_Number">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Lot_Number") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Lot_Number") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MFG&lt;br&gt;expiry date" 
                    SortExpression="Mfg_expiry_date">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" 
                            Text='<%# Bind("Mfg_expiry_date", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Mfg_expiry_date") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Drug&lt;br&gt;Manufacturer" 
                    SortExpression="Drug_Manufacturer">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Drug_Manufacturer") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" 
                            Text='<%# Bind("Drug_Manufacturer") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Qty&lt;br&gt;Used" SortExpression="Qty">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Qty") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div class="patientInfo">
        <asp:Button ID="Button1" runat="server" Text="Add New" CssClass="btn" onclick="Button1_Click"  />
         <asp:Button ID="cmdReturn" runat="server" Text="Return" CssClass="btn" onclick="cmdReturn_Click" />
    </div>
    <div id="popupform" runat="server" class="taskLogsTracking">
        <div class="popupHeading">
            <div style="float:left;"></div>
            <div id="closeLab" style="float:right;padding-left:9px; padding-right:10px; width:14px;">
                <asp:Button ID="PopUpClose" runat="server" class="btnClose" style="width:14px;" OnClientClick="return closePopUp();"  />
            </div>
        </div>
            <asp:HiddenField runat="server" ID="CompoundedDrugID"/>
            <asp:HiddenField runat="server" ID="ID"/>
            <fieldset>
                <ul>
                    <li><label>Additive/Solution being used</label><asp:TextBox ID="txtDrug" runat="server" MaxLength="150"></asp:TextBox></asp:ListItem>
                    </li>
                    <li><label>Additive Strength</label><asp:TextBox ID="txtStrength" runat="server"></asp:TextBox>
                    </li>                     
                    <li><label>Concentration</label><asp:TextBox ID="txtConcentration" runat="server" MaxLength="50"></asp:TextBox></li>
                    <li><label>Form</label><asp:TextBox ID="txtForm" runat="server" MaxLength="50"></asp:TextBox></li>
                    <li><label>Size</label><asp:TextBox ID="txtSize" runat="server"></asp:TextBox></li>
                    <li><label>Lot Number</label><asp:TextBox ID="txtLot" runat="server"></asp:TextBox></li>
                    <li><label>MFG expiry date</label><asp:TextBox ID="txtExpiryDate" runat="server" CssClass="datepicker"></asp:TextBox></li>
                    <li><label>Drug Manufacturer</label><asp:TextBox ID="txtDrugManufacturer" runat="server" ></asp:TextBox></li>
                    <li><label>Quantity Used</label><asp:TextBox ID="txtQty" runat="server"></asp:TextBox></li>
                    <li>
                    <asp:Label ID="lblError" runat="server" Text="" CssClass="error"></asp:Label></li>
                    <li><label></label>
                        <asp:Button ID="cmdSave" runat="server" Text="Save" CssClass="btn" 
                            OnClientClick="return ValidateForm();" onclick="cmdSave_Click" /><asp:Button ID="CmdCancel" runat="server" Text="Cancel" CssClass="btn" OnClientClick="return closePopUp();" />
                            <asp:Button ID="cmdDelete" runat="server" Text="Delete" CssClass="btn" 
                            OnClientClick="return ConfirmDelete();" onclick="cmdDelete_Click" />
                            </li>
                </ul>
            </fieldset>
      </div>    
</asp:Content>

