<%@ Page Title="" Language="C#" MasterPageFile="~/user master page.master" AutoEventWireup="true" CodeFile="user_oder_details.aspx.cs" Inherits="user_oder_details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .any {
            margin: 20px;
        }

        .btnalign {
            position: relative;
            left: 76%;
            top: 54px;
        }

        .bggif {
            background-image: url(../image/giphy-downsized.gif);
            background-size: cover;
        }

        .address {
            font-size: 20px;
            font-family: Verdana;
            line-height: 1.8;
            font-weight: 500;
        }

        .table1 {
            width: 100%;
            padding: 90px;
        }

        .radius {
            border-radius: 20px;
            background: linear-gradient(rgba(138, 222, 45, 0.6), rgba(18, 232, 232, 0.6));
        }

        .redio1 {
            font-weight: 100 !important;
            margin: auto;
            zoom: 1.2;
        }

        .paymenth2 {
            padding: 5px;
            text-align: center;
            border-bottom: 6px groove #77f1e8;
            width: 24%;
            /* margin-top: 21px; */
            padding-bottom: 5px;
            margin: auto;
            /* background-color: red; */
            border-radius: 34px;
            background: linear-gradient(rgba(138, 222, 45, 0.6), rgba(18, 232, 232, 0.6));
        }

        hr.style18 {
            height: 30px;
            border-style: ridge;
            border-color: #77f1e8;
            border-width: 8px 0 0 0;
            border-radius: 20px;
            margin: auto;
            width: 80%;
        }

            hr.style18:before {
                display: block;
                content: "";
                height: 30px;
                margin-top: -31px;
                border-style: solid;
                border-color: #8c8b8b;
                border-width: 0 0 1px 0;
                border-radius: 20px;
            }

        .imgdiv {
            padding: 5px;
            border-right: 10px groove red;
            border-radius: 60px;
        }

        .aa {
            border-radius: 30px;
            box-shadow: -12px 12px 8px 4px;
        }

        .divpadding {
            padding: 36px;
        }

        .imgraduis {
            border-radius: 20px;
            margin: auto;
            Height: 191px;
            Width: 170px;
        }

        .fontsizelg {
            font-size: 20px;
            font-weight: bold;
            line-height: 1.9;
        }

        .lblfont {
            font-size: 20px;
            font-weight: 500;
        }

        .fontmg {
            font-size: 15px;
            font-weight: 300;
        }

        .aa1 {
            padding: 18px;
            line-height: 2.5;
        }

        .productdetail {
            border-left: 10px groove red;
            border-radius: 60px;
            height: 200px;
        }

        .addressbox {
            border: 3px solid black;
            padding: 20px;
            line-height: 1.9;
            margin-top: 67px !important;
            border-radius: 37px;
            width: 80%;
            margin: auto;
        }
        /*media query*/
        @media screen and (max-width: 1141px) and (min-width:992px) {
            .imgraduis {
                Width: 130px;
            }
        }

        @media screen and (max-width: 990px) and (min-width:571px) {
            .imgdiv {
                border-right: none !important;
                border-left: 10px groove red !important;
            }

            .aa1 {
                text-align: center;
            }

            .table1 {
                padding: 54px;
            }

            .aa {
                box-shadow: 12px 8px 4px;
            }
        }

        @media screen and (max-width: 571px) {
            .imgdiv {
                border-right: none !important;
                border-left: none !important;
            }

            .productdetail {
                border-left: none;
            }

            .aa1 {
                text-align: center;
                padding: 2px;
            }

            .table1 {
                padding: 15px;
            }
        }

        @media screen and (max-width: 370px) {
            .table1 {
                padding: 0px;
            }

            .fontsizelg {
                font-size: 15px;
            }
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
        </Triggers>
        <ContentTemplate>
            <asp:Label ID="lblmsg" runat="server" ></asp:Label>
            <div class="bggif">

                <div class="table1">
                    <asp:Wizard ID="Wizard1" runat="server" CssClass="radius" Width="100%" Font-Names="Verdana" Font-Size="0.8em" DisplaySideBar="false" OnNextButtonClick="Wizard1_NextButtonClick" FinishCompleteButtonText="pLace the oder" OnFinishButtonClick="Wizard1_FinishButtonClick">
                        <HeaderStyle BackColor="blue" BorderColor="#FFFBD6" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="#333333" />
                        <NavigationButtonStyle CssClass="btn btn-primary any" />
                        <SideBarButtonStyle ForeColor="White" />
                        <SideBarStyle CssClass="any" />
                        <WizardSteps>
                            <asp:WizardStep ID="WizardStep1" runat="server" Title="Adress">

                                <div id="first" class="col-md-12" style="text-align: center; background-color: #abec95; border-radius: 20px; font-size: 40px; border-bottom: 6px ridge #76f0e8;">
                                    Address
                                </div>

                                <asp:Panel ID="panaddress" runat="server" Visible="false">
                                    <div id="one">
                                        <div class="row">
                                            <div class="col-md-6" style="padding-top: 20px">
                                                <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" Placeholder="UserName" required></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtusername" FilterMode="ValidChars" ValidChars="abcdefghi jklmnopqrstuvwxyz"></cc1:FilteredTextBoxExtender>
                                            </div>
                                            <div class="col-md-6" style="padding-top: 20px">
                                                <asp:TextBox ID="txtphonenumber" runat="server" CssClass="form-control" Placeholder="Phone Number" required></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtphonenumber" FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789"></cc1:FilteredTextBoxExtender>
                                                <%-- <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtphonenumber" MinimumValue="10" MaximumValue="10"></asp:RangeValidator>--%>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <br />
                                                <asp:TextBox ID="txthouseno" runat="server" CssClass="form-control" Placeholder="Flat / House No. / Building" required></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <br />
                                            <div class="col-md-7">
                                                <asp:TextBox ID="txtstreet" runat="server" CssClass="form-control" Placeholder="Colony / Street / Locality" required></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtstreet" FilterMode="ValidChars" ValidChars="abcdefghi jklmnopqrstuvwxyz"></cc1:FilteredTextBoxExtender>
                                            </div>
                                            <div class="col-md-5">
                                                <asp:TextBox ID="txtlandmark" runat="server" CssClass="form-control" Placeholder="Landmark" required></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <br />
                                            <div class="col-md-8">
                                                <asp:TextBox ID="txtcity" runat="server" CssClass="form-control" Placeholder="City" required></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtcity" FilterMode="ValidChars" ValidChars="abcdefghi jklmnopqrstuvwxyz"></cc1:FilteredTextBoxExtender>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtpincode" runat="server" CssClass="form-control" Placeholder="Pincode" required></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtpincode" FilterMode="ValidChars" ValidChars="0123456789"></cc1:FilteredTextBoxExtender>
                                                <%--<asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtpincode" MinimumValue="6" MaximumValue="77"></asp:RangeValidator>--%>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <br />
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtstate" runat="server" CssClass="form-control" Placeholder="State" required></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtstate" FilterMode="ValidChars" ValidChars="abcdefghi jklmnopqrstuvwxyz"></cc1:FilteredTextBoxExtender>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtcountry" runat="server" CssClass="form-control" Placeholder="Country" required></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtcountry" FilterMode="ValidChars" ValidChars="abcdefghi jklmnopqrstuvwxyz"></cc1:FilteredTextBoxExtender>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="panrepert" runat="server">
                                    <div id="two">
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                            <ItemTemplate>

                                                <div class="addressbox">
                                                   
                                                    <div>
                                                        <span style="font-size: 20px; font-weight: bold">
                                                            <asp:Label ID="lblname" runat="server" Text='<%#Eval("user_name")%>'></asp:Label><br />
                                                        </span>
                                                        <asp:Label ID="lblhouseno" runat="server" Text='<%#Eval("house_no")%>'></asp:Label><br />
                                                        <asp:Label ID="lblstreet" runat="server" Text='<%#Eval("street")%>'></asp:Label>,
                                        <asp:Label ID="lbllandmark" runat="server" Text='<%#Eval("landmark")%>'></asp:Label><br />
                                                        <asp:Label ID="lblcity" runat="server" Text='<%#Eval("city")%>'></asp:Label>
                                                        --
                                        <asp:Label ID="lblpincode" runat="server" Text='<%#Eval("pincode")%>'></asp:Label><br />
                                                        <asp:Label ID="lblstate" runat="server" Text='<%#Eval("state")%>'></asp:Label>,
                                        <asp:Label ID="lblcountry" runat="server" Text='<%#Eval("country")%>'></asp:Label><br />
                                                        <asp:Label ID="lblphoneno" runat="server" Text='<%#Eval("phone_number")%>'></asp:Label>


                                                    </div>
                                                     <asp:Button ID="Button1" runat="server" Text="Shiping Address" CommandName="mdit" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-warning" />

                                                </div>

                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </div>
                                    <asp:Button ID="btnnewaddress" runat="server" CssClass="btn btn-primary btnalign" OnClick="btnnewaddress_Click" Text="Add New Address" />
                                </asp:Panel>



                            </asp:WizardStep>

                            <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2">
                                <div id="sec" class="col-md-12" style="text-align: center; background-color: #abec95; border-radius: 20px; font-size: 40px; border-bottom: 6px ridge #76f0e8;">
                                    Delivery & Payment
                                </div>
                                <asp:RadioButtonList ID="rbltime" runat="server" CssClass=" text-center redio1">
                                    <asp:ListItem Selected="True" Value="home time Delivery"><span style="font-size:15px; display:grid; ">Home Time Delivey<span style="font-size:10px ; font-weight:100">(time 8am - 8pm)</span></span></asp:ListItem>
                                    <asp:ListItem Value="office time Delivery" ><span style="font-size:15px; display:grid;">Office Time Delivey<span style="font-size:10px ; font-weight:100">(time 10am - 5pm)</span></span></asp:ListItem>
                                </asp:RadioButtonList>
                                <br />
                                <hr class="style18" />

                                <h2 class="paymenth2">Payment Option</h2>
                                <asp:RadioButtonList ID="rblpayment" runat="server" CssClass="redio1">
                                    <asp:ListItem Value="cod" Selected="True"><span style="font-size:15px; display:inline-grid; ">COD(Cash On Delivey)</span></asp:ListItem>
                                    <asp:ListItem Value="net banking"><span style="font-size:15px; display:inline-grid; ">Net Banking</span></asp:ListItem>
                                    <asp:ListItem><span style="font-size:15px; display:inline-grid; ">Debit Card</span></asp:ListItem>
                                    <asp:ListItem><span style="font-size:15px; display:inline-grid; ">Paytm</span></asp:ListItem>
                                    <asp:ListItem><span style="font-size:15px; display:inline-grid;">PayPal</span></asp:ListItem>
                                </asp:RadioButtonList>


                            </asp:WizardStep>

                            <asp:WizardStep ID="WizardStep3" runat="server" Title="Step 3">
                                <asp:Repeater ID="reproductload" runat="server">
                                    <ItemTemplate>
                                        <div class="divpadding">
                                            <div class="row aa">
                                                <div class="col-md-3 imgdiv">
                                                    <asp:Image ID="imgurl" runat="server" ImageUrl='<%#Eval("product_img_url")%>' CssClass="img-responsive imgraduis" />
                                                </div>
                                                <div class="col-md-9 productdetail">
                                                    <div class="aa1">

                                                        <asp:Label ID="lblname" runat="server" CssClass="fontsizelg" Text='<%#Eval("product_name")%>'></asp:Label>
                                                        <br />
                                                        <span style="font-weight: bold; font-size: 17px">Quntity : </span>
                                                        <asp:Label ID="Label1" runat="server" CssClass="fontmg" Text='<%#Eval("product_qty")%>'></asp:Label>
                                                        <br />
                                                        <span style="font-weight: bold; font-size: 17px">Price : ₹</span><asp:Label ID="Label2" runat="server" CssClass="fontmg" Text='<%#Eval("product_price")%>'></asp:Label>
                                                        <br />
                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                                <br />
                                <div class="divpadding">
                                    <div class="row">
                                        <div class=" col-md-5 aa">
                                            <h2 style="text-align: center; border-bottom: 1px dotted red; padding: 2px">Delivey Address</h2>
                                            <p style="padding-left: 20px">
                                                <asp:Label ID="lblbaddress" runat="server" CssClass="address" Text=""></asp:Label>
                                            </p>
                                        </div>
                                        <div class="col-md-2"></div>
                                        <div class=" col-md-5 aa">
                                            <h2 style="text-align: center; border-bottom: 1px dotted red; padding: 2px">Payment</h2>
                                            <p style="padding-left: 15px">
                                                <span style="font-size: 17px; font-weight: bold">Total Product : </span>
                                                <asp:Label ID="lblqty" runat="server" CssClass="lblfont"></asp:Label>
                                                <br />
                                                <span style="font-size: 17px; font-weight: bold">Grand Total :  ₹</span><asp:Label ID="lbltotal1" runat="server" CssClass="lblfont"></asp:Label>
                                            </p>
                                        </div>

                                    </div>
                                </div>

                            </asp:WizardStep>

                        </WizardSteps>
                    </asp:Wizard>
                </div>
            </div>

            <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
            <script>
                window.sr = ScrollReveal();


                sr.reveal('#first', {
                    origin: 'bottom',
                    // Can be any valid CSS distance, e.g. '5rem', '10%', '20vw', etc.
                    //distance: '20px',
                    // Time in milliseconds.
                    duration: 2000,
                    //delay: 0,
                });

                sr.reveal('.row', {
                    origin: 'bottom',
                    // Can be any valid CSS distance, e.g. '5rem', '10%', '20vw', etc.
                    distance: '20px',
                    // Time in milliseconds.
                    duration: 2000,
                    //delay: 0,
                });
                sr.reveal('h2', {
                    origin: 'bottom',
                    // Can be any valid CSS distance, e.g. '5rem', '10%', '20vw', etc.
                    distance: '20px',
                    // Time in milliseconds.
                    duration: 2000,
                    //delay: 0,
                });
                sr.reveal('#sec', {
                    origin: 'bottom',
                    // Can be any valid CSS distance, e.g. '5rem', '10%', '20vw', etc.
                    distance: '20px',
                    // Time in milliseconds.
                    duration: 2000,
                    //delay: 0,
                });
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

