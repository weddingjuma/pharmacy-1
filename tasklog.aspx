<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="tasklog.aspx.cs" Inherits="tasklog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script type="text/javascript">
    $(document).ready(function () {
        $("#<%=txtEquipment.ClientID%>").autocomplete({
            delay: 0,
            source: "api/GetEquipment.ashx"
        });
        $("#<%=txtEquipment.ClientID%>").Watermark("Type Equipment");
        $("#<%=txtTask.ClientID%>").autocomplete({
            delay: 0,
            source: "api/GetTasks.ashx"
        });
        $("#<%=txtTask.ClientID%>").Watermark("Type Task");
        $(".getEquipment").autocomplete({
            delay: 0,
            source: "api/GetEquipment.ashx"
        });
        $(".getTask").autocomplete({
            delay: 0,
            source: "api/GetTasks.ashx"
        });
    });

    function ValidateForm() {

        if ($('#<%=txtEquipment.ClientID %>').val() == "" || $('#<%=txtEquipment.ClientID %>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Equipment');
            return false;
        }
        if ($('#<%=txtTask.ClientID %>').val() == "" || $('#<%=txtTask.ClientID %>').val() == null) {
            $('#<%=lblError.ClientID %>').text('Please Enter Task');
            return false;
        }

        return true;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="InterierTitle">Task Log</div>
    <div class="patientInfo">
        <div class="wizard">
            <fieldset >
                <%--<legend>Task Log</legend>--%>
                <ul>
                    <li><label runat="server" id="lblEquipment">Equipment</label><asp:TextBox ID="txtEquipment" runat="server"></asp:TextBox></li>
                    <li><label runat="server" id="lblTask">Task</label><asp:TextBox ID="txtTask" runat="server"></asp:TextBox></li>
                    <li>
                        <asp:Label ID="lblError" runat="server" Text="" CssClass="error"></asp:Label></li>
                    <li>
                        <label>
                            <asp:Label ID="lblSite" runat="server" Text="Site Name"></asp:Label>
                        </label>
                        <asp:DropDownList ID="SiteID" runat="server">
                        </asp:DropDownList>
                        <asp:Label ID="lblSiteName" runat="server"></asp:Label>
                    </li>
                    <li><label></label>
                        <asp:Button ID="cmdSave" runat="server" Text="Save" onclick="cmdSave_Click" CssClass="btn" />
                        <asp:Button ID="btnReports" runat="server" Text="Reports" CssClass="btn"
                            onclick="btnReports_Click" />
                    </li>
                    <li>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TaskID" 
                            DataSourceID="SqlDataSource2" 
                            onselectedindexchanged="GridView1_SelectedIndexChanged" GridLines="None" 
                            onrowdatabound="GridView1_RowDataBound" CssClass="data-table" >
                            <EmptyDataTemplate>No task Logs</EmptyDataTemplate>
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkSelect" runat="server" CausesValidation="False" 
                                        CommandName="Select" Text="Select"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Equipment" SortExpression="Equipment">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Equipment") %>' CssClass="getEquipment"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Equipment") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Task" SortExpression="Task">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Task") %>' CssClass="getTask"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Task") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                        CommandName="Update" Text="Update"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" 
                                        CommandName="Edit" Text="Edit"></asp:LinkButton>&nbsp;
                                    &nbsp;<asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" 
                                        CommandName="Delete" Text="Delete" OnClientClick="return(confirm('Are you sure?'))"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
            
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            DeleteCommand="DELETE FROM [TaskLog] WHERE [TaskID] = @TaskID" 
                            InsertCommand="INSERT INTO [TaskLog] ([SiteID], [EquipmentID], [Task]) VALUES (@SiteID, @EquipmentID, @Task)" 
                            SelectCommand="SELECT * FROM [TaskLog] WHERE ([SiteID] = @SiteID)" 
                            UpdateCommand="UPDATE [TaskLog] SET [Equipment] = @Equipment, [Task] = @Task WHERE [TaskID] = @TaskID">
                            <DeleteParameters>
                                <asp:Parameter Name="TaskID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="SiteID" Type="Int32" />
                                <asp:Parameter Name="EquipmentID" Type="Int32" />
                                <asp:Parameter Name="Task" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="SiteID" Name="SiteID" PropertyName="SelectedValue" 
                                    Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="SiteID" Type="Int32" />
                                <asp:Parameter Name="EquipmentID" Type="Int32" />
                                <asp:Parameter Name="Task" Type="String" />
                                <asp:Parameter Name="TaskID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
            
                    </li>
                </ul>
                <asp:HiddenField ID="TaskID" runat="server" />
            </fieldset>
        </div>
    </div>
</asp:Content>

