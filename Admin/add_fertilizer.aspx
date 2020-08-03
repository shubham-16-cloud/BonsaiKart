﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_master page.master" AutoEventWireup="true" CodeFile="add_fertilizer.aspx.cs" Inherits="Admin_add_fertilizer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <Triggers>
            <asp:PostBackTrigger ControlID="btnAdd" />
        </Triggers>
       
        <ContentTemplate>
            <div class="container">
                <div class="container">
                    <div class="form-horizontal">
                        <h2>Add Fertilizer</h2>
                        <hr />
                        <br />

                        <div class="form-group">
                            <asp:Label ID="lblname" runat="server" CssClass="col-md-2 control-label" Text="Name :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvname" runat="server" ErrorMessage="Required Field" ControlToValidate="txtname" ValidationGroup="1"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblprice" runat="server" CssClass="col-md-2 control-label" Text="Price :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtprice" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="txtprice" ValidationGroup="1"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblqty" runat="server" CssClass="col-md-2 control-label" Text="Qty :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtqty" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ControlToValidate="txtqty" ValidationGroup="1"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lbldetail" runat="server" CssClass="col-md-2 control-label" Text="Details :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtdetail" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                <br />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblweight" runat="server" CssClass="col-md-2 control-label" Text="Weight :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtweight" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required Field" ControlToValidate="txtweight" ValidationGroup="1"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblcontaint" runat="server" CssClass="col-md-2 control-label" Text="Containt per packets :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtcontaint" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required Field" ControlToValidate="txtcontaint" ValidationGroup="1"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblfeature" runat="server" CssClass="col-md-2 control-label" Text="feature :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtfeature" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                <br />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lbluse" runat="server" CssClass="col-md-2 control-label" Text="Use :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtuse" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                <br />
                            </div>
                        </div>

                                                <div class="form-group">
                            <asp:Label ID="lblimg" runat="server" CssClass="col-md-2 control-label" Text=" Upload Image :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:FileUpload ID="fuimg" runat="server" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required Field" ControlToValidate="fuimg" ValidationGroup="1"></asp:RequiredFieldValidator>
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
                                <br />
                                <asp:Button ID="btnAdd" runat="server" ValidationGroup="1" OnClick="btnAdd_Click"  Text="Add Fertilizer" CssClass="btn btn-default" />
                                
                            </div>
                            
                        </div>
                        <br />
                        <asp:Label ID="lblmsg" runat="server"></asp:Label>



                    </div>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

