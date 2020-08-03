<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_master page.master" AutoEventWireup="true" CodeFile="pot_viwe.aspx.cs" Inherits="Admin_pot_viwe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
      <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">

        $(function () {
            $('[id*=gvpots]').footable();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="uppots" runat="server">
        <ContentTemplate>
            <div class=" container">
                <h2>Pots Viwe</h2>
                <hr />
                <br />

                <asp:GridView ID="gvpots" runat="server" AutoGenerateColumns="False" OnRowCommand="gvpots_RowCommand" DataKeyNames="potID" CssClass="footable" >

                    <Columns>
                        <asp:BoundField DataField="potID" HeaderText="ID" ReadOnly="True" SortExpression="potID" ItemStyle-Width="11%" />
                        <asp:BoundField DataField="po_name" HeaderText="Name" SortExpression="po_name" ItemStyle-Width="11%" />
                        <asp:BoundField DataField="po_price" HeaderText="Price" SortExpression="po_price" ItemStyle-Width="5%" />
                        <asp:BoundField DataField="po_qty" HeaderText="Qty" SortExpression="po_qty" ItemStyle-Width="5%" />
                        <asp:BoundField DataField="po_dimension" HeaderText="Dimension" SortExpression="po_dimension" ItemStyle-Width="11%" />
                        <asp:BoundField DataField="po_category" HeaderText="Category" SortExpression="po_category" ItemStyle-Width="11%" />
                        <asp:BoundField DataField="po_description" HeaderText="Description" SortExpression="po_description" ItemStyle-Width="11%" />
                         <asp:TemplateField ItemStyle-Width="11%">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("po_imgURL")%>' Height="100px" Width="100px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField  ItemStyle-Width="15%" >
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" Text="Edit" CssClass="btn btn-success" CommandName="medit" CommandArgument='<%# Bind("potID") %>' ToolTip="Edit"/>
                           <asp:Button ID="Button2" runat="server" Text="Delete" CssClass="btn btn-success" CommandArgument='<%# Bind("potID") %>' CommandName="mdelete" OnClientClick="javascript:return confirm('Are you sure you want to delete the record?');" ToolTip="delete POT" />
                         
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                         
                   
                   
                    </Columns>

                </asp:GridView>
                <br />
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

