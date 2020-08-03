<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userpage_main1.aspx.cs" Inherits="userpage_main1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>main page</title>
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
    </style>

    <link href="user_master%20style.css" rel="stylesheet" />
    <%--<link href="css/coustom_stylesheet.css" rel="stylesheet" />--%>
    <link href="css/bootstrap-theme.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css" />
    <link href="css/media_query.css" rel="stylesheet" />
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/modernizr.custom.js"></script>
    <script src="js/scrollreveal.js"></script>
    <script type="text/javascript">
        function ToggleDiv1() {
            document.getElementById('normaluser').style.display = 'none';
        }

        function ToggleDiv2() {
            document.getElementById('loginuser').style.display = 'none';
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="container-fluid">
                        <div id="firstrow" class="row" style="background-color: #343131; color: white; padding: 5px">
                            <div id="google_translate_element" class="pull-right" style="padding-right: 30px;"></div>
                            <script type="text/javascript">
                                function googleTranslateElementInit() {
                                    new google.translate.TranslateElement({ pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE }, 'google_translate_element');
                                }
                            </script>
                            <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

                        </div>
                        <nav class="navbar navbar-inverse  cl-effect-2">
                            <div class="navbar-header">
                                <!--header start-->
                                <button type="button" data-toggle="collapse" class="navbar-toggle" data-target=".navbar-collapse">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class=" navbar-brand" href="#">
                                    <asp:Image ID="imglogo" runat="server" ImageUrl="~/image/Logo.jpg" CssClass="img-responsive logosize" />
                                </a>
                            </div>
                            <!--header end-->
                            <div id="demo" class="collapse navbar-collapse">
                                <ul class="nav navbar-nav navul ">

                                    <li><a href="userpage_main1.aspx"><span data-hover="Home">Home</span></a></li>
                                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span data-hover="Plant">Plant  <i class="caret"></i></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="indoorplant.aspx">Indoor Plant</a></li>
                                            <li><a href="outdoorplant.aspx">OutDoor Plant</a></li>
                                            <li><a href="bamboosplant.aspx">Bamboos Plant</a></li>
                                            <li><a href="tinyplant.aspx">Tiny Plant</a></li>
                                        </ul>

                                        <li><a href="pot.aspx"><span data-hover="Pot">Pot</span></a></li>
                                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span data-hover="Seeds">Seeds  <i class="caret"></i></span></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="VegetableSeeds.aspx">Vegetable Seeds</a></li>
                                                <li><a href="FlowerSeed.aspx">Flower Seeds</a></li>
                                                <li><a href="TreeSeed.aspx">Tree Seeds</a></li>
                                            </ul>

                                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span data-hover="Bonsai care">Bonsai Care<i class="caret"></i></span></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="pebbles.aspx">Pebbles</a></li>
                                                    <li><a href="fertilizer.aspx">Fertilizers</a></li>


                                                </ul>
                                </ul>
                                <asp:Panel ID="normaluser1" runat="server" Visible="false">
                                <ul id="normaluser" class="nav navbar-nav pull-right navul">
                                    <li class="dropdown"><a class="dropdown-toggle " data-hover="dropdown" data-toggle="dropdown" href="#"><span data-hover="Log In" style="color: white">Log-In<img alt="userlogin" src="image/userlogin.svg" class="imgsize img-circle" /></span></a>

                                        <ul class="dropdown-menu dropdown-menu-right text-center" style="background-color: limegreen; background-image: none">
                                            <li><a href="login_page.aspx"><span data-hover="log in">log In</span></a></li>
                                            <li>
                                                <div class="divider"></div>
                                            </li>
                                            <li>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary" OnClick="lbsingup_Click"><i class="glyphicon glyphicon-user"></i> Sign Up</asp:LinkButton></li>
                                        </ul>
                                    </li>
                                </ul>
                                    </asp:Panel>

                                <!--Login user menu div -->
                                <asp:Panel ID="loginuser1" runat="server" Visible="false">
                                <ul id="loginuser" class="nav navbar-nav pull-right navul">
                                    <li class="dropdown"><a class="dropdown-toggle " data-hover="dropdown" data-toggle="dropdown" href="#">
                                        <div class="lblname">
                                            <asp:Literal ID="lblusername" runat="server"></asp:Literal>
                                        </div>
                                    </a>
                                        <ul class="dropdown-menu dropdown-menu-right text-center" style="background-color: limegreen; background-image: none">
                                            <li><a href="myorderview.aspx">My Order</a></li>
                                            <li><a href="newcart.aspx">Your Cart</a></li>
                                            <li><a href="Advetisementpage.aspx">Post Free Advetisement</a></li>
                                            <li><a>
                                                <asp:Button ID="btnlogout" runat="server" OnClick="btnlogout_Click" Text="LogOut" CssClass="btn btn-primary btn-sm" /></a></li>
                                        </ul>
                                    </li>
                                </ul>
                                     </asp:Panel>
                                <!--Login user menu duv end-->
                            </div>
                        </nav>

                        <div id="myslider" class="carousel " data-ride="carousel">
                            <!--indicatior-->
                            <ol class="carousel-indicators">
                                <li data-target="#myslider" data-slide-to="0"></li>
                                <li data-target="#myslider" data-slide-to="1"></li>
                                <li data-target="#myslider" data-slide-to="2"></li>
                                <li data-target="#myslider" data-slide-to="3"></li>
                                <li data-target="#myslider" data-slide-to="4"></li>

                            </ol>
                            <!---wreaper class-->
                            <div class="carousel-inner">
                                <asp:Repeater ID="reslider" runat="server">
                                    <ItemTemplate>
                                        <div class='item <%#Container.ItemIndex==0?"active":"" %>'>

                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("img_path")%>' CssClass="img-responsive" Height="600px" Width="100%" />
                                            <div class=" carousel-caption">
                                                <h2 style="color: black">'<%#Eval("img_title")%>'</h2>
                                                <p style="color: black">'<%#Eval("img_drecription")%>'</p>
                                            </div>
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

                        <div class="well" id="mysearch">
                            <!--search box-->
                            <div class="row ">

                                <div class=" form-inline form-group">
                                    <asp:TextBox ID="txtsearch" runat="server" CssClass="form-control searchalign" placeholder="Search"></asp:TextBox>
                                    <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnsearch_Click" />

                                </div>
                            </div>
                        </div>

                        <div style="background-color: #ededed">
                            <div class=" container">
                                <br />
                                <asp:ListView ID="ListView1" runat="server" OnItemDataBound="ListView1_ItemDataBound">
                                    <AlternatingItemTemplate>

                                        <div id="altone" class="col-md-3 col-sm-4 col-xs-6 text-center">
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("plantID" , "productdetail_page.aspx?plantID={0}") %>' Font-Underline="False">
                                                <div class="thumbnail">

                                                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("imgurl") %>' CssClass="img-responsive margintop image1" Height="200px" Width="200px" />

                                                    <asp:Label ID="pl_nameLabel" runat="server" Text='<%# Eval("pl_name") %>' CssClass="listname" />
                                                    <br />
                                                    <asp:Label ID="pl_priceLabel" runat="server" Text='<%# Eval("pl_price") %>' />
                                                    ₹ 
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
                                        <td runat="server" style="">id:
                                            <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                                            <br />
                                            plantid:
                                            <asp:TextBox ID="plantidTextBox" runat="server" Text='<%# Bind("plantid") %>' />
                                            <br />
                                            pl_name:
                                            <asp:TextBox ID="pl_nameTextBox" runat="server" Text='<%# Bind("pl_name") %>' />
                                            <br />
                                            pl_price:
                                            <asp:TextBox ID="pl_priceTextBox" runat="server" Text='<%# Bind("pl_price") %>' />
                                            <br />
                                            imgurl:
                                            <asp:TextBox ID="imgurlTextBox" runat="server" Text='<%# Bind("imgurl") %>' />
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
                                        <td runat="server" style="">id:
                                            <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                                            <br />
                                            plantid:
                                            <asp:TextBox ID="plantidTextBox" runat="server" Text='<%# Bind("plantid") %>' />
                                            <br />
                                            pl_name:
                                            <asp:TextBox ID="pl_nameTextBox" runat="server" Text='<%# Bind("pl_name") %>' />
                                            <br />
                                            pl_price:
                                            <asp:TextBox ID="pl_priceTextBox" runat="server" Text='<%# Bind("pl_price") %>' />
                                            <br />
                                            imgurl:
                                            <asp:TextBox ID="imgurlTextBox" runat="server" Text='<%# Bind("imgurl") %>' />
                                            <br />
                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                            <br />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                            <br />
                                        </td>
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
                                        <table runat="server">
                                            <tr runat="server">
                                                <td runat="server">
                                                    <table id="groupPlaceholderContainer" runat="server" border="0" style="">
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
                                        <td runat="server" style="">id:
                                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                            <br />
                                            plantid:
                                            <asp:Label ID="plantidLabel" runat="server" Text='<%# Eval("plantid") %>' />
                                            <br />
                                            pl_name:
                                            <asp:Label ID="pl_nameLabel" runat="server" Text='<%# Eval("pl_name") %>' />
                                            <br />
                                            pl_price:
                                            <asp:Label ID="pl_priceLabel" runat="server" Text='<%# Eval("pl_price") %>' />
                                            <br />
                                            imgurl:
                                            <asp:Label ID="imgurlLabel" runat="server" Text='<%# Eval("imgurl") %>' />
                                            <br />
                                        </td>
                                    </SelectedItemTemplate>
                                </asp:ListView>

                            </div>
                        </div>

                        <footer id="myFooter">
                            <div class="container">
                                <div class="row ">
                                    <!--row start-->

                                    <div id="one" class="col-md-3 col-xs-6 text-center">
                                        <a href="#">
                                            <asp:Image ID="imgfootlogo" runat="server" ImageUrl="~/image/Logo.jpg" CssClass="img-responsive img-thumbnail img-circle footlogo" />
                                        </a>
                                    </div>
                                    <div id="two" class="col-md-2 col-xs-6  text-center">
                                        <h5>Get started</h5>
                                        <ul>
                                            <li><a href="userpage_main1.aspx">Home</a></li>
                                            <li><a href="signUp_page.aspx">Sign up</a></li>
                                            <li><a href="login_page.aspx">log In</a></li>
                                        </ul>
                                    </div>
                                    <div id="three" class="col-md-2 col-xs-6 text-center">
                                        <h5>About us</h5>
                                        <ul>
                                            <li><a href="company_information_page.aspx">Company Information</a></li>
                                            <li><a href="contact _us_page.aspx">Contact us</a></li>
                                            <li><a href="#">Reviews</a></li>
                                        </ul>
                                    </div>
                                    <div id="four" class="col-md-2 col-xs-6 text-center">
                                        <h5>Support</h5>
                                        <ul>
                                            <li><a href="#">FAQ</a></li>
                                            <li><a href="#">Help desk</a></li>
                                            <li><a href="#">Forums</a></li>
                                        </ul>
                                    </div>
                                    <div id="five" class="col-md-3 col-xs-12 text-center">
                                        <div class="social-networks">
                                            <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                                            <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                                            <a href="#" class="google"><i class="fa fa-google-plus"></i></a>
                                        </div>
                                        <a class="btn btn-primary" href="contact _us_page.aspx">Contact Us</a>
                                    </div>
                                </div>
                                <!--row end-->
                            </div>
                            <div class="footer-copyright">
                                <p>Â© 2017 Copyright Text </p>
                            </div>
                        </footer>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            <asp:UpdateProgress ID="up" runat="server">
                <ProgressTemplate>
                    <asp:Image ID="imgUpdateProgress" runat="server" CssClass=" modal center" ImageUrl="~/image/mickey-loading.gif" />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </form>
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    <script>
        window.sr = ScrollReveal();


        sr.reveal('.navbar-brand', {
            origin: 'bottom',
            // Can be any valid CSS distance, e.g. '5rem', '10%', '20vw', etc.
            //distance: '20px',
            // Time in milliseconds.
            duration: 3000,
            //delay: 0,
        });
        sr.reveal('#google_translate_element', {
            origin: 'left',
            distance: '200px',
            duration: 3000,
        });
        //sr.reveal('.navul', {
        //    origin: 'left',
        //    distance: '200px',
        //    duration: 1000,
        //    rotate: { x: 900, y: 10, z: 0 },
        //});
        sr.reveal('.carousel-inner', {
            origin: 'right',
            //distance: '200px',
            duration: 2000,
            rotate: { x: 400, y: 10, z: 0 },
        });
        sr.reveal('.form-inline', {
            origin: 'left',
            duration: 2000,
            reset: true,
            viewFactor: 0.4,
            rotate: { x: 900, y: 10, z: 0 },
            distance: '200px',
        });
        sr.reveal('#altone', {
            // linear: 'cubic-bezier(0.6, 0.2, 0.1, 1)',
            duration: 2000,
            origin: 'left',
            distance: '800px',
        });
        //sr.reveal('#altone', {
        //    // linear: 'cubic-bezier(0.6, 0.2, 0.1, 1)',
        //    duration: 2000,
        //    rotate: { x: 0, y: 30, z: 30 },
        //    origin: 'left',
        //   // distance: '800px',
        //});
        sr.reveal('#alttwo', {
            // linear: 'cubic-bezier(0.6, 0.2, 0.1, 1)',
            duration: 2000,
            rotate: { x: 0, y: 30, z: 30 },
            origin: 'top',
            //viewFactor: 0.2,
            distance: '600px',
        });
        sr.reveal('#one', {
            duration: 2000,
            rotate: { x: 0, y: 10, z: 90 },
            origin: 'left',
            distance: '100px',

        });
        sr.reveal('#two', {
            duration: 2000,
            origin: 'top',
            distance: '100px',
        });
        sr.reveal('#three', {
            duration: 2000,
            origin: 'bottom',
            distance: '100px',
        });
        sr.reveal('#four', {
            duration: 2000,
            origin: 'top',
            distance: '100px',
        });
        sr.reveal('#five', {
            duration: 2000,
            rotate: { x: 900, y: 10, z: 0 },
            origin: 'top',
            distance: '100px',
        });
    </script>
</body>
</html>
