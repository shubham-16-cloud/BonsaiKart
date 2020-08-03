<%@ Page Title="" Language="C#" MasterPageFile="~/user master page.master" AutoEventWireup="true" CodeFile="contact _us_page.aspx.cs" Inherits="contact__us_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .bg {
            background-image: url(../image/bg-01.jpg);
            background-size: cover;
        }

        .bgcolor {
            /*background-color: rgba(132,106,221,0.9);*/
            background-color:rgba(91, 200, 94, 0.74);
            background-size: cover;
            padding: 15px;
            justify-content: center;
        }

        .maindiv {
            width: 80%;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            padding: 100px 130px 109px 148px;
            margin: auto;
        }

        .fromtextboxdiv {
            position: relative;
            width: 100%;
            z-index: 1;
            margin-bottom: 10px;
        }

        .textbox {
            display: block;
            width: 100%;
            background: #e6e6e6;
            font-family: Montserrat-Bold;
            font-size: 15px;
            line-height: 1.5;
            color: #666666;
            height: 50px;
            border-radius: 25px;
            padding: 0 30px 0 50px;
            outline: none;
            border: none;
        }

        .icon {
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            align-items: center;
            position: absolute;
            border-radius: 25px;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100%;
            padding-left: 30px;
            pointer-events: none;
            color: #aaaaaa;
            font-size: 15px;
            -webkit-transition: all 0.4s;
            -o-transition: all 0.4s;
            -moz-transition: all 0.4s;
            transition: all 0.4s;
        }

        .multiline {
            padding-top: 14px;
            min-height: 170px;
        }

        .btnsend {
            width: 100%;
            height: 50px;
            border-radius: 25px;
            background: #846add;
            font-family: Montserrat-Bold;
            font-size: 15px;
            line-height: 1.5;
            color: #fff;
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 25px;
            -webkit-transition: all 0.4s;
            transition: all 0.4s;
            outline: none;
            border: none;
        }

            .btnsend:hover {
                background: black;
            }
            #img1:hover{
                background-color:gray;
                transform: rotate(10deg);
                transition-duration: 5s;
            }

        /*media query*/
        @media screen and (max-width: 630px) {
            .maindiv {
                width: 90%;
                padding: 60px 60px 60px 60px;
            }
        }
    </style>
    <script>
        function ToggleDiv1() {
            document.getElementById('mes').style.display = 'block';
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class=" bg">
                <div class="bgcolor">
                    <div class=" maindiv">
                        <h2 style="margin: AUTO; padding-bottom: 60px;">Get In Touch</h2>
                        <div class="row" style="width: 100%">
                            <div class="col-md-6">
                                <img id="img1" alt="img" src="image/img-01.png" />
                            </div>
                            <div class="col-md-6">
                                <div>
                                    <div class=" fromtextboxdiv">
                                        <asp:TextBox ID="txtname" runat="server" CssClass=" textbox " Placeholder="Name" required></asp:TextBox>
                                        <span class="icon">
                                            <i class="fa fa-user"></i>
                                        </span>
                                    </div>

                                    <div class=" fromtextboxdiv">
                                        <asp:TextBox ID="txtemail" runat="server" CssClass=" textbox " Placeholder="Email" required></asp:TextBox>
                                        <span class="icon">
                                            <i class="fa fa-envelope"></i>
                                        </span>
                                    </div>

                                    <div class=" fromtextboxdiv">
                                        <asp:TextBox ID="txtmessage" runat="server" TextMode="MultiLine" CssClass=" textbox multiline " Placeholder="Message" required></asp:TextBox>
                                    </div>

                                    <asp:UpdateProgress ID="up" runat="server">
                                                                <ProgressTemplate>
                                                                            <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/image/wait.gif"  />
                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>

                                    <div class="fromtextboxdiv">
                                        <asp:Button ID="btunsend" runat="server" Text="Send" CssClass="btnsend" OnClick="btunsend_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="mes" style="width:100%; display:none " class="alert alert-success">
                            Thank You For Your Support.
                        </div>
                    </div>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

