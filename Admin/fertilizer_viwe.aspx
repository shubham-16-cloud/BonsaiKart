<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_master page.master" AutoEventWireup="true" CodeFile="fertilizer_viwe.aspx.cs" Inherits="Admin_fertilizer_viwe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

      <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
       
        $(function () {
            $('[id*=gvfertilizer]').footable();
        });
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <h1>Viwe Fertilizers</h1>
                <hr />
                <br />
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
                <asp:GridView ID="gvfertilizer" runat="server" CssClass="footable" OnRowCommand="gvfertilizer_RowCommand" AutoGenerateColumns="False" DataKeyNames="fe_ID">
                    <Columns>
                        <asp:BoundField DataField="fe_ID" HeaderText="ID" ReadOnly="True" SortExpression="fe_ID" />
                        <asp:BoundField DataField="fe_name" HeaderText="Name" SortExpression="fe_name" />
                        <asp:BoundField DataField="fe_qty" HeaderText="Qty" SortExpression="fe_qty" />
                        <asp:BoundField DataField="fe_price" HeaderText="Price" SortExpression="fe_price" />
                        <asp:BoundField DataField="fe_weight" HeaderText="Weight" SortExpression="fe_weight" />
                        <asp:BoundField DataField="fe_containt" HeaderText="Containt" SortExpression="fe_containt" />
                        
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("img_url")%>' Height="100px" Width="100px" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnedit" runat="server" CssClass="btn btn-success" Text="edit" CommandName="medit" CommandArgument='<%# Bind("fe_ID") %>' ToolTip="edit" />

                                <asp:Button ID="Btndelete" runat="server" CssClass="btn btn-success" Text="Delete" CommandArgument='<%# Bind("fe_ID") %>' CommandName="mdelete" OnClientClick="javascript:return confirm('Are you sure you want to delete the record?');" ToolTip="delete " />


                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
                <br />
            </div>
        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>

