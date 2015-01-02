<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="compoundeddrug.aspx.cs" Inherits="compoundeddrug" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=popupform.ClientID%>").draggable();
        $('#<%=txtExpiryDate.ClientID%>').datepicker();
        $('#<%=txtExpiryTime.ClientID%>').timepicker();
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

    });
    function ValidateForm() {


        if ($('#<%=txtDrug.ClientID %>').val() == "" || $('#<%=txtDrug.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Compounded Drug');
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

        if ($('#<%=txtQty.ClientID %>').val() == "" || $('#<%=txtQty.ClientID%>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Quantity made');
            $('#<%=lblError.ClientID %>').addClass('error');
            return false;
        }
        return true;
    }
    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="InterierTitle">Compounding log</div>
    <div class="patientInfo">
        <div class="searchPatientDiv">
            <asp:Label ID="lblStartDate" runat="server" Text="Start Date:" ForeColor="White"></asp:Label>
            <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
            <asp:Label ID="lblEndDate" runat="server" Text="End Date:" ForeColor="White"></asp:Label>
            <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn"
                OnClick="btnSearch_Click" ValidationGroup="s" />
        </div>
    </div>
    <div class="patientInfo">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
            AutoGenerateColumns="False" DataKeyNames="ID" CssClass="data-table"
            GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
            PageSize="50" OnRowDataBound="GridView1_RowDataBound"
            OnPageIndexChanging="GridView1_PageIndexChanging"
            OnSorting="GridView1_Sorting" OnRowCommand="GridView1_RowCommand">
            <EmptyDataTemplate>
                <asp:Label ID="lblEmptyGridView1" runat="server" Text="No Compuneded Drugs in the database, please select 'Add New'."></asp:Label>
            </EmptyDataTemplate>
            <Columns>
                <asp:TemplateField ShowHeader="True" HeaderText="Date<br>entered"
                    SortExpression="Date_entered">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text='<%#Eval("Date_entered","{0:d}")%>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="True" HeaderText="Compounded<br>Drug"
                    SortExpression="CompoundedDrug">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False"
                            CommandName="Details" Text='<%#Bind("Drug")%>' CommandArgument='<%#Bind("ID")%>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Strength"
                    SortExpression="Strength">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Strength") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Strength") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Concentration" HeaderText="Concentration"
                    SortExpression="Concentration" />
                <asp:BoundField DataField="Form" HeaderText="Form"
                    SortExpression="Form" />
                <asp:TemplateField HeaderText="Quantity&lt;br&gt;Made" SortExpression="Qty">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Qty") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Size" HeaderText="Size"
                    SortExpression="Size"></asp:BoundField>
                <asp:TemplateField HeaderText="Internal&lt;br&gt;Lot number"
                    SortExpression="Internal_Lot_Number">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Internal_Lot_Number") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server"
                            Text='<%# Bind("Internal_Lot_Number") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Expiry&lt;br&gt;Date"
                    SortExpression="Expiry_Date">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server"
                            Text='<%# Bind("Expiry_Date", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Expiry_Date") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Expiry&lt;br&gt;Time"
                    SortExpression="Expiry_Time">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Expiry_Time","{0:t}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Expiry_Time","{0:t}") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Checked By">
                    <ItemTemplate>
                        <asp:Label ID="lblCheckedBy" runat="server" Text='<%# Eval("CheckedBy") %>' Visible="False"></asp:Label>
                        <asp:Label ID="lblPreparedBy" runat="server" Text='<%# Eval("PreparedBy") %>' Visible="False"></asp:Label>
                        <asp:Button ID="btnSaveStatus" runat="server" Text="Check" CommandName="SaveActivity" CommandArgument='<%# Eval("id") + ";" + Eval("CheckedBy")%>' CausesValidation="False" />
                        <asp:Label ID="lblGridCheckedBy" runat="server" Text='<%# Eval("CheckedBy") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div class="patientInfo">
        <p></p>
        <asp:Button ID="Button1" runat="server" Text="Add New" CssClass="btn"
            OnClick="Button1_Click" />
    </div>
    <div id="popupform" runat="server" class="taskLogsTracking">
        <div class="popupHeading">
            <div style="float: left;">New Drug</div>
            <div id="closeLab" style="float: right; padding-left: 9px; padding-right: 10px; width: 14px;">
                <asp:Button ID="PopUpClose" runat="server" class="btnClose" Style="width: 14px;" OnClick="PopUpClose_Click" />
            </div>
        </div>
        <asp:HiddenField runat="server" ID="ID" Value="" />
        <fieldset>
            <ul>
                <li>
                    <label>Date Entered</label><asp:Label ID="lblDateEntered" runat="server"></asp:Label></li>
                <li>
                    <label>Compunded Drug</label><asp:TextBox ID="txtDrug" runat="server" MaxLength="150"></asp:TextBox>
                </li>
                <li>
                    <label>Additive Strength</label><asp:TextBox ID="txtStrength" runat="server"></asp:TextBox>
                </li>
                <li>
                    <label>Concentration</label><asp:TextBox ID="txtConcentration" runat="server" MaxLength="50"></asp:TextBox></li>
                <li>
                    <label>Form</label><asp:TextBox ID="txtForm" runat="server" MaxLength="50"></asp:TextBox></li>
                <li>
                    <label>Quantity Made</label><asp:TextBox ID="txtQty" runat="server"></asp:TextBox></li>
                <li>
                    <label>Size</label><asp:TextBox ID="txtSize" runat="server"></asp:TextBox></li>
                <li>
                    <label>Internal Lot Number</label><asp:TextBox ID="txtLot" runat="server"></asp:TextBox></li>
                <li>
                    <label>Expiry Date</label><asp:TextBox ID="txtExpiryDate" runat="server" CssClass="datepicker"></asp:TextBox></li>
                <li>
                    <label>Expiry Time</label><asp:TextBox ID="txtExpiryTime" runat="server" CssClass="timepicker"></asp:TextBox></li>
                <li>
                    <label>Entered By</label>
                    <asp:Label ID="lblEnteredBy" runat="server"></asp:Label>
                </li>
                <li>
                    <label>Checked By</label>
                    <asp:Label ID="lblCheckedBy" runat="server"></asp:Label>
                </li>
                <li>
                    <asp:Label ID="lblError" runat="server" Text="" CssClass="error"></asp:Label>
                </li>
                <li>
                    <label></label>
                    <asp:Button ID="cmdSave" runat="server" Text="Save" CssClass="btn"
                        OnClientClick="return ValidateForm();" OnClick="cmdSave_Click" /><asp:Button ID="CmdCancel" runat="server" Text="Cancel" CssClass="btn" OnClick="CmdCancel_Click" /></li>
            </ul>
        </fieldset>
    </div>
    <div id="CheckedBy" class="CheckedBy" runat="server">
        <div class="popupHeading">
            <div style="float: left;">Check By</div>
            <div id="closeCheckedBy" style="float: right; padding-left: 10px; padding-right: 10px;">
                <asp:Button ID="btnCheckedByClose" runat="server" class="btnClose" OnClick="btnCheckedByClose_Click" />
            </div>
        </div>
        <div style="margin-top: 10px;">
            <fieldset>
                <ul>
                    <li>
                        <label>Check By</label>
                        <asp:CheckBox ID="chkCheckBy" runat="server" />
                    </li>
                    <li>
                        <asp:Button ID="btnSaveCheckedBy" runat="server" Text="Save" CssClass="btn" OnClick="btnSaveCheckedBy_Click" />
                        <asp:Button ID="btnCloseCheckedBy" runat="server" Text="Cancel" CssClass="btn" OnClick="btnCloseCheckedBy_Click" />
                    </li>
                </ul>
            </fieldset>
        </div>
    </div>
    <asp:HiddenField ID="hdnCompoundedDrugID" runat="server" />
</asp:Content>

