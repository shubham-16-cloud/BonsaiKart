<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_master page.master" AutoEventWireup="true" CodeFile="orderviwe.aspx.cs" Inherits="Admin_orderviwe" %>

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
   <%-- <link rel="stylesheet" href="https://jqueryvalidation.org/files/demo/site-demos.css"/>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
    <script>
        jQuery.validator.setDefaults({
            debug: true,
            success: "valid"
        });
        $("#txtFromDate").validate({
            rules: {
                field: {
                    required: true,
                    date: true
                }
            }
        });
    </script>--%>

   <%-- <script>
        $(document).ready(function () {
            $(function () {
                $('#txtFromDate').datepicker({

                    yearRange: (new Date().getFullYear() - 112).toString() + ':' + (new Date().getFullYear()).toString(),
                    changeYear: true,
                    changeMonth: true,
                    dateFormat: 'dd/mm/yy'

                    
                });
                $("#txtFromDate").on('change', function () {

                    var date = Date.parse($(this).val());

                    if (date > Date.now()) {
                        alert('Please select another date');
                        $(this).val('');
                    }

                });

                $('#txtToDate').datepicker({

                    yearRange: (new Date().getFullYear() - 112).toString() + ':' + (new Date().getFullYear()).toString(),
                    changeYear: true,
                    changeMonth: true,
                    dateFormat: 'dd/mm/yy'
                });

                $("#txtToDate").on('change', function () {

                    var date = Date.parse($(this).val());

                    if (date > Date.now()) {
                        alert('Please select another date');
                        $(this).val('');
                    }

                });
            })


        });
        //function validate() {
        //    if (new Date(document.getElementById('txtFromDate').value) > new Date()) {
        //        alert("You entered future date, that is not valid in From TextBox");
        //        document.getElementById('txtFromDate').value = '';
        //        return false;
        //    }
        //    if (new Date(document.getElementById('txtToDate').value) > new Date()) {
        //        alert("You entered future date, that is not valid in TextBox");
        //        document.getElementById('txtFromDate').value = '';
        //        return false;
        //    }
        //    if (new Date(document.getElementById('txtToDate').value) < new Date(document.getElementById('txtFromDate').value)) {
        //        alert("You entered future date, that is not valid in TextBox111");
        //        document.getElementById('txtFromDate').value = '';
        //        return false;
        //    }
        //}
    </script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <Triggers>
           <asp:AsyncPostBackTrigger ControlID="btngo" EventName="click" />
       </Triggers>
        <ContentTemplate>

          <%--  <div>

                <%-- <table>
                     <tr>
                                <td>
                                        
                                 <asp:ImageButton ID="imgCalender" runat="server" CausesValidation="false" 
                                     ImageUrl="~/images/Calendar.gif" />
                                 <cc1:CalendarExtender ID="ceFromDate" runat="server" Format="dd/MM/yyyy" 
                                     PopupButtonID="imgCalender" TargetControlID="txtFromDate">
                                 </cc1:CalendarExtender>
                                       &nbsp;&nbsp;&nbsp; 
                                         <asp:ImageButton ID="imgCalender1" runat="server" CausesValidation="false" 
                                             ImageUrl="~/images/Calendar.gif" />
                                         <cc1:CalendarExtender ID="ceToDate" runat="server" Format="dd/MM/yyyy" 
                                             PopupButtonID="imgCalender1" TargetControlID="txtToDate">
                                         </cc1:CalendarExtender>
                                  
                                    <asp:ImageButton ID="ibGo" runat="server" ImageUrl="~/images/go.gif" ToolTip="Show Expense Detail" />
                                </td>
                        </tr>
                </table>--%>
                <br />

                

<%--                <div class=" form-inline">
                    <div class=" col-md-3 text-center ">
                           <asp:Label ID="lblname" runat="server" CssClass="form-control1 col-md-2 control-label" Text="From "></asp:Label>
                     <%--    <asp:TextBox ID="txtFromDate" runat="server"    ReadOnly="True"></asp:TextBox>--%>
                    <%--    <asp:TextBox ID="txtFromDate" runat="server"></asp:TextBox>
                         <asp:ImageButton ID="imgCalender1" runat="server" CausesValidation="false" 
                                             ImageUrl="~/images/Calendar.gif" />
                                         <cc1:CalendarExtender ID="ceToDate" runat="server" Format="dd/MM/yyyy" 
                                             PopupButtonID="imgCalender1" TargetControlID="txtFromDate">
                                         </cc1:CalendarExtender>
                    </div>
                    <div  class="col-md-3 text-center">
                          <asp:Label ID="Label2" runat="server" CssClass="form-control1 col-md-2 control-label" Text="To "></asp:Label>
                                       <%--  <asp:TextBox ID="txtToDate" runat="server"  ReadOnly="True"></asp:TextBox>--%>
                         <asp:TextBox ID="txtToDate" runat="server"></asp:TextBox>
                          <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="false" 
                                             ImageUrl="~/images/Calendar.gif" />
                                         <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" 
                                             PopupButtonID="ImageButton2" TargetControlID="txtToDate">
                                         </cc1:CalendarExtender>
                    </div>--%>
                 <%--   <asp:Button ID="btngo" runat="server" CssClass="btn btn-primary" Text="Go" OnClick="Button1_Click"  />--%>
                    <%--<input id="btngo" type="button" class="btn btn-primary" value="Go" onclick="validate()" onserverclick="filllistviw()"  />--%>
                </div>--%>
                <br />
                <br />
                <div>
               <%--     <asp:ListView ID="lvorderviwe" runat="server" DataKeyNames="orderid" GroupItemCount="1" OnItemDataBound="lvorderviwe_ItemDataBound">

                        <AlternatingItemTemplate>

                         
                            <td runat="server">
                                <div style="width: 100%; background-color: #a3f1a5a1">
                                    <table class="table text-capitalize">
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
                                        <td colspan="7" style="width=100% ; border-top :none !important ; " align="center">
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-warning btn-sm" Visible="false">
                                                                <span class="glyphicon glyphicon-ok"></span> Confirm
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-danger btn-sm" Visible="false">
                                                                <span class="glyphicon glyphicon-remove"></span> Cancel
                                            </asp:LinkButton>
                                             <asp:Label ID="lblRowCount" runat="server" ForeColor="#c5f6c6"  Text='<%# Eval("RowId") %>'></asp:Label>
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
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <EmptyItemTemplate>
                            <td runat="server" />
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
                            
                            <td runat="server" style="width: 100% !important">
                                <table class="table  text-capitalize"">
                                    <tr>
                                        <td style="width: 10%">
                                            <asp:Label ID="orderidLabel" runat="server" Text='<%# Eval("orderid") %>' /></td>
                                        <td style="width: 8%">
                                            <asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' /></td>
                                        <td style="width: 15%">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("orderdate") %>' /></td>
                                        <td style="width: 30%">
                                            <asp:Label ID="product_nameLabel" CssClass="nameside" runat="server" Text='<%# Eval("product_name") %>' /></td>
                                        <td style="width: 8%">
                                            <asp:Label ID="product_priceLabel" runat="server" Text='<%# Eval("product_price") %>' /></td>
                                        <td style="width: 8%">
                                            <asp:Label ID="product_qtyLabel" runat="server" Text='<%# Eval("product_qty") %>' /></td>
                                        <td style="width: 8%">
                                            <asp:Label ID="prodtuct_totalLabel" runat="server" Text='<%# Eval("prodtuct_total") %>' /></td>
                               
                                        
                                    </tr>
                                    <tr>
                                        <td colspan="7" style="width=100% ; border-top :none !important ;" align="center">
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-warning btn-sm" Visible="false" >
                                                                <span class="glyphicon glyphicon-ok"></span> Confirm
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-danger btn-sm" Visible="false" >
                                                                <span class="glyphicon glyphicon-remove" ></span> Cancel
                                            </asp:LinkButton>
                                            <asp:Label ID="lblRowCount" runat="server" ForeColor="White"   Text='<%# Eval("RowId") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
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

                    </asp:ListView>--%>

                    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource1"></asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                </div>

            </div>--%>



        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

