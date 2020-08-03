<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_master page.master" AutoEventWireup="true" CodeFile="new_orderview.aspx.cs" Inherits="Admin_new_orderview" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .rbl {
            padding-left: 10px;
        }

        .table {
            margin-bottom: 0px !important;
        }

            .table > tbody > tr > td, .table > tfoot > tr > td {
                padding: 2px !important;
                line-height: 1.528571 !important;
                border-top: 3px solid #ddd !important;
            }

        .nameside {
            text-align: left;
        }

        .ridpadding {
            padding-bottom: 100px !important;
        }

        .form-control1 {
            font-size: 18px;
            padding-top: 4px;
        }
    </style>

    <script src="js/jquery-3.2.1.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="lvorderviwe" EventName="ItemCommand" />
            
        </Triggers>
        <ContentTemplate>
            <br />
             <table>
                     <tr>
                                <td class="form-inline">
                                        
                                  From <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                 <%--<asp:ImageButton ID="imgCalender" runat="server" CausesValidation="false" 
                                     ImageUrl="~/image/tt.gif" />--%>
                                    <asp:LinkButton ID="imgCalender" runat="server" CausesValidation="false" >
                                        <i class=" glyphicon glyphicon-calendar"></i>
                                    </asp:LinkButton>
                                 <cc1:CalendarExtender ID="ceFromDate" runat="server" Format="dd/MM/yyyy" 
                                     PopupButtonID="imgCalender" TargetControlID="txtFromDate">
                                 </cc1:CalendarExtender>
                                       &nbsp;&nbsp;&nbsp;  To
                                         <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                       <%--  <asp:ImageButton ID="imgCalender1" runat="server" CausesValidation="false" 
                                              ImageUrl="~/image/tt.gif" />--%>
                                     <asp:LinkButton ID="imgCalender1" runat="server" CausesValidation="false" >
                                        <i class=" glyphicon glyphicon-calendar"></i>
                                    </asp:LinkButton>
                                         <cc1:CalendarExtender ID="ceToDate" runat="server" Format="dd/MM/yyyy" 
                                             PopupButtonID="imgCalender1" TargetControlID="txtToDate">
                                         </cc1:CalendarExtender>

                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="go" OnClick="Button1_Click" />
                                </td>
                        </tr>
                </table>
        
            <br />
            <asp:UpdateProgress ID="up" runat="server">
                                                                <ProgressTemplate>
                                                                            <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/image/wait.gif"  />
                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>

            <!-- listviwe-->

            <asp:ListView ID="lvorderviwe" runat="server" DataKeyNames="orderid" GroupItemCount="1"   OnItemDataBound="lvorderviwe_ItemDataBound" OnItemCommand="lvorderviwe_ItemCommand"  >

                <AlternatingItemTemplate>


                    <td runat="server">
                        <div style="width: 100%; background-color: #a3f1a5a1">
                            <table class=" table  text-capitalize">
                                <tr>
                                    <td style="width: 10%">
                                        <asp:Label ID="orderidLabel" runat="server" CssClass=" text-center" Text='<%# Eval("orderid") %>' /></td>
                                    <td style="width: 8%">
                                        <asp:Label ID="useridLabel" runat="server" CssClass=" text-center" Text='<%# Eval("userid") %>' /></td>
                                    <td style="width: 15%">
                                        <asp:Label ID="Label1" runat="server" CssClass=" text-center" Text='<%# Eval("orderdate") %>' /></td>
                                    <td style="width: 30%">
                                        <asp:Label ID="product_nameLabel" CssClass="nameside" runat="server" Text='<%# Eval("product_name") %>' /></td>
                                    <td style="width: 8%">
                                        <asp:Label ID="product_priceLabel" CssClass=" text-center" runat="server" Text='<%# Eval("product_price") %>' /></td>
                                    <td style="width: 8%">
                                        <asp:Label ID="product_qtyLabel" CssClass=" text-center" runat="server" Text='<%# Eval("product_qty") %>' /></td>
                                    <td style="width: 8%">
                                        <asp:Label ID="prodtuct_totalLabel" CssClass=" text-center" runat="server" Text='<%# Eval("prodtuct_total") %>' /></td>
                                  
                                </tr>
                                <tr>
                                    <td colspan="7" style="width=100%; border-top: none !important;" align="center">
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-warning btn-sm" OnClientClick="returen true;" CommandName="mconfirm" CommandArgument='<%# Eval("orderid12") %>' Visible="false">
                                                                <span class="glyphicon glyphicon-ok"></span> Confirm
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-danger btn-sm" CommandName="mdelete" CommandArgument='<%# Eval("orderid12") %>' Visible="false">
                                                                <span class="glyphicon glyphicon-remove"></span> Cancel
                                        </asp:LinkButton>
                                        <asp:Label ID="lblRowCount" runat="server" ForeColor="#c5f6c6" Text='<%# Eval("RowId") %>'></asp:Label>
                                          
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>

                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="">orderid:
                            <asp:Label ID="orderidLabel1" runat="server" Text='<%# Eval("orderid") %>' />
                        <br />
                        userid:
                            <asp:TextBox ID="useridTextBox" runat="server" Text='<%# Bind("userid") %>' />
                        <br />
                        product_name:
                            <asp:TextBox ID="product_nameTextBox" runat="server" Text='<%# Bind("product_name") %>' />
                        <br />
                        product_price:
                            <asp:TextBox ID="product_priceTextBox" runat="server" Text='<%# Bind("product_price") %>' />
                        <br />
                        product_qty:
                            <asp:TextBox ID="product_qtyTextBox" runat="server" Text='<%# Bind("product_qty") %>' />
                        <br />
                        prodtuct_total:
                            <asp:TextBox ID="prodtuct_totalTextBox" runat="server" Text='<%# Bind("prodtuct_total") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        <br />
                    </td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>                           <div class="alert alert-info">
                               NO Order Placed
                           </div>
                                </td>

                        </tr>
                    </table>
                   <%-- <div class=" alert alert-info">
                        No Order Placed
                    </div>--%>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td runat="server">
                    noo    
                    </td>
                   
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">orderid:
                            <asp:TextBox ID="orderidTextBox" runat="server" Text='<%# Bind("orderid") %>' />
                        <br />
                        userid:
                            <asp:TextBox ID="useridTextBox" runat="server" Text='<%# Bind("userid") %>' />
                        <br />
                        product_name:
                            <asp:TextBox ID="product_nameTextBox" runat="server" Text='<%# Bind("product_name") %>' />
                        <br />
                        product_price:
                            <asp:TextBox ID="product_priceTextBox" runat="server" Text='<%# Bind("product_price") %>' />
                        <br />
                        product_qty:
                            <asp:TextBox ID="product_qtyTextBox" runat="server" Text='<%# Bind("product_qty") %>' />
                        <br />
                        prodtuct_total:
                            <asp:TextBox ID="prodtuct_totalTextBox" runat="server" Text='<%# Bind("prodtuct_total") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        <br />
                    </td>
                </InsertItemTemplate>

                <ItemTemplate>

                    <td runat="server">
                        <div style="width: 100%;">
                            <table class="table  text-capitalize">
                                <tr>
                                    <td style="width: 10%">
                                        <asp:Label ID="orderidLabel" runat="server" CssClass=" text-center" Text='<%# Eval("orderid") %>' /></td>
                                    <td style="width: 8%">
                                        <asp:Label ID="useridLabel" runat="server" CssClass=" text-center" Text='<%# Eval("userid") %>' /></td>
                                    <td style="width: 15%">
                                        <asp:Label ID="Label1" runat="server" CssClass=" text-center" Text='<%# Eval("orderdate") %>' /></td>
                                    <td style="width: 30%">
                                        <asp:Label ID="product_nameLabel" CssClass="nameside" runat="server" Text='<%# Eval("product_name") %>' /></td>
                                    <td style="width: 8%">
                                        <asp:Label ID="product_priceLabel" CssClass=" text-center" runat="server" Text='<%# Eval("product_price") %>' /></td>
                                    <td style="width: 8%">
                                        <asp:Label ID="product_qtyLabel" CssClass=" text-center" runat="server" Text='<%# Eval("product_qty") %>' /></td>
                                    <td style="width: 8%">
                                        <asp:Label ID="prodtuct_totalLabel" CssClass=" text-center" runat="server" Text='<%# Eval("prodtuct_total") %>' />
                                       <%-- <asp:HiddenField ID="HiddenField1" runat="server" Value ='<%# Eval("orderid1") %>'  />--%>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="7" style="width=100%; border-top: none !important;" align="center">
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-warning btn-sm" CommandName="mconfirm" CommandArgument='<%# Eval("orderid12") %>' Visible="false">
                                                                <span class="glyphicon glyphicon-ok"></span> Confirm
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-danger btn-sm" CommandName="mdelete" CommandArgument='<%# Eval("orderid12") %>' Visible="false">
                                                                <span class="glyphicon glyphicon-remove"></span> Cancel
                                        </asp:LinkButton>
                                        <asp:Label ID="lblRowCount" runat="server" ForeColor="White" Text='<%# Eval("RowId") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" style="width: 100% !important">
                        <tr runat="server">
                            <td runat="server" style="width: 100% !important">
                                <table id="groupPlaceholderContainer" runat="server" border="0" style="width: 100% !important">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>

                <SelectedItemTemplate>
                    <td runat="server" style="">orderid:
                            <asp:Label ID="orderidLabel" runat="server" Text='<%# Eval("orderid") %>' />
                        <br />
                        userid:
                            <asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' />
                        <br />
                        product_name:
                            <asp:Label ID="product_nameLabel" runat="server" Text='<%# Eval("product_name") %>' />
                        <br />
                        product_price:
                            <asp:Label ID="product_priceLabel" runat="server" Text='<%# Eval("product_price") %>' />
                        <br />
                        product_qty:
                            <asp:Label ID="product_qtyLabel" runat="server" Text='<%# Eval("product_qty") %>' />
                        <br />
                        prodtuct_total:
                            <asp:Label ID="prodtuct_totalLabel" runat="server" Text='<%# Eval("prodtuct_total") %>' />
                        <br />
                    </td>
                </SelectedItemTemplate>

            </asp:ListView>

            <!-- data page-->
            <div class="modal fade" id="mymodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <span class="modal-title" id="exampleModalLongTitle">Modal title</span>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <h1> Are you Sure Confirm the Order</h1>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <asp:Button ID="btnsave" runat="server" OnClientClick="returen ture;"  Text="OK" CssClass="btn btn-info" />
                            </div>
                        </div>
                    </div>
                </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

