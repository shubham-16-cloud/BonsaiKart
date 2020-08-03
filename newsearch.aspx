<%@ Page Title="" Language="C#" MasterPageFile="~/user master page.master" AutoEventWireup="true" CodeFile="newsearch.aspx.cs" Inherits="newsearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .fontstyle {
            text-decoration: line-through;
        }

        .ratefont {
            font-size: 20px;
        }

        .rate {
            padding: 2px 10px 2px 10px;
            border: 1px solid red;
            background-color: green;
            color: white;
            font-size: 10px;
            margin-left: 5px;
        }

        .stock {
            position: absolute;
            top: 38%;
            left: 18px;
            right: 18px;
            display: block;
            background-color: #80808075;
            color: yellow;
            font-size: 20px;
            font-weight: bold;
            padding: 5px 5px 5px 5px;
        }

        #loginuser > li > a {
            padding-top: 0px !important;
            padding-bottom: 0px !important;
        }

        .row {
            margin-right: 0px !important;
            margin-left: 0px !important;
        }

        .lblname {
            font-size: 1.3em;
            color: #d41c1c;
            padding: 9px;
            padding-top: 23px;
            transition: background-color 2s;
            border-bottom-left-radius: 25px;
            border-top-right-radius: 26px;
            transition-timing-function: ease-out;
        }

        .margintop {
            margin-top: 0px;
        }

        .lblname:hover {
            background-color: blue;
            border-bottom-left-radius: 25px;
            border-top-right-radius: 26px;
            color: white;
        }

        .lblname:active {
            background-color: blue;
            border-bottom-left-radius: 25px;
            border-top-right-radius: 26px;
            color: white;
        }
        .ig{
            height:389px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <h1>Search page ..<asp:Label ID="txttext" runat="server" Text=""></asp:Label></h1>
                <div class="container">
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="plantID" OnItemDataBound="ListView1_ItemDataBound">
                        <AlternatingItemTemplate>
                            <div id="alttwo" class="col-md-3 col-sm-4 col-xs-6 text-center">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("plantID" , "productdetail_page.aspx?plantID={0}") %>' Font-Underline="False">
                                    <div class="thumbnail">

                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("imgurl") %>' CssClass="img-responsive margintop" Height="200px" Width="200px" />

                                        <asp:Label ID="pl_nameLabel" runat="server" Text='<%# Eval("pl_name") %>' CssClass="listname" />
                                        <br />
                                        <asp:Label ID="pl_priceLabel" runat="server" Text='<%# Eval("pl_price") %>' />₹
                                        <br />
                                        <asp:Label ID="lblqty" runat="server" Visible="false" Text='<%# Eval("pl_qty") %>' />
                                         <asp:Label ID="lblplantid" runat="server" Visible="false" Text='<%# Eval("plantID") %>' />
                                        <asp:Label ID="lblstock" runat="server" CssClass="stock" Visible="false" Text="out of stock" />
                                        <asp:Label ID="lblDiscountedPrice" CssClass="ratefont" runat="server" />
                                        <asp:Label ID="lblDiscountRate" runat="server" CssClass="rate" />
                                    </div>
                                </asp:HyperLink>
                            </div>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <span style="">plantID:
                                <asp:Label ID="plantIDLabel1" runat="server" Text='<%# Eval("plantID") %>' />
                                <br />
                                pl_name:
                                <asp:TextBox ID="pl_nameTextBox" runat="server" Text='<%# Bind("pl_name") %>' />
                                <br />
                                pl_price:
                                <asp:TextBox ID="pl_priceTextBox" runat="server" Text='<%# Bind("pl_price") %>' />
                                <br />
                                pl_category:
                                <asp:TextBox ID="pl_categoryTextBox" runat="server" Text='<%# Bind("pl_category") %>' />
                                <br />
                                imgurl:
                                <asp:TextBox ID="imgurlTextBox" runat="server" Text='<%# Bind("imgurl") %>' />
                                <br />
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                <br />
                                <br />
                            </span>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                           <h1>Sorry No Result Found</h1><br />
                            <img alt="serch not found" src="image/ser.gif" class="img-responsive ig" width="100%"  />
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <span style="">plantID:
                                <asp:TextBox ID="plantIDTextBox" runat="server" Text='<%# Bind("plantID") %>' />
                                <br />
                                pl_name:
                                <asp:TextBox ID="pl_nameTextBox" runat="server" Text='<%# Bind("pl_name") %>' />
                                <br />
                                pl_price:
                                <asp:TextBox ID="pl_priceTextBox" runat="server" Text='<%# Bind("pl_price") %>' />
                                <br />
                                pl_category:
                                <asp:TextBox ID="pl_categoryTextBox" runat="server" Text='<%# Bind("pl_category") %>' />
                                <br />
                                imgurl:
                                <asp:TextBox ID="imgurlTextBox" runat="server" Text='<%# Bind("imgurl") %>' />
                                <br />
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                <br />
                                <br />
                            </span>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div id="alttwo" class="col-md-3 col-sm-4 col-xs-6 text-center">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("plantID" , "productdetail_page.aspx?plantID={0}") %>' Font-Underline="False">
                                    <div class="thumbnail">

                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("imgurl") %>' CssClass="img-responsive margintop" Height="200px" Width="200px" />

                                        <asp:Label ID="pl_nameLabel" runat="server" Text='<%# Eval("pl_name") %>' CssClass="listname" />
                                        <br />
                                        <asp:Label ID="pl_priceLabel" runat="server" Text='<%# Eval("pl_price") %>' />₹
                                        <br />
                                        <asp:Label ID="lblqty" runat="server" Visible="false" Text='<%# Eval("pl_qty") %>' />
                                         <asp:Label ID="lblplantid" runat="server" Visible="false" Text='<%# Eval("plantID") %>' />
                                        <asp:Label ID="lblstock" runat="server" CssClass="stock" Visible="false" Text="out of stock" />
                                        <asp:Label ID="lblDiscountedPrice" CssClass="ratefont" runat="server" />
                                        <asp:Label ID="lblDiscountRate" runat="server" CssClass="rate" />
                                    </div>
                                </asp:HyperLink>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                            </div>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <span style="">plantID:
                                <asp:Label ID="plantIDLabel" runat="server" Text='<%# Eval("plantID") %>' />
                                <br />
                                pl_name:
                                <asp:Label ID="pl_nameLabel" runat="server" Text='<%# Eval("pl_name") %>' />
                                <br />
                                pl_price:
                                <asp:Label ID="pl_priceLabel" runat="server" Text='<%# Eval("pl_price") %>' />
                                <br />
                                pl_category:
                                <asp:Label ID="pl_categoryLabel" runat="server" Text='<%# Eval("pl_category") %>' />
                                <br />
                                imgurl:
                                <asp:Label ID="imgurlLabel" runat="server" Text='<%# Eval("imgurl") %>' />
                                <br />
                                <br />
                            </span>
                        </SelectedItemTemplate>
                    </asp:ListView>    
                </div>
                
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

