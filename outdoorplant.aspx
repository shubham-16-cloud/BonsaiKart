<%@ Page Title="" Language="C#" MasterPageFile="~/user master page.master" AutoEventWireup="true" CodeFile="outdoorplant.aspx.cs" Inherits="outdoorplant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <style>
          .image1 {
            opacity: 1;
            display: block;
            width: 100%;
            height: auto;
            transition: .5s ease;
            backface-visibility: hidden;
        }


        .middle {
            transition: .5s ease;
            opacity: 0;
            position: absolute;
            top: 50%;
            left: 50%;
            background-color: red;
            transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            text-align: center;
        }

        .thumbnail:hover .image1 {
            opacity: 0.3;
        }

        .thumbnail:hover .middle {
            opacity: 1;
        }
         .fontstyle {
            text-decoration: line-through;
        }
         .ratefont{
            font-size:20px;
        }
        .rate {
            padding: 2px 10px 2px 10px;
            border: 1px solid red;
            background-color: green;
            color: white;
            font-size: 10px;
            margin-left: 5px;
        }
        .pad{
            padding-top:76px;
            padding-bottom:20px;
        }
        .carousel-caption {
            right: 62% !important;
            left: 1% !important;
            padding-bottom: 30px;
            top: 80% !important;
        }

        .h2style {
            background-color: #cc48488f;
            padding: 9px;
            margin-bottom: 0px !important;
        }

        .bakground {
            background-position: center;
            background-image: url(../image/indoorplantimg.jpg);
            color: CYAN;
            background-position-y: -130px;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            text-align: center;
            padding-top: 45px;
            padding-bottom: 45px;
        }

        .glyphicon-chevron-right {
            right: -22% !important;
            top: 157px !important;
        }

        .glyphicon-chevron-left {
            left: -22% !important;
            top: 157px !important;
        }

        .glyphicon-chevron-right:before {
            content: "\e080";
            background-color: #84f555;
            font-size: 30px;
            border-radius: 6px;
            padding: 6px;
        }

        .glyphicon-chevron-left:before {
            content: "\e079";
            background-color: #84f555;
            font-size: 30px;
            border-radius: 6px;
            padding: 6px;
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

        .parallelogram {
            width: 80%;
            height: 80%;
            transform: skew(200deg);
            background: #555;
        }

        .parallelogram1 {
            width: 80%;
            height: 80%;
            transform: skew(200deg);
            background: #555;
        }

        #hexagon {
            width: 100%;
            height: 337px;
            /*background-image: url(../image/giphy-tumblr.gif);
            background-size: cover;*/
            position: relative;
            margin: 10px auto;
            margin-bottom: 31px;
            border-radius: 200px;
        }

            #hexagon:before {
                content: "";
                width: 100%;
                height: 0px;
                position: absolute;
                top: -25px;
                /* left: 50%; */
                /* box-shadow: 6px 0px 1px -4px red; */
                /*border-left: 300px solid transparent;
                border-right: 300px solid transparent; slider 3*/
                border-left: 215px solid transparent;
                border-right: 215px solid transparent;
                border-bottom: 71px solid #84f555;
                /*background-color:#84f555; slider 2*/
            }

            #hexagon:after {
                content: "";
                width: 100%;
                height: 0;
                position: absolute;
                bottom: -25px;
                left: 0;
                border-left: 215px solid transparent;
                border-right: 215px solid transparent;
                border-top: 71px solid #84f555;
                /*background-color:#84f555;*/
            }

        .haxagonsliderimg {
            height: 356px !important;
            width: 100%;
            position: absolute !important;
            z-index: 2;
            left: 1%;
            top: -5.6px;
            border-top-right-radius: 107px;
            border-top-left-radius: 107px;
            right: 50% !important;
            border-radius: 51px;
        }

        .carousel-inner {
            position: absolute !important;
            width: 100%;
            /* overflow: hidden; */
            z-index: 2;
            overflow: visible !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                <div class="bakground">
                    <h1>OutDoor Plant
                    </h1>
                    <h3>ANy body use this plant
                    </h3>
                </div>
                <!--listviwe start--->
                <div class="container">
                    <br />
                    <br />
                    <br />
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="plantID" OnItemDataBound="ListView1_ItemDataBound">
                        <AlternatingItemTemplate>
                            <div id="alttwo" class="col-md-3 col-sm-4 col-xs-6 text-center">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("plantID" , "productdetail_page.aspx?plantID={0}") %>' Font-Underline="False">
                                    <div class="thumbnail">

                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("imgurl") %>' CssClass="img-responsive margintop image1" Height="200px" Width="200px" />

                                        <asp:Label ID="pl_nameLabel" runat="server" Text='<%# Eval("pl_name") %>' CssClass="listname" />
                                        <br />
                                        <asp:Label ID="pl_priceLabel" runat="server" Text='<%# Eval("pl_price") %>' />₹
                                        <br />
                                        <asp:Label ID="lblqty" runat="server" Visible="false" Text='<%# Eval("pl_qty") %>' />
                                         <asp:Label ID="lblplantid" runat="server" Visible="false" Text='<%# Eval("plantID") %>' />
                                        <asp:Label ID="lblstock" runat="server" CssClass="stock" Visible="false" Text="out of stock" />
                                        <asp:Label ID="lblDiscountedPrice" CssClass="ratefont" runat="server" />
                                        <asp:Label ID="lblDiscountRate" runat="server" CssClass="rate" />
                                        <div class="middle"></div>
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
                            <span>No data was returned.</span>
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

                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("imgurl") %>' CssClass="img-responsive margintop image1" Height="200px" Width="200px" />

                                        <asp:Label ID="pl_nameLabel" runat="server" Text='<%# Eval("pl_name") %>' CssClass="listname" />
                                        <br />
                                        <asp:Label ID="pl_priceLabel" runat="server" Text='<%# Eval("pl_price") %>' />₹
                                        <br />
                                        <asp:Label ID="lblqty" runat="server" Visible="false" Text='<%# Eval("pl_qty") %>' />
                                         <asp:Label ID="lblplantid" runat="server" Visible="false" Text='<%# Eval("plantID") %>' />
                                        <asp:Label ID="lblstock" runat="server" CssClass="stock" Visible="false" Text="out of stock" />
                                        <asp:Label ID="lblDiscountedPrice" CssClass="ratefont" runat="server" />
                                        <asp:Label ID="lblDiscountRate" runat="server" CssClass="rate" />
                                        <div class="middle"></div>
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
                    <br />
                </div>
                <div>
                    <!--Slider ads-->
                    <div class="container pad">
                        <div id="hexagon">
                            <div class="row">
                                <div class="col-md-2"></div>

                                <div class="col-md-8">
                                    <%--  <asp:Image ID="Image1" runat="server" ImageUrl="~/image/indoorplantimg.jpg" CssClass="img-responsive haxagonsliderimg" />--%>

                                    <div id="myslider" class="carousel sliderInner">
                                        <!--indicatior-->
                                        <%-- <ol class="carousel-indicators">
                                <li data-target="#myslider" data-slide-to="0"></li>
                                <li data-target="#myslider" data-slide-to="1"></li>
                                <li data-target="#myslider" data-slide-to="2"></li>

                            </ol--%>
                                        <!---wreaper class-->
                                        <div class="carousel-inner">
                                            <asp:Repeater ID="reslider" runat="server">
                                                <ItemTemplate>
                                                    <div class='item <%#Container.ItemIndex==0?"active":"" %>'>
                                                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%#Eval("Ad_link")%>' Target="_blank">
                                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Ad_imgurl")%>' CssClass="img-responsive haxagonsliderimg" />
                                                        <div class=" carousel-caption">
                                                            <%--  <h2>'<%#Eval("img_title")%>'</h2>
                                                <p>'<%#Eval("img_drecription")%>'</p>
                                                            --%>
                                                            <h2 class="h2style">'<%#Eval("Ad_title")%>' </h2>
                                                            <p style="background-color: #00000061">'<%#Eval("Ad_details")%>'</p>
                                                        </div>
                                                            </asp:HyperLink>
                                                    </div>
                                                </ItemTemplate>
                                                
                                            </asp:Repeater>

                                        </div>
                                        <!-- Left and right controls -->
                                        <a class="left carousel-control" href="#myslider" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="right carousel-control" href="#myslider" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right"></span>
                                            <span class="sr-only">Next</span>
                                        </a>


                                    </div>

                                </div>
                                <div class="col-md-2"></div>
                            </div>
                        </div>
                    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

