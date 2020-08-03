<%@ Page Title="" Language="C#" MasterPageFile="~/user master page.master" AutoEventWireup="true" CodeFile="signUp_page.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/jquery-3.2.1.js"></script>
    


    <script type="text/javascript">
        $(document).ready(function () {
            $(function () {
                $('#txtbirthdate').datepicker({

                    yearRange: (new Date().getFullYear() - 112).toString() + ':' + (new Date().getFullYear() - 15).toString(),
                    changeYear: true,
                    changeMonth: true,
                    format: 'dd/mm/yyyy'
                });
            })


        });
        function validate() {
            if (new Date(document.getElementById('txtbirthdate').value) > new Date()) {
                alert("You entered future date, that is not valid");
                document.getElementById('txtbirthdate').value = '';
            }
        }


        $(document).ready(function () {
            $('#txtpassword','#txtconfirm').bind("cut copy paste", function (e) {
                e.preventDefault(); //disable cut,copy,paste
            });
        });

      

    </script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <body>
                <div class="container-fluid">


                    <div class="singupbox">
                        <br />
                        <div id="sing" class="form-group">
                            <p>
                                <h4 style="font-size: 12px" class="text-center text-danger">&nbsp &nbsp &nbsp &nbsp*All Textbox  Requried.. &nbsp &nbsp &nbsp &nbsp</h4>
                                <p>
                                </p>
                                <h4 class="h4">Username <i class="glyphicon glyphicon-user"></i></h4>
                                <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" Placeholder="Enter Your Name">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfusername" runat="server" ControlToValidate="txtusername" CssClass=" texterroe" ErrorMessage="Plese enter name" ValidationGroup="2"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtusername"
                                    ValidationExpression="^[a-zA-Z0-9]+$" ErrorMessage="no special character" CssClass=" texterroe" ValidationGroup="2"></asp:RegularExpressionValidator>
                                <br />


                                <h4 class="h4">Email <i class="glyphicon glyphicon-envelope"></i></h4>
                                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" Placeholder="Enter Your email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfemail" runat="server" ControlToValidate="txtemail" CssClass=" texterroe" ErrorMessage="Plese enter email" ValidationGroup="2"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" CssClass=" texterroe" ErrorMessage="*plese enter valid email-ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="2"></asp:RegularExpressionValidator>
                                <br />


                                <h4 class="h4">Birthday <i class="glyphicon glyphicon-calendar"></i></h4>
                                <asp:TextBox ID="txtbirthdate" runat="server" ClientIDMode="Static" Placeholder="Enter your Birthdate" CssClass=" form-control "></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvBirthdate" runat="server" ControlToValidate="txtbirthdate" ValidationGroup="2" ErrorMessage="Plese enter birthdate" CssClass="texterroe"></asp:RequiredFieldValidator>

                                <br />


                                <h4 class="h4">Password <i class="glyphicon glyphicon-lock"></i></h4>
                                <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Enter Your password"></asp:TextBox>
                                <p>(Minimu 8 char atleast 1 UpperCase Alphabet,<br />
                                    1 LowerCase Alphabet,1 Number,1 Special char)</p>
                                <asp:RequiredFieldValidator ID="rfpassword" runat="server" ControlToValidate="txtpassword" CssClass=" texterroe" ErrorMessage=" Plese create password" ValidationGroup="2"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="plese enter valid password" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$" ControlToValidate="txtpassword" ValidationGroup="2" CssClass="texterroe"></asp:RegularExpressionValidator>
                                <br />


                                <h4 class="h4">Confirm Password <i class="glyphicon glyphicon-lock"></i></h4>
                                <asp:TextBox ID="txtconfirm" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Re-enter Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfconfirmpassword" runat="server" ControlToValidate="txtconfirm" CssClass=" texterroe" ErrorMessage="Plese re-enter password" ValidationGroup="2"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpassword" ControlToValidate="txtconfirm" CssClass=" texterroe" ErrorMessage="*Plese enter valid password" ValidationGroup="2"></asp:CompareValidator>
                                <br />
                                <br />

                                <asp:Button ID="btnsingup" runat="server" CssClass="btn btnsignup btn-success" OnClientClick="validate()" OnClick="btnsingup_Click" Text="Sign Up" ValidationGroup="2" />
                                <br />
                                <br />
                                <br />


                                <hr class="stylehr" />
                                <br />
                                <br />

                                <asp:ImageButton ID="ibfacebook" runat="server" CssClass="btn btn-primary img-rounded btnfacebook" Height="50px" ImageUrl="~/image/facebook-login.png" />
                                <asp:LinkButton ID="lbsignup" runat="server" CssClass="btn btn-success" OnClick="lbsingup_Click"><span style="margin-left:10px">Go to LogIn =&gt;&gt;</span></asp:LinkButton>
                            </p>

                        </div>

                    </div>
                </div>
            </body>
            <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
            <script>
                window.sr = ScrollReveal();


                sr.reveal('.singupbox ', {
                    // origin: 'right',
                    // Can be any valid CSS distance, e.g. '5rem', '10%', '20vw', etc.
                    //  distance: '29px',
                    rotate: { x: 900, y: 10, z: 0 },

                    // Time in milliseconds.
                    duration: 2000,
                    //delay: 0,
                });

            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


