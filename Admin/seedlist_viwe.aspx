<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_master page.master" AutoEventWireup="true" CodeFile="seedlist_viwe.aspx.cs" Inherits="Admin_seedlist_viwe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
<script type="text/javascript">
    //$(function () {
    //    $('#tblCustomers').footable();
    //});

    $(function () {
        $('[id*=gvseed]').footable();
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="upseedviwe" runat="server">
        <ContentTemplate>
            <div class="container">
                <h2>Seed Viwe</h2>
                <hr />
                <br />
                <asp:GridView ID="gvseed" runat="server" AutoGenerateColumns="False" CssClass="footable" OnRowCommand="gvseed_RowCommand" DataKeyNames="seedID" >
                    <Columns>
                        <asp:BoundField DataField="seedID" HeaderText="ID" ReadOnly="True" SortExpression="seedID" />
                        <asp:BoundField DataField="se_name" HeaderText="Name" SortExpression="se_name" />
                       <%-- <asp:BoundField DataField="se_common_name" HeaderText="common Name" SortExpression="se_common_name" />--%>
                        <asp:BoundField DataField="se_price" HeaderText="Price" SortExpression="se_price" />
                        <asp:BoundField DataField="se_qty" HeaderText="Qty" SortExpression="se_qty" />
                        <asp:BoundField DataField="se_category" HeaderText="Category" SortExpression="se_category" />
                        <asp:BoundField DataField="se_height" HeaderText="Height" SortExpression="se_height" />
                        <asp:BoundField DataField="se_diffculty" HeaderText="Diffculty" SortExpression="se_diffculty" />
                        <asp:TemplateField>
                        <ItemTemplate>
                            
                            <asp:Image  ID="Image1" runat="server" ImageUrl='<%#Eval("se_imgURL")%>' Height="100px" Width="100px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" Text="Edit" CssClass="btn btn-success" CommandName="medit" CommandArgument='<%# Bind("seedID") %>' ToolTip="Edit"/>
                            <asp:Button ID="Button2" runat="server" Text="Delete" CssClass="btn btn-success" CommandArgument='<%# Bind("seedID") %>' CommandName="mdelete" OnClientClick="javascript:return confirm('Are you sure you want to delete the record?');" ToolTip="delete POT"/>
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                   
                    </Columns>
                </asp:GridView>
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

