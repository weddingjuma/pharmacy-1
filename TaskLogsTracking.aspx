<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TaskLogsTracking.aspx.cs" Inherits="TaskLogsTracking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    var dateToday = new Date();
    $(document).ready(function () {
        $("#<%=newTaskLogsTracking.ClientID%>").draggable();
        $("#<%=confirmAnotherTaskPopUp.ClientID%>").draggable();
        $("#<%=txtDueDate.ClientID%>").datepicker({ minDate: 0 });
        $("#<%=txtStartDate.ClientID%>").datepicker();
        $("#<%=txtEndDate.ClientID%>").datepicker();
        $("#<%=txtTask.ClientID%>").Watermark("Type Task");
        $("#<%=txtTask.ClientID%>").autocomplete({
            delay: 0,
            source: "api/GetTasks.ashx"
        });
    });

    function validateText(oSrc, args) {
        if (args.Value == 'Type Task') {
            args.IsValid = false;
        }
        //args.IsValid = (args.Value.length >= 8);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="InterierTitle">Task Logs Tracking</div>
    <div class="patientInfo">
        <div class="searchPatientDiv">
            <asp:Label ID="lblStartDate" runat="server" Text="Start Due Date:" ForeColor="White"></asp:Label>
            <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
            <asp:Label ID="lblEndDate" runat="server" Text="End Due Date:" ForeColor="White"></asp:Label>
            <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
            <asp:Label ID="lblSite" runat="server" Text="Site:" ForeColor="White" Visible="False"></asp:Label>
            <asp:DropDownList ID="ddlSites" runat="server" Visible="False"></asp:DropDownList>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" 
                onclick="btnSearch_Click" ValidationGroup="s" />
        </div>
    </div>
    <div class="patientInfo">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="id" CssClass="data-table" 
            GridLines="None" onselectedindexchanged="GridView1_SelectedIndexChanged" 
            AllowSorting="True" onrowdatabound="GridView1_RowDataBound" 
            onpageindexchanging="GridView1_PageIndexChanging" onsorting="GridView1_Sorting">
            <EmptyDataTemplate>
                <asp:Label ID="lblEmptyGridView1" runat="server" Text="No Task Logs in the database, please select 'Add New'."></asp:Label>
            </EmptyDataTemplate>
            <Columns>
                <asp:TemplateField ShowHeader="True" HeaderText="Task" 
                    SortExpression="TaskDescription">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Select" Text='<%#Bind("TaskDescription")%>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Status" HeaderText="Status" 
                    SortExpression="Status" />
                <asp:BoundField DataField="DueDate" HeaderText="Due Date" 
                    SortExpression="DueDate" DataFormatString="{0:d}" />
                <asp:BoundField DataField="DueTime" HeaderText="Due Time" 
                    SortExpression="DueTime" />
                <asp:BoundField DataField="AssignedTo" HeaderText="Assigned To" 
                    SortExpression="AssignedTo" />
                <asp:BoundField DataField="Comments" HeaderText="Comments" 
                    SortExpression="Comments" >
                </asp:BoundField>
                
            </Columns>
        </asp:GridView>
        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="GetTaskLogsTracking" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="SiteID" SessionField="Site" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
    </div>
    <div class="patientInfo">
        <br />
        <asp:Button ID="btnAddNewTaskLogsTracking" runat="server" Text="Add New" 
            CssClass="btn" onclick="btnAddNewTaskLogsTracking_Click"/>
    </div>
    <asp:HiddenField ID="hdnTaskLogsTrackingID" runat="server" />
    <div id="newTaskLogsTracking" class="taskLogsTracking" runat="server">
        <div class="popupHeading">
            <div style="float:left;">New Task Logs Event</div>
            <div id="closeLab" style="float:right;padding-left:10px; padding-right:10px;">
                <asp:Button ID="btnNewTaskLogsPopUpClose" runat="server" class="btnClose" onclick="btnNewTaskLogsPopUpClose_Click" />
            </div>
        </div>
        <div style="margin-top:10px;">
            <div style="margin-left:15px;">
                <asp:Label ID="lblPastDueMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>
	        <fieldset>
            <ul>
                <li>
		            <label>Task</label>
                    <asp:TextBox ID="txtTask" runat="server"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtTask" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                     <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtTask"
                    ValidationGroup="l" ClientValidationFunction="validateText" ForeColor="Red"></asp:CustomValidator>
                </li>
                <li>
		            <label>Due Date</label>
                    <asp:TextBox ID="txtDueDate" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtDueDate" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="dd/mm/yyyy *" ForeColor="Red" 
                        ControlToValidate="txtDueDate" ValidationGroup="l" Display="Dynamic" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                </li>
                <li>
		            <label>Due Time</label>
                    H <asp:DropDownList ID="ddlHour" runat="server" AppendDataBoundItems="True"></asp:DropDownList>
                    M <asp:DropDownList ID="ddlMinutes" runat="server" AppendDataBoundItems="True"></asp:DropDownList>
                    <asp:DropDownList ID="ddlAmPM" runat="server" AppendDataBoundItems="True">
                        <asp:ListItem Value="AM">AM</asp:ListItem>
                        <asp:ListItem Value="PM" Selected="True">PM</asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li>
                    <label>Status</label>
                    <asp:DropDownList ID="ddlStatus" runat="server">
                        <asp:ListItem Value="Complete">Complete</asp:ListItem>
                        <asp:ListItem Value="Pending" Selected="True">Pending</asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li>
		            <label>Task assigned to</label>
                    <asp:TextBox ID="txtAssignedTo" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" 
                        ControlToValidate="txtAssignedTo" ValidationGroup="l" ForeColor="Red"></asp:RequiredFieldValidator>
                </li>
                <li></li>
                <li>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="FrequencyDropdowns"><label>Email</label></div>
                            <div style="float:left">
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                <asp:Button ID="btnAddEmail" runat="server" Text="Add" CssClass="btn" 
                                    onclick="btnAddEmail_Click" ValidationGroup="e" />
                            </div>
                            <div class="FrequencyDropdownsSeparator"></div>
                            <div class="FrequencyDropdowns"><label>Email List</label></div>
                            <div style="float:left">
                                <asp:ListBox ID="lstEmailList" runat="server" AppendDataBoundItems="True" 
                                    Width="170px"></asp:ListBox>
                                <asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="btn" onclick="btnRemove_Click" />
                            </div>
                            <div class="FrequencyDropdownsSeparator"></div>
                            <div class="FrequencyDropdowns">&nbsp;</div>
                            <div style="float:left">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ErrorMessage="* Invalid Email" ControlToValidate="txtEmail" ValidationGroup="e" 
                                    ForeColor="Red" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" 
                                    Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                            <div style="clear:both;"></div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnAddEmail" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnRemove" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </li>
                <li>
                    <label>Is this a recurring event?</label>
                    <asp:DropDownList ID="ddlIsRecurring" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlIsRecurring_SelectedIndexChanged">
                        <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="FrequencyDropdowns"><label>How often?</label></div>
                            <div style="float:left">
                                <asp:DropDownList ID="ddlFrequency" runat="server" Enabled="False" 
                                    AutoPostBack="True" onselectedindexchanged="ddlFrequency_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem Value="1">Daily</asp:ListItem>
                                    <asp:ListItem Value="2">Every Other Day</asp:ListItem>
                                    <asp:ListItem Value="3">Every Third Day</asp:ListItem>
                                    <asp:ListItem Value="4">Monthly</asp:ListItem>
                                    <asp:ListItem Value="5">Weekly</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvFrequency" runat="server" ErrorMessage="*" 
                                    ControlToValidate="ddlFrequency" ForeColor="Red" Enabled="False" 
                                    InitialValue="0" ValidationGroup="l">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="FrequencyDropdownsSeparator"></div>
                            <div class="FrequencyDropdowns"><label>If Weekly, what day?</label></div>
                            <div style="float:left">
                                <asp:DropDownList ID="ddlWeeklyFrequency" runat="server" Enabled="False">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem Value="1">Monday</asp:ListItem>
                                    <asp:ListItem Value="2">Tuesday</asp:ListItem>
                                    <asp:ListItem Value="3">Wednesday</asp:ListItem>
                                    <asp:ListItem Value="4">Thursday</asp:ListItem>
                                    <asp:ListItem Value="5">Friday</asp:ListItem>
                                    <asp:ListItem Value="6">Saturday</asp:ListItem>
                                    <asp:ListItem Value="7">Sunday</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvWeeklyFrequency" runat="server" 
                                    ErrorMessage="*" ControlToValidate="ddlWeeklyFrequency" ForeColor="Red" 
                                    ValidationGroup="l" Enabled="False" InitialValue="0"></asp:RequiredFieldValidator>
                            </div>
                            <div class="FrequencyDropdownsSeparator"></div>
                            <div class="FrequencyDropdowns"><label>If Monthly, what day?</label></div>
                            <div style="float:left">
                                <asp:DropDownList ID="ddlMonthlyFrequency" runat="server" Enabled="False"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvMonthlyFrequency" runat="server" 
                                    ErrorMessage="*" ControlToValidate="ddlMonthlyFrequency" ForeColor="Red" 
                                    ValidationGroup="l" Enabled="False" InitialValue="0"></asp:RequiredFieldValidator>
                            </div>
                            <div style="clear:both;"></div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlIsRecurring" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="ddlFrequency" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </li>
                <li>
                    <label>Email to be sent to email list</label>
                    <asp:DropDownList ID="ddlEmailFrequency" runat="server">
                        <asp:ListItem Value="0">1 day before task due</asp:ListItem>
                        <asp:ListItem Value="1">at 7:00am day task is due</asp:ListItem>
                        <asp:ListItem Value="2">1 week before task due</asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li>
                    <label>Comments</label>
                    <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                </li>
                <li>
                    <label>Completed By</label>
                    <asp:Label ID="lblCompletedBy" runat="server" Text="N/A"></asp:Label>
                </li>
                <li>
                    <label>Completed Date</label>
                    <asp:Label ID="lblCompletedDate" runat="server" Text="N/A"></asp:Label>
                </li>
                <li>
                    <asp:Label ID="lblSitesNewTask" runat="server" Text="Site" Visible="False"></asp:Label>
                    <asp:DropDownList ID="ddlSitesNewTask" runat="server" Visible="False"></asp:DropDownList>
                </li>
                <li>
                    <asp:Button ID="btnSaveTaskLogs" runat="server" Text="Save" 
                        CssClass="btn" ValidationGroup="l" onclick="btnSaveTaskLogs_Click"/>
                    <asp:Button ID="btnDeleteTaskLogs" runat="server" Text="Delete" CssClass="btn" 
                        OnClientClick="return confirm('Are you Sure?')" onclick="btnDeleteTaskLogs_Click"/>
                    <asp:Button ID="btnCloseTaskLogs" runat="server" Text="Close" CssClass="btn" onclick="btnCloseTaskLogs_Click"/>
                </li>
                <li>
                    <asp:Label ID="lblPopUpMessage" runat="server"></asp:Label>
                </li>
            </ul>
	    </fieldset>
        </div>
    </div>
    <div id="confirmAnotherTaskPopUp" class="confirmAnotherTaskPopUp" runat="server">
        <div class="popupHeading">
            <div style="float:left;">Repeat Task</div>
        </div>
        <div style="text-align:center;">Do you want to repeat this task?</div>
        <div style="margin-top:10px; text-align:center;">
            <asp:Button ID="btnYesRepeatTask" runat="server" Text="Yes" class="btn" 
                onclick="btnYesRepeatTask_Click"/>
            <asp:Button ID="btnNoRepeatTask" runat="server" Text="No" class="btn" 
                onclick="btnNoRepeatTask_Click"/>
        </div>
    </div>
</asp:Content>

