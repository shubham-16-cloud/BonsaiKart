<%@ Page Title="" Language="C#" MasterPageFile="~/user master page.master" AutoEventWireup="true" CodeFile="company_information_page.aspx.cs" Inherits="company_information_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .bgimg {
            background-image: url(../image/companyinformation.jpg);
            background-size: cover;
            height: 750px;
            width: 100%;
        }

        .heading {
            padding: 230px 0px 0px 160px !important;
            margin: 0 auto;
            color: white;
            font-size: 50px;
        }

        .col-md-6 {
            padding-right: 0px !important;
            padding-left: 0px !important;
        }

        .infotext {
            padding-top: 130px;
            font-size: 21px;
            width: 72%;
            margin: auto;
            text-align: center;
        }

        .infotextr {
            padding-top: 130px;
            font-size: 21px;
            width: 72%;
            margin: auto;
            text-align: center;
        }



       

        .profile {
            margin-top: 25px;
            border:5px ridge #80f152 ;
        }

            .profile h1 {
                font-weight: normal;
                font-size: 20px;
                margin: 10px 0 0 0;
            }

            .profile h2 {
                font-size: 14px;
                font-weight: lighter;
                margin-top: 5px;
            }

            .profile .img-box {
                opacity: 1;
                display: block;
                position: relative;
            }

                .profile .img-box:after {
                    content: "";
                    opacity: 0;
                    background-color: rgba(0, 0, 0, 0.3);
                    position: absolute;
                    right: 0;
                    left: 0;
                    top: 0;
                    bottom: 0;
                    border-radius:280px;
                    margin:11px;
                }

        .img-box ul {
            position: absolute;
            z-index: 2;
            bottom: 70px;
            text-align: center;
            width: 100%;
            padding-left: 0px;
            height: 0px;
            margin: 0px;
            opacity: 0;
        }

            .profile .img-box:after, .img-box ul, .img-box ul li {
                -webkit-transition: all 0.5s ease-in-out 0s;
                -moz-transition: all 0.5s ease-in-out 0s;
                transition: all 0.5s ease-in-out 0s;
            }

                .img-box ul i {
                    font-size: 20px;
                    letter-spacing: 10px;
                }

                .img-box ul li {
                    width: 30px;
                    height: 30px;
                    text-align: center;
                    border: 1px solid #88C425;
                    margin: 2px;
                    padding: 5px;
                    display: inline-block;
                }

        .img-box a {
            color: #fff;

        }

        .img-box:hover:after {
            opacity: 1;
        }

        .img-box:hover ul {
            opacity: 1;
        }

        .img-box ul a {
            -webkit-transition: all 0.3s ease-in-out 0s;
            -moz-transition: all 0.3s ease-in-out 0s;
            transition: all 0.3s ease-in-out 0s;
                        
        }

        .img-box a:hover li {
            border-color: #fff;
            color: #88C425;

        }

        a {
            color: #88C425;
        }
        .imgc{
            border-radius:280px;
            padding:20px;
        }

            a:hover {
                text-decoration: none;
                color: #519548;

            }

        i.red {
            color: #BC0213;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class=" bgimg">
                    <p class="heading">
                        We are guided and
                        <br />
                        Inspired By
                        <br />
                        <span style="font-size: 45px; font-weight: 900">Our Vision
                            <hr width="30%" style="border: 4PX GROOVE WHITE; position: relative; left: 164px;" />
                        </span>
                    </p>
                </div>
                <div class="container" style="padding: 50px">
                    <h2>About BonsaiKart</h2>
                    <br />
                    <p style="text-align: justify">The term bonsai literally means plant in a pot or tray planting. The history of bonsai is long and storied. Bonsai first appeared in china over a thousand years ago on a very basic scale, known as pun-Sai.</p>
                    <p style="text-align: justify">
                        The art of growing dwarfed ornamentally shaped trees or shrubs in small shallow pots or trays, a tree or shrub grown by this method. It is a web based application and it very helpful for selling the different types of bonsai tree through our bonsai tree industries system. Our system will provide to know about bonsai tree and through our system best bonsai tree it can buy. We are also providing how to care like, water, cultivating and its related material like fertilizers, seeds. This system will be using in tree industries, and main objective behind this system to help farmer, bonsai buyer, and interested person who know more about bonsai tree. 
This system will be work speedy, transparent, error free, greater performance, and gives better user interface. 
                    </p>
                </div>
                <div class="row">
                    <div class="col-md-6" style="background: linear-gradient(to bottom right,#12870b 0,#84f555 50%,#ace996 100%); height: 360px">
                        <p class="infotext">The object is not to make the tree look like a bonsai, but to make the bonsai look like a tree.</p>
                    </div>
                    <div class="col-md-6" style="background-color: red">
                        <img alt="" src="image/ci1.jpg" height="360px" width="100%" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6" style="background-color: red">
                        <img alt="" src="image/ci2.jpg" height="360px" width="100%" />
                    </div>

                    <div class="col-md-6" style="background: linear-gradient(to bottom right,#12870b 0,#84f555 50%,#ace996 100%); height: 360px">
                        <p class="infotextr">
                            Bonsai won the Chilean Critics Award for best novel of the year in 2006and it's easy to understand why.
                        </p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6" style="background: linear-gradient(to bottom right,#12870b 0,#84f555 50%,#ace996 100%); height: 360px">
                        <p class=" infotext">Be not afraid of growing slowly be a afraid only of standing still.</p>
                    </div>
                    <div class="col-md-6" style="background-color: red">
                        <img alt="" src="image/ci7.jpg" height="360px" width="100%" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6" style="background-color: red">
                        <img alt="" src="image/ci4.jpg" height="360px" width="100%" />
                    </div>

                    <div class="col-md-6" style="background: linear-gradient(to bottom right,#12870b 0,#84f555 50%,#ace996 100%); height: 360px">
                        <p class="infotextr">One of the most important tools of Bonsai is patience.</p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6" style="background: linear-gradient(to bottom right,#12870b 0,#84f555 50%,#ace996 100%); height: 360px">
                        <p class="infotext">The bonsai is not you working on the tree; you have to have the tree work on you </p>
                    </div>
                    <div class="col-md-6" style="background-color: red">
                        <img alt="" src="image/ci5.jpg" height="360px" width="100%" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6" style="background-color: red">
                        <img alt="" src="image/ci6.jpeg" height="360px" width="100%" />
                    </div>

                    <div class="col-md-6" style="background: linear-gradient(to bottom right,#12870b 0,#84f555 50%,#ace996 100%); height: 360px">
                        <p class="infotextr">Grow your Own Vegitables and Flowers</p>
                    </div>
                </div>

                <br />
                <div class=" container">
                    <div class="text-center">
                        <h1 style="margin-bottom:10px !important"><i >Our Team</i>
                            
                        </h1>
                        <hr width="30%" style="margin:auto ;border:10px ridge black" />
                    </div>
                    <div class="row">
                        <div class="col-md-6" style="padding:10px !important">

                            <div class=" profile text-center">
                                <div class="img-box">
                                    <img src="image/IMG_0184.JPG" class="img-responsive imgc">
                                    <ul class="text-center">
                                        <a href="#">
                                            <li><i class="fa fa-facebook"></i></li>
                                        </a>
                                        <a href="#">
                                            <li><i class="fa fa-twitter"></i></li>
                                        </a>
                                        <a href="#">
                                            <li><i class="fa fa-linkedin"></i></li>
                                        </a>
                                    </ul>
                                </div>
                                <h1>Shubham Brahmbhatt</h1>
                                <h2>Co-founder/ Operations</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                            </div>

                        </div>
                        <div class=" col-md-6" style="padding:10px !important">
                            <div class=" profile text-center">
                                <div class="img-box">
                                    <img src="image/tirth.jpg" class="img-responsive imgc">
                                    <ul class="text-center">
                                        <a href="#">
                                            <li><i class="fa fa-facebook"></i></li>
                                        </a>
                                        <a href="#">
                                            <li><i class="fa fa-twitter"></i></li>
                                        </a>
                                        <a href="#">
                                            <li><i class="fa fa-linkedin"></i></li>
                                        </a>
                                    </ul>
                                </div>
                                <h1>Tirth Mistry</h1>
                                <h2>Co-founder/ Operations</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

