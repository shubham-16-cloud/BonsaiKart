<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_master page.master" AutoEventWireup="true" CodeFile="addvetisementconfirm.aspx.cs" Inherits="Admin_addvetisementconfirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
       
        $(function () {
            $('[id*=gvdiscount]').footable();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class=" container">
                <h1>Viwe Advetisement</h1>
                <hr />
                <br />
                <asp:Label ID="lblmsg" runat="server"></asp:Label>

                <!-- Gridviwe of discount-->
                <asp:GridView ID="gvdiscount" runat="server" CssClass="footable" OnRowCommand="gvdiscount_RowCommand" AutoGenerateColumns="False" DataKeyNames="id">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" Visible="false" SortExpression="id" />
                        <asp:BoundField DataField="userid" HeaderText="UserID" ReadOnly="True" Visible="false" SortExpression="userid" />
                        <asp:BoundField DataField="Ad_title" HeaderText="TItle" SortExpression="Ad_title" ItemStyle-Width="12%" />
                        <asp:BoundField DataField="Ad_details" HeaderText="Details" SortExpression="Ad_details" ItemStyle-Width="14%" />
                        <asp:BoundField DataField="Ad_link" HeaderText="URL" SortExpression="Ad_link"  ItemStyle-Width="14%"/>
                        <asp:BoundField DataField="date_from" HeaderText="From" SortExpression="date_from"  ItemStyle-Width="12%"/>
                        <asp:BoundField DataField="date_to" HeaderText="To" SortExpression="date_to" ItemStyle-Width="12%" />
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Ad_imgurl")%>' Height="100px" Width="100px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Command">
                            <ItemTemplate>
                                <asp:Button ID="btnedit" runat="server" CssClass="btn btn-success" Text="Confirm" CommandName="medit" CommandArgument='<%# Bind("id") %>' ToolTip="edit" />

                                <asp:Button ID="Btndelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandArgument='<%# Bind("id") %>' CommandName="mdelete" OnClientClick="javascript:return confirm('Are you sure you want to delete the record?');" ToolTip="delete " />

                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

