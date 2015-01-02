<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="tasklogdetails.aspx.cs" Inherits="tasklogdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/javascript">
    $(document).ready(function () {
        $("#<%=txtDateCompleted.ClientID%>").datepicker();
        $("#<%=txtTemperature.ClientID%>").autocomplete({
            delay: 0,
            source: "api/getTemperatures.ashx"
        });
        $("#<%=txtTemperature.ClientID%>").Watermark("Type Temperature/Task");
        
        $("#<%=txtAction.ClientID%>").autocomplete({
            delay: 0,
            source: "api/GetCorrectiveAction.ashx"
        });
        $("#<%=txtAction.ClientID%>").Watermark("Type Corrective Action");

        $("#<%=txtStatus.ClientID%>").autocomplete({
            delay: 0,
            source: "api/GetTaskLogStatus.ashx"
        });
        $("#<%=txtStatus.ClientID%>").Watermark("Type status or comments");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="InterierTitle">Task Log Details</div>
<div class="patientInfo">
    <div class="wizard">
        <fieldset>
        <%--<legend>Task Log Details</legend>--%>
            <ul>
                <li>
                    <asp:Label ID="lblEquipmentTitle" runat="server" Text="Equipment" Width="160px"></asp:Label>
                    <asp:Label ID="lblEquipment" runat="server" Text=""></asp:Label>
                </li>
                <li>
                    <asp:Label ID="lblTaskTitle" runat="server" Text="Task" Width="160px"></asp:Label>
                    <asp:Label ID="lblTask" runat="server" Text=""></asp:Label>
                </li>
                <li>
                    <asp:Label ID="lblDateTitle" runat="server" Text="Date" Width="160px"></asp:Label>
                    <asp:TextBox ID="txtDateCompleted" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                     ForeColor="Red" ControlToValidate="txtDateCompleted" ValidationGroup="t"></asp:RequiredFieldValidator>
                </li>
                <li>
                    <asp:Label ID="lblTempTitle" runat="server" Text="Temperature (°C)/Task" Width="160px"></asp:Label>
                    <%--<asp:DropDownList ID="ddlTemp" runat="server" AppendDataBoundItems="True">
                    <asp:ListItem>NA</asp:ListItem>
                    </asp:DropDownList>--%>
                    <asp:TextBox ID="txtTemperature" runat="server"></asp:TextBox>
                </li>
                <li>
                    <asp:Label ID="lblActionTitle" runat="server" Text="Corrective Action" Width="160px"></asp:Label>
                    <%--<asp:DropDownList ID="ddlAction" runat="server" Width="200px">
                    </asp:DropDownList>--%>
                    <asp:TextBox ID="txtAction" runat="server"></asp:TextBox>
                </li>
                <li>
                    <asp:Label ID="lblStatus" runat="server" Text="Status/Comments" Width="160px"></asp:Label>
                    <asp:TextBox ID="txtStatus" runat="server" Rows="5" TextMode="MultiLine" Width="326px"></asp:TextBox>
                    <%--<asp:DropDownList ID="ddlStatus" runat="server">
                    <asp:ListItem>Complete</asp:ListItem>
                    <asp:ListItem>Pending</asp:ListItem>
                    </asp:DropDownList>--%>
                </li>
                <%--<li>
                    <label>Completed By</label>
                    <asp:DropDownList ID="ddlCompletedBy" runat="server">
                    </asp:DropDownList>
                </li>--%>
                <li>
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                </li>
                <li><label></label><asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn"
                        onclick="Button1_Click" ValidationGroup="t" />
                    <asp:Button ID="Button2" runat="server" Text="New" CssClass="btn" 
                        onclick="Button2_Click" />
                    <asp:Button ID="btnReports" runat="server" Text="Reports" CssClass="btn"
                            onclick="btnReports_Click" />
                </li>
                <li>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                         DataKeyNames="ID" AllowPaging="True" AllowSorting="True" 
                        CssClass="data-table" GridLines="None" 
                        onpageindexchanging="GridView1_PageIndexChanging" onsorting="GridView1_Sorting">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="DueDate" HeaderText="Date" DataFormatString="{0:d}" 
                                HtmlEncode="False" SortExpression="DueDate"/>
                            <asp:BoundField DataField="Degree" HeaderText="Temperature (°C)/Task" 
                                SortExpression="Degree" />
                            <asp:BoundField DataField="ActionTaken" HeaderText="Corrective Action" 
                                SortExpression="ActionTaken" />
                            <asp:BoundField DataField="Status" HeaderText="Status" 
                                SortExpression="Status" />
                            <asp:BoundField DataField="UserID" HeaderText="Completed By" 
                                SortExpression="UserID" />
                        </Columns>
                    </asp:GridView>
                </li>
            </ul>
        <asp:HiddenField ID="SiteID" runat="server" />
        <asp:HiddenField ID="TaskID" runat="server" />
        <asp:HiddenField ID="TaskLogDetailID" runat="server" />
        </fieldset>
    </div>
</div>
</asp:Content>

