<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_master page.master" AutoEventWireup="true" CodeFile="Add_seeds.aspx.cs" Inherits="Admin_Add_seeds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="updateseed" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnAddseed" />
        </Triggers>
        <ContentTemplate>
            <div class=" container">
        <div class=" container">
            <div class="form-horizontal">
                <h2>Add Seeds</h2>
                <hr /><br />

                <div class="form-group">
                    <asp:Label ID="lblname" runat="server" CssClass="col-md-2 control-label" Text="Seed Name :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtsename" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtsename" ErrorMessage="Required Textbox"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblcname" runat="server" CssClass="col-md-2 control-label" Text="Seed Common Name :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtsecname" runat="server" CssClass="form-control"></asp:TextBox>
                        <br />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblqty" runat="server" CssClass="col-md-2 control-label" Text="Seed Quantity :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtseqty" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtseqty" ErrorMessage="Required Textbox"></asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class="form-group">
                    <asp:Label ID="lblcolor" runat="server" CssClass="col-md-2 control-label" Text="Flower Color :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtsecolor" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtsecolor" ErrorMessage="Required Textbox"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblprice" runat="server" CssClass="col-md-2 control-label" Text="Seed Price :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtseprice" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtseprice" ErrorMessage="Required Textbox"></asp:RequiredFieldValidator>
                    </div>
                </div>

                 <div class="form-group">
                    <asp:Label ID="lblcategory" runat="server" CssClass="col-md-2 control-label" Text="Seed Category :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlcategory" runat="server" CssClass="form-control">
                            <asp:ListItem>Vegetable Seeds </asp:ListItem>
                            <asp:ListItem>Flower Seeds</asp:ListItem>
                            <asp:ListItem>Tree Seeds</asp:ListItem>
                            <asp:ListItem>Other..</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlcategory" ErrorMessage="Required Textbox"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lbldescrption" runat="server" CssClass="col-md-2 control-label" Text="Seed Description :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtsedescription" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        <br />
                    </div>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="lblcontains" runat="server" CssClass="col-md-2 control-label" Text="Seed Contains :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtsecontain" runat="server" CssClass="form-control"></asp:TextBox>
                        <span class=" sr-only-focusable" style="font-size:0.8em; color:#b59696">(Per 1 Packet)</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtsecontain" ErrorMessage="Required Textbox"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lbltime" runat="server" CssClass="col-md-2 control-label" Text="Seed Bloom Time :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtsetime" runat="server" CssClass="form-control"></asp:TextBox>
                        <br />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblheight" runat="server" CssClass="col-md-2 control-label" Text="Seed Height :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtseheight" runat="server" CssClass="form-control"></asp:TextBox>
                        <br />

                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lbldiff" runat="server" CssClass="col-md-2 control-label" Text="Seed Grow to Diffculty :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddldiffculty" runat="server" CssClass="form-control">
                            <asp:ListItem>Very Easy</asp:ListItem>
                            <asp:ListItem>Easy</asp:ListItem>
                            <asp:ListItem>Normal</asp:ListItem>
                            <asp:ListItem>Hard</asp:ListItem>
                            <asp:ListItem>Very Hard</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                    </div>
                </div>

                 <div class="form-group">

                            <asp:Label ID="lblimg" runat="server" CssClass="col-md-2 control-label" Text="Seed Image :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:FileUpload ID="fuimg" runat="server" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="fuimg" ErrorMessage="Required Textbox"></asp:RequiredFieldValidator>

                            </div>
                        </div>

                     <div class="form-group">
                            <asp:Label ID="lblfee" runat="server" CssClass="col-md-2 control-label" Text=" Free Delivery :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:CheckBox ID="cbfree" runat="server" CssClass="checkbox checkbox-inline" />
                            </div>
                        </div>

                        <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnAddseed" runat="server" OnClick="btnAddseed_Click" Text="Add Seeds" CssClass="btn btn-default" />
                </div>
            </div>




            </div>

        </div>

    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>

