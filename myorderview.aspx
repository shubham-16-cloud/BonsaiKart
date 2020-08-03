<%@ Page Title="" Language="C#" MasterPageFile="~/user master page.master" AutoEventWireup="true" CodeFile="myorderview.aspx.cs" Inherits="myorderview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .any {
            text-decoration: none;
        }
        .br{
            border: 10px groove #7af47e;
        }
    </style>

    <script>
        function toggleIcon(e) {
            $(e.target)
                .prev('.panel-heading')
                .find(".more-less")
                .toggleClass('glyphicon-plus glyphicon-minus');
        }
        $('.panel-group').on('hidden.bs.collapse', toggleIcon);
        $('.panel-group').on('shown.bs.collapse', toggleIcon);
    
       
        </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <asp:Table ID="tsorder" runat="server" CssClass="table table-hover table-responsive">
                </asp:Table>
                <asp:ListView ID="lvviweorder" runat="server" DataKeyNames="orderID" OnItemDataBound="lvviweorder_ItemDataBound">

                    <AlternatingItemTemplate>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle" role="button" onclick="toggleIcon(i)" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        <i class="more-less glyphicon glyphicon-plus"></i>
                                        <asp:Label ID="lblorderid" runat="server" CssClass="any" Text='<%# Eval("orderID") %>' />
                                        <asp:Label ID="lbldate" runat="server" CssClass="pull-right" Text='<%# Eval("orderdate") %>' />

                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body br">
                                    <asp:Repeater ID="reiteam" runat="server">
                                        <HeaderTemplate>
                                            <table id="tab1" class="table table-responsive table-hover  container">
                                                <tr>
                                                    <th>Image</th>
                                                    <th>Name</th>
                                                    <th>Qty</th>
                                                    <th>Price</th>
                                                    <th>Total</th>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            
                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("product_ID" , "productdetail_page.aspx?product_ID={0}") %>'>
                                            <tr>
                                                 
                                                <td>
                                                    
                                                    <asp:Image ID="lblpoducturl" runat="server" ImageUrl='<%# Eval("product_image_url") %>' Width="110px" Height="80px" /></td>
                                                <td>
                                                    <asp:Label ID="lblproductname" runat="server" Text='<%# Eval("product_name") %>' /></td>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("product_qty") %>' /></td>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("product_price") %>' /></td>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("prodtuct_total") %>' /></td>
                                                
                                            </tr>
                                                    </asp:HyperLink>
                                            
                                            <div>
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                        
                                    </asp:Repeater>

                                </div>
                            </div>
                        </div>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <li style="background-color: #FFCC66; color: #000080;">orderID:
                            <asp:Label ID="orderIDLabel1" runat="server" Text='<%# Eval("orderID") %>' />
                            <br />
                            userID:
                            <asp:TextBox ID="userIDTextBox" runat="server" Text='<%# Bind("userID") %>' />
                            <br />
                            orderdate:
                            <asp:TextBox ID="orderdateTextBox" runat="server" Text='<%# Bind("orderdate") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </li>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <div>
                                       <img alt="" src="image/empty_cart_800x600_dribbble_teaser.png" class="img-responsive" style="margin: auto; height: 200px;" />
                                       <h2 class="text-center">No Order</h2>
                                       <p class="text-center"><a class="btn btn-primary" href="userpage_main1.aspx">Continue Shoping</a></p>
                                       
                                   </div>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <li style="">orderID:
                            <asp:TextBox ID="orderIDTextBox" runat="server" Text='<%# Bind("orderID") %>' />
                            <br />
                            userID:
                            <asp:TextBox ID="userIDTextBox" runat="server" Text='<%# Bind("userID") %>' />
                            <br />
                            orderdate:
                            <asp:TextBox ID="orderdateTextBox" runat="server" Text='<%# Bind("orderdate") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </li>
                    </InsertItemTemplate>
                    <ItemSeparatorTemplate>
                        <br />
                    </ItemSeparatorTemplate>
                    <ItemTemplate>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle" role="button" onclick="toggleIcon(i)" data-toggle="collapse" data-parent="#accordion" href="#collapsetwo" aria-expanded="true" aria-controls="collapseOne">
                                        <i class="more-less glyphicon glyphicon-plus"></i>
                                        <asp:Label ID="lblorderid" runat="server" CssClass="any" Text='<%# Eval("orderID") %>' />
                                        <asp:Label ID="lbldate" runat="server" CssClass="pull-right" Text='<%# Eval("orderdate") %>' />

                                    </a>
                                </h4>
                            </div>
                            <div id="collapsetwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body br">
                                    <asp:Repeater ID="reiteam" runat="server">
                                        <HeaderTemplate>
                                            <table id="tab1" class="table table-responsive table-hover  container">
                                                <tr>
                                                    <th>Image</th>
                                                    <th>Name</th>
                                                    <th>Qty</th>
                                                    <th>Price</th>
                                                    <th>Total</th>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <asp:Image ID="lblpoducturl" runat="server" ImageUrl='<%# Eval("product_image_url") %>' Width="110px" Height="80px" /></td>
                                                <td>
                                                    <asp:Label ID="lblproductname" runat="server" Text='<%# Eval("product_name") %>' /></td>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("product_qty") %>' /></td>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("product_price") %>' /></td>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("prodtuct_total") %>' /></td>
                                            </tr>
                                            
                                            <div>
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                        
                                    </asp:Repeater>

                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <li runat="server" id="itemPlaceholder" />
                        </ul>
                        <div style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;">
                        </div>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <li style="background-color: #FFCC66; font-weight: bold; color: #000080;">orderID:
                            <asp:Label ID="orderIDLabel" runat="server" Text='<%# Eval("orderID") %>' />
                            <br />
                            userID:
                            <asp:Label ID="userIDLabel" runat="server" Text='<%# Eval("userID") %>' />
                            <br />
                            orderdate:
                            <asp:Label ID="orderdateLabel" runat="server" Text='<%# Eval("orderdate") %>' />
                            <br />
                        </li>
                    </SelectedItemTemplate>

                </asp:ListView>
                <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-V9H672B\SQLEXPRESS2018;Initial Catalog=Bonsai_database;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT orderID, userID, orderdate FROM order_master"></asp:SqlDataSource>--%>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

