<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_master page.master" AutoEventWireup="true" CodeFile="Add_pots.aspx.cs" Inherits="Admin_Add_pots" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="uppots" runat="server">
         <Triggers>
            <asp:PostBackTrigger ControlID="btnAddpot" />
        </Triggers>
       
        <ContentTemplate>
            <div class=" container">
        <div class=" container">
            <div class="form-horizontal">
                <h2>Add Pots</h2>
                <hr /><br />

                <div class="form-group">
                    <asp:Label ID="lblname" runat="server" CssClass="col-md-2 control-label" Text="Pot Name :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtponame" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required This Field" ControlToValidate="txtponame"></asp:RequiredFieldValidator>
                    </div>
                    </div>

                    <div class="form-group">
                    <asp:Label ID="lblprice" runat="server" CssClass="col-md-2 control-label" Text="Pot Price :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtpoprice" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required This Field" ControlToValidate="txtpoprice"></asp:RequiredFieldValidator>
                    </div>
                        </div>

                <div class="form-group">
                    <asp:Label ID="lblqty" runat="server" CssClass="col-md-2 control-label" Text="Pot Quantity :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtpoqty" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required This Field" ControlToValidate="txtpoqty"></asp:RequiredFieldValidator>
                    </div>
                </div>


                        <div class="form-group">
                    <asp:Label ID="lbldimension" runat="server" CssClass="col-md-2 control-label" Text="Pot Dimension :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtpodimension" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required This Field" ControlToValidate="txtpodimension"></asp:RequiredFieldValidator>
                    </div>
                            </div>

                            <div class="form-group">
                    <asp:Label ID="lblmatirial" runat="server" CssClass="col-md-2 control-label" Text="Pot Material :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtpomaterial" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required This Field" ControlToValidate="txtpomaterial"></asp:RequiredFieldValidator>
                    </div>
                                </div>
                                 <div class="form-group">
                    <asp:Label ID="lblcategory" runat="server" CssClass="col-md-2 control-label"  Text="Pot Category :-"></asp:Label>
                                     <div class="col-md-3">
                                         <asp:DropDownList ID="ddlcategory" runat="server" CssClass="form-control">
                                             <asp:ListItem>Soil Pots</asp:ListItem>
                                             <asp:ListItem>Plastic Pots</asp:ListItem>
                                             <asp:ListItem>Basket Pots</asp:ListItem>
                                             <asp:ListItem>Tray & Flat Pots</asp:ListItem>
                                             <asp:ListItem>Seed Pots</asp:ListItem>
                                             <asp:ListItem>Hanging Basket Pots</asp:ListItem>
                                         </asp:DropDownList>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required This Field" ControlToValidate="ddlcategory"></asp:RequiredFieldValidator>
                                     </div>
                                     </div>

                                <div class="form-group">
                    <asp:Label ID="lbldescreption" runat="server" CssClass="col-md-2 control-label" Text="Pot Descreption :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtpodescreption" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required This Field" ControlToValidate="txtpodescreption"></asp:RequiredFieldValidator>
                    </div>
                                    </div>

                                    <div class="form-group">
                    <asp:Label ID="lblplacement" runat="server" CssClass="col-md-2 control-label" Text="Pot Placement :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtplacement" runat="server" CssClass="form-control"></asp:TextBox>
                        <br />
                    </div>
                                        </div>

                                        <div class="form-group">
                    <asp:Label ID="lblimg" runat="server" CssClass="col-md-2 control-label" Text="Pot Image :-"></asp:Label>
                    <div class="col-md-3">
                        <asp:FileUpload ID="fuimg" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Required This Field" ControlToValidate="fuimg"></asp:RequiredFieldValidator>
                    </div>
                                            </div>

                         <div class="form-group">
                            <asp:Label ID="lblfee" runat="server" CssClass="col-md-2 control-label" Text=" COD Free :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:CheckBox ID="cbfree" runat="server" CssClass="checkbox checkbox-inline" />
                            </div>
                        </div>

                        <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <br />
                    <asp:Button ID="btnAddpot" runat="server" Text="Add Pots" OnClick="btnAddpot_Click" CssClass="btn btn-default" />
                </div>
            </div>


                </div>

            </div>

        </div>
        </ContentTemplate>
    </asp:UpdatePanel>

   
</asp:Content>

