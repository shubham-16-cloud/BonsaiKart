<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_master page.master" AutoEventWireup="true" CodeFile="edit_discount.aspx.cs" Inherits="Admin_edit_discount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
        .dropdown-header {  
            width: 40%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <h2>Edit Discount</h2>
                <hr />
                <br />
                <div class="form-horizontal">
                    <div class=" form-group">
                        <span class="col-md-2 control-label">Select Product :-</span>
                        <div class="col-md-5">
                            <asp:DropDownList ID="ddliteamtype" runat="server" CssClass="dropdown dropdown-header  form-control">
                                <asp:ListItem Value="PL">Plant</asp:ListItem>
                                <asp:ListItem Value="SE">Seed</asp:ListItem>
                                <asp:ListItem Value="PO">Pot</asp:ListItem>
                                <asp:ListItem Value="PE">Pebbles</asp:ListItem>
                                <asp:ListItem Value="FE">Fertilizer</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                        </div>

                    </div>

                    <div class=" form-group">
                        <span class="col-md-2 control-label">Discount Rate :-</span>
                        <div class="col-md-5">
                            <asp:TextBox ID="txtdrate" runat="server" PlaceHolder="Add Discount Rate in percentage" CssClass="form-control" required> </asp:TextBox>
                            <span style="font-size:10px; color:gray;">(Plese do bot write "%" in Rate)</span>
                            <br />
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtdrate" ValidChars="0123456789"></cc1:FilteredTextBoxExtender>
                            <br />
                        </div>

                    </div>

                    <div class=" form-group">
                        <span class="col-md-2 control-label">Discount Price Range :-</span>
                        <div class="col-md-5">
                           <asp:TextBox ID="txtdprice" runat="server" PlaceHolder="Add Discount price Range in price" CssClass="form-control" required> </asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtdprice" ValidChars="0123456789"></cc1:FilteredTextBoxExtender>
                            <br />
                        </div>
                    </div>

                           <div class=" form-group">
                        <span class="col-md-2 control-label">Discount Date:-</span>
                        <div class="col-md-5 form-inline">
                            <i class="control-label">From</i>
                           <asp:TextBox ID="txtfromdate" runat="server" PlaceHolder="from Date" CssClass="form-control" required> </asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtfromdate" Format="MM/dd/yyyy" PopupPosition="TopRight"  PopupButtonID="txtfromdate"></cc1:CalendarExtender>
                            <i class="control-label">To</i>
                            <asp:TextBox ID="txttodate" runat="server" PlaceHolder="To Date" CssClass="form-control" required> </asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txttodate" Format="MM/dd/yyyy" PopupButtonID="txttodate" PopupPosition="TopRight" ></cc1:CalendarExtender>
                            <br />
                        </div>
                    </div>

                    <div class=" form-group">
                        <span class="col-md-2 control-label"></span>
                        <div class="col-md-5">
                            <br />
                            <asp:Button ID="bteditdiscount" runat="server" Text="Update" OnClick="bteditdiscount_Click"  CssClass="btn btn-primary btn-md" />
                            <br />
                            <br />
                        </div>
                    </div>

                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

