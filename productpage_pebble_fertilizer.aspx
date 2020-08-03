<%@ Page Title="" Language="C#" MasterPageFile="~/user master page.master" AutoEventWireup="true" CodeFile="productpage_pebble_fertilizer.aspx.cs" Inherits="productpage_pebble_fertilizer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <link href="css/productdetail_mediaquery.css" rel="stylesheet" />



    <style>
        .discountstyle {
            text-decoration: line-through;
            font-size: 16px;
            color: gray;
        }
        .whitoutdiscount{
            font-size:30px;
        }

        .discountstyle1 {
            font-size: 13px;
            border: 1px solid red;
            background-color: green;
            color: white;
            padding: 2px 10px 2px 10px;
        }

        .lblstock {
            margin-left: 20px;
            background-color: #8c7676;
            PADDING: 6px;
            border-radius: 9px;
            color: yellow;
            font-size: 17px;
            font-weight: bold;
        }

        .qtyimg {
            width: 33.7px;
            cursor: pointer;
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }

        .qtyimg1 {
            width: 33.5px;
            cursor: pointer;
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .imgpadding {
            padding-top: 19px;
        }

        .borderstyle {
            border-left: 8px groove greenyellow;
            border-radius: 23px;
        }

        .fontstyle {
            font-size: 14px;
            font-family: sans-serif;
            line-height: 2em;
            font-weight: bold;
        }

        .imgsize2 {
            height: 570px !important;
            width: 72%;
        }

        .priceboxdiv {
            background-color: red;
            margin-right: -28px;
            height: auto;
            padding: 7px 39px 30px 15px;
            border-radius: 4px;
        }

        .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
            color: #171212;
            cursor: default;
            background-color: #22e815;
            border: 1px solid #ddd;
            border-bottom-color: transparent;
        }

        .nav > li > a:hover {
            text-decoration: none;
            background-color: #eac50d;
        }
        /*hover class*/
        .pheding {
            padding: 0px 3px 2px 4px !important;
        }

        .panmargin {
            margin-bottom: 0px !important;
            width: 100%;
        }

        .any {
            position: absolute;
            z-index: -1;
            top: -3px;
            right: -20px;
            height: 125px;
            transform: rotate(-33deg);
        }

        .borderimg {
            border: 10px solid #521c1cf0;
            border-bottom: 0px;
            border-right: 0;
            border-image-width: -12px;
            border-left: 0;
            border-top-right-radius: 261px;
        }

        .any:before {
            background-image: url(../image/Screenshot_2018-01-17-16-23-40.png);
            content: '';
            position: absolute;
            z-index: 3;
        }

        .btnwidth {
            width: 90%;
        }

        .input1 {
            width: 70%;
        }

        .productshow {
            width: 100%;
            position: relative;
            float: left;
        }

        .sliderwidth {
            width: 70.2%;
        }

        .imgsize1 {
            height: 570px !important;
            width: 100%;
        }

        .carousel-control.right {
            right: 23px;
            left: auto;
            background-image: none !important;
        }

        .carousel-control.left {
            background-image: none;
            left: -32px;
        }

        .divshow {
            width: 30%;
            position: absolute;
            top: 0;
            right: 5%;
            height: 100%;
        }

        .contentshow {
            width: 100%;
            float: left;
            height: 100%;
            background-color: #f4f4f4;
            -ms-transform: skewX(-13deg);
            -webkit-transform: skewX(-13deg); /* transform: skewX(-10deg); */
            -moz-transform: skewX(-13deg);
        }

        .scrollbar {
            /* margin-left: 30px; */
            height: 300px;
            width: 100%;
            background: #f5f5f514;
            overflow-y: auto;
            /* margin-bottom: 25px; */
        }

        #style-1::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            border-radius: 10px;
            background-color: #F5F5F5;
        }

        #style-1::-webkit-scrollbar {
            width: 12px;
            background-color: #F5F5F5;
        }

        #style-1::-webkit-scrollbar-thumb {
            border-radius: 10px;
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
            background-color: #555;
        }

        * {
            margin: 0px;
            padding: 0px;
            margin-left: 0px;
        }

        .pricebox {
            margin-top: 3px;
            border-left: 12px solid green;
        }

        .fontsize {
            font-size: 29px;
            margin-bottom: 13px;
            margin-top: 20px;
        }
    </style>


     <script>
        var myVar = setInterval(function () { setColor() }, 2000);
        function setColor() {
            var x = document.getElementById("productshow1");
            var y = document.getElementById("pricebox");
            x.style.backgroundColor = x.style.backgroundColor == "yellow" ? "pink" : "yellow";
            y.style.backgroundColor = y.style.backgroundColor == "yellow" ? "pink" : "yellow";
        }


    </script>

     <script>
         //$(document).ready(function () {
         //if ($(window).width() < 860) {
         //    $('#svg1').removeAttr('viewBox');
         //    $('#svg1').each(function () { $(this)[0].setAttribute('viewBox', '0 0 800 400') });
         //    //$('#svg1').attr({
         //    //    "viewBox" : "0 0 1400 800",
         //    //});
         //}
         $(window).on('resize', function () {
             var width = $(window).width();
             if (width < 568) {
                 $('#svg1').removeAttr('viewBox');
                 $('#svg1').each(function () { $(this)[0].setAttribute('viewBox', '0 0 1400 800') });
             }
         });
         //});
    </script>

       <script>
           function incNumber() {

               var c = 0;
               if (document.getElementById("<%=quantity.ClientID%>").value != "") {


                c = parseInt(document.getElementById('<%=quantity.ClientID %>').value);
                c++;
                document.getElementById('<%=quantity.ClientID %>').value = c;

            }
            else {
                c = 1;
                document.getElementById('<%=quantity.ClientID %>').value = c;
            }
        }

        function decNumber() {

            var c = 0;
            if (document.getElementById("<%=quantity.ClientID%>").value != 1) {


                if (document.getElementById("<%=quantity.ClientID%>").value != "") {


                    c = parseInt(document.getElementById('<%=quantity.ClientID %>').value);
                    c--;
                    document.getElementById('<%=quantity.ClientID %>').value = c;

            }
            else {
                c = 1;
                document.getElementById('<%=quantity.ClientID %>').value = c;
            }
        }
    }

    </script>

    <script type="text/javascript">
        function ShowPopup(message) {
            $(function () {
                $("#dialog").text(message);
                $("#dialog").dialog({
                    title: "jQuery Dialog Popup",
                    buttons: {
                        Close: function () {
                            $(this).dialog('close');
                        }
                    },
                    modal: true
                });
            });
        };
    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div id="dialog" style="display: none">
                </div>
                <div class="row productshow">
                    <div id="productshow1" class="productshow">
                        <asp:Image ID="imgsingle" runat="server" ImageUrl="~/Admin/plantImg/seeed22.jpg" CssClass="img-responsive imgsize2" />
                    </div>
                    <div class="divshow">
                        <div class="contentshow">
                            <div style="margin: auto; padding-top: 192px; font-size: 25px; text-align: center; padding-left: 18px; padding-right: 18px;">
                                <asp:Label ID="lblheadname" runat="server" CssClass="lbl1" Text="Name 1 3e sdf ksjgp e98urdon xv89ud; suvnly du :-"></asp:Label>
                                <hr style="width: 90%; height: 5px; background-color: red; margin: auto;" />
                                <asp:Label ID="lblheadetails" runat="server" CssClass="lbl2" Text="Deatkdvn cknfoisviveoiu s9ufn0[ s98vun9 v9y-jus-bpncuf 98vunfub:-"></asp:Label>
                            </div>
                        </div>
                    </div>

                </div>

                <!--image slider dic end-->
                <div class="row">
                    <asp:Label ID="lblheadprice" runat="server" Visible="false" Text="Label"></asp:Label>
                    <asp:Label ID="lblheadimage" runat="server" Visible="false" Text="Label"></asp:Label>
                    <asp:Label ID="lblqty" runat="server" Visible="false" Text="Label"></asp:Label>


                    <div id="exm" class="col-md-4 col-xs-12 pricebox">
                        <img alt="" src="image/Screenshot_2018-01-17-16-23-40.png" class="any" />
                        <div id="pricebox" style="margin-left: -11px" class="borderimg priceboxdiv">
                            <div class="fontsize">

                                <asp:Label ID="lblprice" runat="server"></asp:Label><br />
                                 <asp:Label ID="lbldprice" runat="server"></asp:Label>
                                    <asp:Label ID="lbldrate" runat="server" CssClass=" discountstyle1"></asp:Label>
                            </div>
                            <div>
                                <div class="input-group input1">
                                    <span class="input-group-btn">
                                        <button type="button" class="quantity-left-minus btn btn-danger btn-number" onclick="decNumber()" data-type="minus" data-field="">
                                            <span class="glyphicon glyphicon-minus"></span>
                                        </button>
                                    </span>
                                    <asp:TextBox ID="quantity" runat="server" type="text" class="form-control input-number" value="1" min="1" max="100" Style="text-align: center"></asp:TextBox>

                                    <span class="input-group-btn">
                                        <button type="button" class="quantity-right-plus btn btn-success btn-number" onclick="incNumber()" data-type="plus" data-field="">
                                            <span class="glyphicon glyphicon-plus"></span>
                                        </button>
                                    </span>
                                </div>
                            </div>
                            <div>
                                <br />
                                <asp:Button ID="btncart" runat="server" Text="Add to Cart" CssClass="btn btn-success btnwidth" OnClick="btncart_Click" />


                                <br />
                                <br />
                                <asp:Button ID="btnbuy" runat="server" Text="Buy Now" CssClass="btn btn-info btnwidth" />
                            </div>

                        </div>

                    </div>


                    <!--panle pebbles fro seed-->
                    <asp:Panel ID="panpebbles" CssClass="one" runat="server">
                        <div class="col-md-8 col-xs-12">
                            <div class="panel with-nav-tabs panmargin">
                                <div class="panel-heading pheding">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#tab1primary" data-toggle="tab">Product Details</a></li>
                                        <li><a href="#tab2primary" data-toggle="tab">Description</a></li>
                                    </ul>
                                </div>
                                <div id="style-1" class="panel-body scrollbar" style="height: 229px;">
                                    <div class="tab-content">
                                        <div class="tab-pane fade in active" id="tab1primary">
                                            <div class="row" style="text-align: justify">
                                                <div class="col-md-4 col-md-12 borderstyle">
                                                    <asp:Label ID="Label5" runat="server" Text="Name:-" CssClass="fontstyle"></asp:Label>
                                                    <asp:Label ID="lblpename" runat="server" Text="Name :-"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label6" runat="server" Text="price:-" CssClass="fontstyle"></asp:Label>
                                                    <asp:Label ID="lblpeprice" runat="server" Text="Price:-"></asp:Label>
                                                    <br />

                                                    <br />
                                                </div>
                                                <div class="col-md-4 col-md-12 borderstyle">
                                                    <asp:Label ID="Label7" runat="server" Text="Pebbles Type:-" CssClass="fontstyle"></asp:Label>
                                                    <asp:Label ID="lblpetype" runat="server" Text="Comman Name"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label8" runat="server" Text="Weight per Packet:-" CssClass="fontstyle"></asp:Label>
                                                    <asp:Label ID="lblpeweight" runat="server" Text="Seed Color:-"></asp:Label>

                                                </div>
                                                <div class="col-md-4 col-md-12 borderstyle">

                                                    <asp:Image ID="imgsefree" runat="server" ImageUrl="~/image/PaidDelivery1.png" CssClass=" imgpadding img-responsive" />
                                                    <asp:Image ID="imgsenotfree" runat="server" ImageUrl="~/image/FreeDelivery1.png" CssClass=" imgpadding img-responsive" />

                                                </div>
                                            </div>
                                            <br />
                                            <asp:Label ID="lblsestock" runat="server" CssClass="lblstock" Visible="false"></asp:Label>
                                        </div>
                                        <div class="tab-pane fade" id="tab2primary">
                                            <asp:Label ID="lblpeuse" runat="server" Text="free"></asp:Label>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <!--panle pebbles fro seed end-->

                    <!--panle fertilizer fro pot-->
                    <asp:Panel ID="Panfertilizer" CssClass="one" runat="server">
                        <div class="col-md-8 col-xs-12">
                            <div class="panel with-nav-tabs panmargin">
                                <div class="panel-heading pheding">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#tab1primary" data-toggle="tab">Product Details</a></li>
                                        <li><a href="#tab2primary" data-toggle="tab">Description</a></li>
                                    </ul>
                                </div>
                                <div id="style-1" class="panel-body scrollbar" style="height: 229px;">
                                    <div class="tab-content">
                                        <div class="tab-pane fade in active" id="tab1primary">
                                            <div class="row" style="text-align: justify">
                                                <div class="col-md-4 col-md-12 borderstyle">
                                                    <asp:Label ID="Label14" runat="server" Text="Name:-" CssClass="fontstyle"></asp:Label>
                                                    <asp:Label ID="lblfename" runat="server" Text="Name :-"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label15" runat="server" Text="Price:-" CssClass="fontstyle"></asp:Label>
                                                    <asp:Label ID="lblfeprice" runat="server" Text="Price:-"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label16" runat="server" Text="Weight:-" CssClass="fontstyle"></asp:Label>
                                                    <asp:Label ID="lblfeweight" runat="server" Text="Matirial"></asp:Label>
                                                </div>
                                                <div class="col-md-4 col-md-12 borderstyle">
                                                    <asp:Label ID="Label17" runat="server" Text="Size:-" CssClass="fontstyle"></asp:Label>
                                                    <asp:Label ID="lblfecontaint" runat="server" Text="Size"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label18" runat="server" Text="Details:-" CssClass="fontstyle"></asp:Label>
                                                    <asp:Label ID="lblfedetails" runat="server" Text="Pot Placement:-"></asp:Label>
                                                    <br />

                                                </div>
                                                <div class="col-md-4 col-md-12 borderstyle">
                                                    <asp:Image ID="imgpofree" runat="server" ImageUrl="~/image/PaidDelivery1.png" CssClass=" imgpadding img-responsive" />
                                                    <asp:Image ID="imgponotfree" runat="server" ImageUrl="~/image/FreeDelivery1.png" CssClass=" imgpadding img-responsive" />
                                                    <br />


                                                </div>
                                            </div>
                                            <br />
                                            <asp:Label ID="lblpostock" runat="server" CssClass="lblstock" Visible="false" Text="Label"></asp:Label>
                                        </div>
                                        <div class="tab-pane fade" id="tab2primary">
                                            <asp:Label ID="lblfedecription" runat="server" Text="10day"></asp:Label>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <!--panle fertilizer fro pot end-->
                </div>

                <%--svg class start--%>
                <div style="position: relative; /*width: 90%; */ margin: 0 auto; overflow-x: hidden;">
                    <section id="svg" style="width: 100%; float: left; background-color: green; display: block">
                        <div>
                            <div>
                                <svg id="svg1" viewBox="0 1 1390 795<%--0 0 1400 800--%>" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
                                    <defs>
                                        <clipPath id="cd-ig-3">
                                            <path id="cd-img-path-3" d="M1400,800H0V0h1399c0.6,0,1,0.4,1,1V800z">
                                            </path>
                                        </clipPath>
                                    </defs>
                                    <image clip-path="url(#cd-lg-3)" width="1400PX" height="800PX" href="image/slider_img/sliderimg2.jpg"></image>
                                    <polygon points="1400,0 1400,800 740,800 940,0 " clip-path="url(#cd-lg-3)" style="fill: grey"></polygon>

                                    <foreignObject x="880" y="250" width="29%" height="250" clip-path="url(#cd-lg-3)">
                                        <h1>Discover a world of sweet and salty delights.</h1>
                                        <br />
                                        <hr style="height: 4px; background-color: red" />
                                        <h4>
                                            any body can dance vnsk
                                            kvnskdnskvhbi ih gu90u 9uwen90ur f90suge f9uenff g98uweubr[af we89fywn8[u w89gwyr89 ryg89ew
                                            nkdivapfojsdp
                                            sjoojdfvosdjv
                                        </h4>
                                    </foreignObject>

                                </svg>
                            </div>

                        </div>
                        <div style="position: relative; top: -8px; margin-bottom: -20px; overflow: hidden;"
                            <%--style="position: absolute; top: 0; pointer-events: none; z-index: 100; width: 100%; height: 100%;"--%>>
                            <svg viewBox="0 0 1920 1097.141" width="100%" height="100%" x="0px" y="0px" <%--style="position: absolute; top: 0; left: 0; width: 100%; overflow: hidden; height: 100%;"--%>>
                                <g transform="scale(1)">
                                    <path d="M1910.461,131.323l-170.4,844.816L601.623,886.76L35.045,965.817L193.16,131.323l439.207,109.802

  L1910.461,131.323z M0,1097.14h1920V0H0V1097.14z"
                                        fill="white">
                                    </path>

                                    <defs>
                                        <clipPath id="cd-test">
                                            <path fill="pink" d="M1910.461,131.323l-170.4,844.816L601.623,886.76L35.045,965.817L193.16,131.323l439.207,109.802 L1910.461,131.323z M0,1097.14h1920V0H0V1097.14z"></path>
                                        </clipPath>
                                    </defs>

                                    <image width="1920px" height="1097px" clip-path="cd-test">
                                    </image>

                                    <polygon points="198.024,137.505 637.231,247.307 1485.771,167.809 649.151,227.537 178.104,80.524 56.874,850.8 " fill="yellow"></polygon>
                                </g>

                                <g>
                                    <defs>
                                        <rect id="cd-re-1" y="8" width="1920px" height="1080"></rect>
                                    </defs>
                                    <clipPath id="cd-test-2">
                                        <use href="#cd-re-1" overflow="visible">
                                        </use>
                                    </clipPath>
                                    <path d="M1735.277,965.817l-1128.79-78.753l1167.776,129.553

    c0,0,73.264-586.321,73.068-585.434L1735.277,965.817z"
                                        clip-path="cd-test-2" fill="red">
                                    </path>
                                </g>
                            </svg>
                        </div>
                    </section>
                </div>


            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

