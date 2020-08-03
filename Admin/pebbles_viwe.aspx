<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_master page.master" AutoEventWireup="true" CodeFile="pebbles_viwe.aspx.cs" Inherits="Admin_pebbles_viwe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        

        $(function () {
            $('[id*=gvpebbles]').footable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <h1>Viwe Pebbles</h1>
                <hr />
                <br />
                <asp:Label ID="lblbmsg" runat="server"></asp:Label>
                <asp:GridView ID="gvpebbles" runat="server" AutoGenerateColumns="False" OnRowCommand="gvpebbles_RowCommand" DataKeyNames="pe_ID" CssClass="footable">
                    <Columns>
                        <asp:BoundField DataField="pe_ID" HeaderText="ID" ReadOnly="True" SortExpression="pe_ID" />
                        <asp:BoundField DataField="pe_name" HeaderText="Name" SortExpression="pe_name" />
                        <asp:BoundField DataField="pe_price" HeaderText="Price" SortExpression="pe_price" />
                        <asp:BoundField DataField="pe_qty" HeaderText="Qty" SortExpression="pe_qty" />
                        <asp:BoundField DataField="pe_Weight" HeaderText="Weight" SortExpression="pe_Weight" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("img_url")%>' Height="100px" Width="100px" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnedit" runat="server" CssClass="btn btn-success" Text="edit" CommandName="medit" CommandArgument='<%# Bind("pe_ID") %>' ToolTip="edit" />

                                <asp:Button ID="Btndelete" runat="server" CssClass="btn btn-success" Text="Delete" CommandArgument='<%# Bind("pe_ID") %>' CommandName="mdelete" OnClientClick="javascript:return confirm('Are you sure you want to delete the record?');" ToolTip="delete " />


                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

