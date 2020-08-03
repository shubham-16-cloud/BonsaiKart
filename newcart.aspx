<%@ Page Title="" Language="C#" MasterPageFile="~/user master page.master" AutoEventWireup="true" CodeFile="newcart.aspx.cs" Inherits="newcart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .imagebackground {
            background-position: center;
            background-image: url(../image/luca-bravo-149740.jpg);
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            text-align: center;
            padding-top: 45px;
            padding-bottom: 45px;
        }

            .imagebackground::after {
                content: "";
                position: absolute;
                left: 0;
                right: -146px;
                left: -130px;
                margin: auto;
                width: 35%;
                height: 5px !important;
                background-image: url(../image/pricebox_heder.png);
            }

        .priceboxtext {
            color: white;
            font-family: 'Segoe UI';
            font-size: 14px;
            line-height: 3;
        }

        .linkbtnsize {
            font-size: 20px;
            width: 100%;
            background-color: orange;
            color: white;
        }

        .onchange1 {
            transition: width 5s;
            position: fixed;
            top: 10px;
            width: 27%;
        }

        .pull-right1 {
            float: right;
        }

        .onchange {
            padding: 0px 15px 0px 15px;
            margin-right: -14.5px;
            background-color: black;
            border-radius: 10px;
        }

        .imghadow {
            border-radius: 10px;
            box-shadow: 0px 2px 12px 6px green;
        }
    </style>

    <script type="text/javascript">
        function ToggleDiv1() {
            document.getElementById('mymodal').style.display = 'block';
            //$('mymodal').modal('show');
        }
    </script>

    <script language="javascript" type="text/javascript">

        function sumCalc() {

            var txt1 = document.getElementById('<%= lblsubtotal.ClientID %>');

            var txt3 = document.getElementById('<%= lbltotal.ClientID %>');


            var t1 = 0, t2 = 0;

            t1 = txt1.innerText;
            t2 = 50;

            txt3.innerText = parseInt(t1) + parseInt(t2);


        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>

            <asp:AsyncPostBackTrigger ControlID="lvcart" EventName="ItemCommand" />
            <asp:PostBackTrigger ControlID="btnsave" />


        </Triggers>
        <ContentTemplate>
            <div>
                <asp:Label ID="lblmsg" runat="server" ></asp:Label>
                <div class=" imagebackground img-responsive">
                    <h1>SHOPPING CART
                    </h1>
                    <h3>Destination of Shopping
                    </h3>
                </div>

                <div class="container">
                    <div id="head" style="background-color: gray; border-radius: 10px; padding: 20px; margin-top: 10px; margin-bottom: 10px;">
                        Happy Shop
                    </div>

                    <div class="row">
                        <!--product viwe-->
                        <div id="left" class="col-md-8" style="border: 5px groove aqua; border-radius: 10px; border-top: 2px dashed white">
                            <div style="background-color: gray; padding: 20px; border-radius: 9px; margin-left: -15px; margin-right: -15px">
                                <h2 style="margin-top: 0px !important">
                                    <asp:Label ID="lblcount" runat="server"></asp:Label>
                                </h2>
                            </div>
                            <!--listViwe Start-->
                            <asp:ListView ID="lvcart" runat="server" DataKeyNames="productID" OnItemCommand="lvcart_ItemCommand">

                                <AlternatingItemTemplate>
                                    <div id="alleft" class="row" style="border-bottom: 2px dotted aqua">
                                        <div class="col-md-2">
                                            <br />
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("product_img_url") %>' CssClass="img-responsive imghadow" Width="100px" Height="100px" />
                                        </div>
                                        <div class="col-md-8" style="line-height: 2; margin-top: -7px">
                                            <br />
                                            Product Name :-
                                            <asp:Label ID="product_nameLabel" runat="server" Text='<%# Eval("product_name") %>' />
                                            <br />
                                            Price :-
                                    <asp:Label ID="product_priceLabel" runat="server" Text='<%# Eval("product_price") %>' />
                                            <br />
                                            Product Qty :-
                                    <asp:Label ID="product_qtyLabel" runat="server" Text='<%# Eval("product_qty") %>' />
                                            <br />
                                            <asp:Button ID="btndelete" runat="server" Text="Remove" CommandName="mdelete" CommandArgument='<%# Eval("productID") %>' CssClass="btn btn-info" />
                                            <asp:Button ID="btnedit" runat="server" Text="Edit" CommandName="medit" CommandArgument='<%# Eval("productID") %>' CssClass="btn btn-info" />
                                            <br />
                                            <br />

                                        </div>
                                    </div>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <span style="">
                                        userID:
                                    <asp:TextBox ID="userIDTextBox" runat="server" Text='<%# Bind("userID") %>' />
                                        <br />
                                        productID:
                                    <asp:TextBox ID="productIDTextBox" runat="server" Text='<%# Bind("productID") %>' />
                                        <br />
                                        product_name:
                                    <asp:TextBox ID="product_nameTextBox" runat="server" Text='<%# Bind("product_name") %>' />
                                        <br />
                                        product_price:
                                    <asp:TextBox ID="product_priceTextBox" runat="server" Text='<%# Bind("product_price") %>' />
                                        <br />
                                        product_qty:
                                    <asp:TextBox ID="product_qtyTextBox" runat="server" Text='<%# Bind("product_qty") %>' />
                                        <br />
                                        product_img_url:
                                    <asp:TextBox ID="product_img_urlTextBox" runat="server" Text='<%# Bind("product_img_url") %>' />
                                        <br />
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                        <br />
                                        <br />
                                    </span>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <span style="font-size: 20PX">No data was returned.</span>
                                   <div>
                                       <img alt="" src="image/empty_cart_800x600_dribbble_teaser.png" class="img-responsive" style="margin: auto; height: 200px;" />
                                       <h2 class="text-center">Your Cart Is Empty</h2>
                                       <p class="text-center"><a class="btn btn-primary" href="userpage_main1.aspx">Continue Shoping</a></p>
                                       
                                   </div>
                                </EmptyDataTemplate>
                                <InsertItemTemplate>
                                    <span style="">userID:
                                    <asp:TextBox ID="userIDTextBox" runat="server" Text='<%# Bind("userID") %>' />
                                        <br />
                                        productID:
                                    <asp:TextBox ID="productIDTextBox" runat="server" Text='<%# Bind("productID") %>' />
                                        <br />
                                        product_name:
                                    <asp:TextBox ID="product_nameTextBox" runat="server" Text='<%# Bind("product_name") %>' />
                                        <br />
                                        product_price:
                                    <asp:TextBox ID="product_priceTextBox" runat="server" Text='<%# Bind("product_price") %>' />
                                        <br />
                                        product_qty:
                                    <asp:TextBox ID="product_qtyTextBox" runat="server" Text='<%# Bind("product_qty") %>' />
                                        <br />
                                        product_img_url:
                                    <asp:TextBox ID="product_img_urlTextBox" runat="server" Text='<%# Bind("product_img_url") %>' />
                                        <br />
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                        <br />
                                        <br />
                                    </span>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <div id="alleft" class="row" style="border-bottom: 2px dotted aqua">
                                        <div class="col-md-2">
                                            <br />
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("product_img_url") %>' CssClass="img-responsive imghadow" Width="100px" Height="100px" />
                                        </div>
                                        <div class="col-md-8" style="line-height: 2; margin-top: -7px">
                                            <br />
                                            Product Name :-
                                            <asp:Label ID="product_nameLabel" runat="server" Text='<%# Eval("product_name") %>' />
                                            <br />
                                            Price :-
                                    <asp:Label ID="product_priceLabel" runat="server" Text='<%# Eval("product_price") %>' />
                                            <br />
                                            Product Qty :-
                                    <asp:Label ID="product_qtyLabel" runat="server" Text='<%# Eval("product_qty") %>' />
                                            <br />
                                            <asp:Button ID="btndelete" runat="server" Text="Remove" CommandName="mdelete" CommandArgument='<%# Eval("productID") %>' CssClass="btn btn-info" />
                                            <asp:Button ID="btnedit" runat="server" Text="Edit" CommandName="medit" CommandArgument='<%# Eval("productID") %>' CssClass="btn btn-info" />
                                            <br />
                                            <br />

                                        </div>
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
                                    <span style="">id:
                                   
                                        <br />
                                        userID:
                                    <asp:Label ID="userIDLabel" runat="server" Text='<%# Eval("userID") %>' />
                                        <br />
                                        productID:
                                    <asp:Label ID="productIDLabel" runat="server" Text='<%# Eval("productID") %>' />
                                        <br />
                                        product_name:
                                    <asp:Label ID="product_nameLabel" runat="server" Text='<%# Eval("product_name") %>' />
                                        <br />
                                        product_price:
                                    <asp:Label ID="product_priceLabel" runat="server" Text='<%# Eval("product_price") %>' />
                                        <br />
                                        product_qty:
                                    <asp:Label ID="product_qtyLabel" runat="server" Text='<%# Eval("product_qty") %>' />
                                        <br />
                                        product_img_url:
                                    <asp:Label ID="product_img_urlLabel" runat="server" Text='<%# Eval("product_img_url") %>' />
                                        <br />
                                        <br />
                                    </span>
                                </SelectedItemTemplate>

                            </asp:ListView>

                            <!--ListViwe End-->

                        </div>
                        <!--product viwe end-->

                        <!--pricebox start-->
                        <div id="right" class="col-md-4" onload="sumCalc()">
                            <div id="pricebox" class="onchange">
                                <div style="padding: 20px">
                                    <p style="color: aqua; font-size: 23px; text-align: center">SUMMARY</p>
                                    <hr />
                                    <span class="priceboxtext">SUB TOTAL :- </span>
                                    <asp:Label ID="lblsubtotal" runat="server" Text="200" CssClass=" pull-right1 priceboxtext"></asp:Label>
                                    <br />
                                    <span class="priceboxtext">DELIVERY CHARGE :-</span><asp:Label ID="lblcharge" runat="server" Text="50" CssClass="pull-right1 priceboxtext"></asp:Label>
                                    <hr style="border: 3px dotted aqua;" />
                                    <span class="priceboxtext">TOTAL :-</span><asp:Label ID="lbltotal" runat="server" Text="250" CssClass="pull-right1 priceboxtext"></asp:Label>
                                    <br />
                                    <hr />
                                    <br />
                                    <asp:LinkButton runat="server" ID="lbFoo" CssClass="btn btn-default linkbtnsize" OnClick="lbFoo_Click">
                                             <i style="font-size: 25px;text-align: center;display: flow-root; padding-bottom: 7px;" class="glyphicon glyphicon-check" aria-hidden="true"></i> Proceed To CheckOut
                                    </asp:LinkButton>

                                </div>
                            </div>
                        </div>
                        <!--pricebox end-->
                    </div>


                </div>

                <!-- Modal -->
                <div class="modal fade" id="mymodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <span class="modal-title" id="exampleModalLongTitle">Modal title</span>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <asp:Image ID="imgmodal" runat="server" Width="100px" Height="100px" CssClass="img-responsive imghadow" />
                                    </div>

                                    <div class="col-md-9" style="line-height: 2.9; margin-top: -7px">
                                        <asp:Literal ID="ltid" runat="server" Visible="false"></asp:Literal>
                                        Product Name :-
                                            <asp:Label ID="modalname" runat="server" />
                                        <br />
                                        Price :-
                                            <asp:Label ID="modalprice" runat="server" />
                                        <br />
                                        Product Qty :-
                                          <asp:DropDownList ID="modalqty" runat="server" CssClass="dropdown-toggle btn btn-default"></asp:DropDownList>
                                        <br />
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <asp:Button ID="btnsave" runat="server" OnClick="btnsave_Click" Text="Save Changes" CssClass="btn btn-info" />
                            </div>
                        </div>
                    </div>
                </div>
                <!--modal end-->
            </div>

            <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
            <script>
                window.sr = ScrollReveal();

                sr.reveal('.imagebackground h1', {
                    origin: 'bottom',
                    duration: 2000,
                });
                sr.reveal('.imagebackground h3', {
                    origin: 'bottom',
                    duration: 2000,
                });
                sr.reveal('#head', {
                    origin: 'bottom',
                    duration: 2000,
                });
                sr.reveal('#left', {
                    origin: 'left',
                    distance: '100px',
                    delay: 500,
                    duration: 2000,
                });
                sr.reveal('#right', {
                    origin: 'right',
                    delay: 500,
                    distance: '100px',
                    duration: 2000,
                });
                sr.reveal('#alleft', {
                    origin: 'top',
                    duration: 1000,
                });

            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

