<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_master page.master" AutoEventWireup="true" CodeFile="Add_plant.aspx.cs" Inherits="Admin_Add_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <Triggers>
            <asp:PostBackTrigger ControlID="btnAdd" />
        </Triggers>
        <ContentTemplate>
            <div class="container">
                
                <div class="container">
                    <div class="form-horizontal">
                        <h2>Add Plant</h2>
                        <hr />
                        <br />
                        <div class="form-group">
                           <span class="col-md-2 control-label" > Plant Name :-</span>
                            <%--<asp:Label ID="lblname" runat="server" CssClass="col-md-2 control-label" Text="Plant Name :-"></asp:Label>--%>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtplname" runat="server" CssClass=" form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvname" runat="server" ErrorMessage="Required this Filed" ValidationGroup="1" ControlToValidate="txtplname"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblprice" runat="server" CssClass="col-md-2 control-label" Text="Plant Price :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtplprice" runat="server" CssClass=" form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="1" ErrorMessage="Required this Filed" ControlToValidate="txtplprice"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblbrand" runat="server" CssClass="col-md-2 control-label" Text="Plant Brand :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtbrand" runat="server" CssClass=" form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="1" ErrorMessage="Required this Filed" ControlToValidate="txtbrand"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblqty" runat="server" CssClass="col-md-2 control-label" Text="Plant Quantity :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtqty" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="1" ErrorMessage="Required this Filed" ControlToValidate="txtqty"></asp:RequiredFieldValidator>
                            </div>
                        </div>


                        <div class="form-group">
                            <asp:Label ID="lblcategory" runat="server" CssClass="col-md-2 control-label" Text="Plant Category :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddlcategory" runat="server" CssClass="form-control">
                                    <asp:ListItem>InDoor Plant</asp:ListItem>
                                    <asp:ListItem>OutDoor Plant</asp:ListItem>
                                    <asp:ListItem>Bamboos Plant</asp:ListItem>
                                    <asp:ListItem>Tiny Plant</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="1" ErrorMessage="Required this Filed" ControlToValidate="ddlcategory"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lbldescription" runat="server" CssClass="col-md-2 control-label" Text="Plant Description :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtdescription" runat="server" CssClass=" form-control" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="1" ErrorMessage="Required this Filed" ControlToValidate="txtdescription"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lbldetails" runat="server" CssClass="col-md-2 control-label" Text="Plant Details :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtdetails" runat="server" CssClass=" form-control" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="1" ErrorMessage="Required this Filed" ControlToValidate="txtdetails"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblimg1" runat="server" CssClass="col-md-2 control-label" Text=" Plant Image 1 :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:FileUpload ID="fupimg1" runat="server" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="1" ErrorMessage="Required this Filed" ControlToValidate="fupimg1"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblimg2" runat="server" CssClass="col-md-2 control-label" Text="Plant Image 2 :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:FileUpload ID="Fuimg" runat="server" CssClass="form-control" />
                                <br />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblimg3" runat="server" CssClass="col-md-2 control-label" Text="Plant Image 3 :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:FileUpload ID="fupimg2" runat="server" CssClass="form-control" />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblfree" runat="server" CssClass="col-md-2 control-label" Text=" Free Delivery :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:CheckBox ID="cbfree" runat="server" CssClass="checkbox checkbox-inline" />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblreturen" runat="server" CssClass="col-md-2 control-label" Text=" 10 day Returen :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:CheckBox ID="cbreturen" runat="server" CssClass="checkbox checkbox-inline" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <asp:Button ID="btnAdd" runat="server" ValidationGroup="1" OnClick="btnAdd_Click" Text="Add Product" CssClass="btn btn-default" />
                            </div>
                        </div>


                    </div>

                </div>
                          </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

