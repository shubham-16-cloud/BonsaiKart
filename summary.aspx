<%@ Page Title="" Language="C#" MasterPageFile="~/user master page.master" AutoEventWireup="true" CodeFile="summary.aspx.cs" Inherits="summary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .table tr th{
            background-color:#ede7e7b3;
            
            font-size:15px;
            font-weight:bold;
        }
        .lblpaddingsummr4y{
            padding: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class=""  style="border-bottom:4px solid #ede7e7b3">
                    <div class="col-md-10  pull-left">
                        <h1>Thank you For Order</h1>
                    </div>
                    <div class="col-md-2 pull-right">
                        <br />
                        <asp:Button ID="Button1" runat="server" CssClass=" btn btn-success" OnClientClick="window.print()" Text="Print Receipt" />
                    </div>
                    <div class="row container">
                        <div class="col-md-6">
                            
                            <p>Save Enviroment and Buy green and Go green</p>
                        </div>
                        <div class="col-md-6" style="padding-bottom: 14px;line-height: 2;">
                           OrderID :-    <asp:Label ID="lblorderid" runat="server" Text=""></asp:Label><br />
                            OrderDate :- <asp:Label ID="lbldate" runat="server" Text=""></asp:Label><br />
                            Total :-     <asp:Label ID="lblheadtotal" runat="server" Text=""></asp:Label><br />
                        </div>
                    </div>
                </div>
                <div id="SuccessMessage"  class="alert alert-success" style="display:none" >
                <strong>Success!</strong> Your Order Is Confirm.
            </div>
            <div id="ErrorMessage" class="alert alert-danger" style="display:none">
                <strong>Cancal !</strong> Your Order Is Cancaled.
            </div>
                <div id="penddingorder" class="alert alert-info" style="display:none">
                <strong>Pending !</strong> Your Order In Process...
            </div>
                <!-- product viwe-->
                <div class="">
                    <div class="col-md-12 pull-left" style="background-color:white">
                    <h1>Order Summary...</h1>
                        </div>
                    <div style="padding:10px; background-color:black; color:white">SHIPING DETAILS</div>
                <asp:Repeater ID="reproduct" runat="server">
                    <HeaderTemplate>
                    
                        <table class="table table-responsive">
                            <tr>
                                <th>Item</th>
                                <th>Qty</th>
                                <th>Price</th>
                                <th>Total</th>
                                
                            </tr>
                        </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><asp:Label ID="Label" runat="server" Text='<%# Eval("product_name") %>'></asp:Label></td>
                            <td><asp:Label ID="Label4" runat="server" Text='<%# Eval("product_price") %>'></asp:Label></td>
                            <td><asp:Label ID="Label5" runat="server" Text='<%# Eval("product_qty") %>'></asp:Label></td>
                            <td><asp:Label ID="Label6" runat="server" Text='<%# Eval("prodtuct_total") %>'></asp:Label></td>
                        </tr>
                        
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                    <div>
                        <div style="padding:10px;font-size:15px; font-weight:bold; background-color:#ede7e7b3;"">SHIP TO</div>
                        <address style="padding-left: 10px;">
                        <asp:Label ID="lbladdress" runat="server" Text="Label"> </asp:Label>
                            <asp:Label ID="lbldil" runat="server" Text="Label"> </asp:Label>
                            </address>
                    </div>
                    </div>
                <div style="padding:6px; background-color:black; color:white">Payment Details</div>
                <div style="padding:5px; background-color:#ede7e7b3;">
                    <span>Payment Method</span>
                    <span class=" pull-right">Cost Summary</span>
                </div>
                <div class="lblpaddingsummr4y">
                <asp:Label ID="lblpayment" runat="server" Text="" CssClass="" ></asp:Label>
                  <asp:Label ID="lbltotal" runat="server" Text="" CssClass="pull-right "></asp:Label>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

