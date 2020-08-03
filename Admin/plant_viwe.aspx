<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_master page.master" AutoEventWireup="true" CodeFile="plant_viwe.aspx.cs" Inherits="Admin_plant_viwe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        //$(function () {
        //    $('#tblCustomers').footable();
        //});

        $(function () {
            $('[id*=gvplant]').footable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="upplantviwe" runat="server">
        <ContentTemplate>
            <div class="container">
                <h1>Plant List</h1>
                <hr />
                <br />
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                <asp:GridView ID="gvplant" runat="server" AutoGenerateColumns="False" DataKeyNames="plantID" OnRowCommand="gvplant_RowCommand" CssClass="footable">
                    <Columns>


                        <asp:BoundField DataField="plantID" HeaderText="plantID" ReadOnly="True" SortExpression="plantID" />
                        <asp:BoundField DataField="pl_name" HeaderText="name" SortExpression="pl_name" />
                        <asp:BoundField DataField="pl_price" HeaderText="price" SortExpression="pl_price" />
                        <asp:BoundField DataField="pl_qty" HeaderText="qty" SortExpression="pl_qty" />
                        <asp:BoundField DataField="pl_category" HeaderText="category" SortExpression="pl_category" />
                        <asp:BoundField DataField="pl_details" HeaderText="details" SortExpression="pl_details" ItemStyle-Width="11%" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("imgurl")%>' Height="100px" Width="100px" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnedit" runat="server" CssClass="btn btn-success" Text="edit" CommandName="medit" CommandArgument='<%# Bind("plantID") %>' ToolTip="edit Plant" />

                                <asp:Button ID="Btndelete" runat="server" CssClass="btn btn-success" Text="Delete" CommandArgument='<%# Bind("plantID") %>' CommandName="mdelete" OnClientClick="javascript:return confirm('Are you sure you want to delete the record?');" ToolTip="delete emp" />


                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>
                </asp:GridView>
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

