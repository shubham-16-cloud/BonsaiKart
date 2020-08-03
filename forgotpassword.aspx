<%@ Page Title="" Language="C#" MasterPageFile="~/user master page.master" AutoEventWireup="true" CodeFile="forgotpassword.aspx.cs" Inherits="forgotpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .gly {
            display: block;
            text-align: center !important;
        }

        .modal {
            position: fixed;
            z-index: 999;
            height: 100%;
            width: 100%;
            top: 0;
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
        }

        .center {
            z-index: 1000;
            margin: 300px auto;
            padding: 10px;
            width: 130px;
            background-color: White;
            border-radius: 10px;
            filter: alpha(opacity=100);
            opacity: 1;
            -moz-opacity: 1;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="upforgot" runat="server">
        <ContentTemplate>
            <div class="forgot">
                <div id="div">
                    <i class="glyphicon glyphicon-lock gly" style="font-size: 100px; text-align: center"></i>
                    <h2 style="text-align: center">forgot Password</h2>
                    <br />
                    <hr />
                    <div class=" form-group">
                        <p>Plese Enter youer regitested Email Address.. </p>

                        <asp:UpdateProgress ID="up" runat="server">
                            <ProgressTemplate>
                                <div class="">
                                    <div class="">
                                        <asp:Image ID="imgUpdateProgress" runat="server"  ImageUrl="~/image/mickey-loading.gif" />
                                    </div>
                                </div>
                                
                            </ProgressTemplate>
                        </asp:UpdateProgress>

                        <h4>Email ID <i class="glyphicon glyphicon-envelope"></i></h4>

                        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Enter email ID"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfemail" runat="server" ControlToValidate="txtemail" ErrorMessage="Plese enter email" ValidationGroup="2"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="*plese enter valid email-ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="2"></asp:RegularExpressionValidator>

                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        <br />
                        <br />

                        <asp:Button ID="btnsendemail" runat="server" CssClass="btn btn-success" Text="Send mail" OnClick="btnsendemail_Click" ValidationGroup="2" />
                    </div>
                </div>
            </div>

            <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
            <script>
                window.sr = ScrollReveal();


                sr.reveal('.forgot div i', {
                    origin: 'right',
                    rotate: { x: 400, y: 10, z: 0 },
                    distance: '230px',
                    duration: 2000,
                    //delay: 0,
                });
                sr.reveal('.forgot div h2', {
                    origin: 'right',
                    rotate: { x: 400, y: 10, z: 0 },
                    distance: '230px',
                    // Can be any valid CSS distance, e.g. '5rem', '10%', '20vw', etc.
                    duration: 2000,
                    // Time in milliseconds.


                });
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

