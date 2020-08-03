<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_master page.master" AutoEventWireup="true" CodeFile="edit_plant.aspx.cs" Inherits="Admin_edit_plant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      <Triggers>
            <asp:PostBackTrigger ControlID="btnupdateplant" />
    </Triggers>
        <ContentTemplate>

            <div class="container">
                
                <div>
                    <div class="form-horizontal">
                        <h2>Edit Plant</h2>
                        <hr />
                        <br />
                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Plant ID :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:TextBox ID="plantID" runat="server" CssClass=" form-control" ReadOnly="True"></asp:TextBox><br />
                                
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblname" runat="server" CssClass="col-md-2 control-label" Text="Plant Name :-"></asp:Label>
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
                            <asp:Label ID="lblimg1" runat="server" CssClass="col-md-2 control-label" Text=" Plant Image 1 :-" Visible="False"></asp:Label>
                            <div class="col-md-3">
                                <asp:FileUpload ID="fupimg1" runat="server" CssClass="form-control" Visible="False" />
                               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="1"  ErrorMessage="Required this Filed" ControlToValidate="fupimg1"></asp:RequiredFieldValidator>--%>
                            </div>
                            <br />
                        </div>

                      <div  class="form-group">
                            <asp:Label ID="lblimg2" runat="server" CssClass="col-md-2 control-label" Visible="False" Text="Plant Image 2 :-"></asp:Label>
                            <div class="col-md-3">
                                <asp:FileUpload ID="Fupimg2" runat="server" CssClass="form-control"  Visible="False"/>
                                <br />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblimg3" runat="server" CssClass="col-md-2 control-label" Text="Plant Image 3 :-" Visible="False"></asp:Label>
                            <div class="col-md-3">
                                <asp:FileUpload ID="fupimg3" runat="server" CssClass="form-control" Visible="False" />
                            </div>
                        </div>
                         
                        
                        <div class="form-group">
                            <asp:Label ID="lblimg" runat="server" CssClass="col-md-2 control-label" Text="Plant Image :-"></asp:Label>
                            <div class="col-md-6">
                        <asp:ListView ID="lvimg" runat="server" OnItemCommand="lvimg_ItemCommand" DataKeyNames="imgID" OnItemDeleting="lvimg_ItemDeleting" >

                            <AlternatingItemTemplate>
                                 <div class="col-lg-2" style="margin-top:20px">
                                <asp:Image ID="Image3" runat="server" ImageUrl='<%#Eval("imgUrl") %>' CssClass="img-responsive imgmargin"  Height="100px" Width="100px" />
                                     <asp:LinkButton ID="lbdelete" runat="server" CommandName="delete" CssClass=" delbtn btn-danger" CommandArgument='<%# Bind("ImgId") %>'  >Delete</asp:LinkButton>
                                    </div>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">imgID:
                                    <asp:DynamicControl runat="server" DataField="imgID" Mode="ReadOnly" />
                                    <br />
                                    plantID:
                                    <asp:DynamicControl runat="server" DataField="plantID" Mode="Edit" />
                                    <br />
                                    imgUrl:
                                    <asp:DynamicControl runat="server" DataField="imgUrl" Mode="Edit" />
                                    <br />
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <table style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr>
                                        <td>No data was returned.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <td runat="server" style="">imgID:
                                    <asp:DynamicControl runat="server" DataField="imgID" Mode="Insert" ValidationGroup="Insert" />
                                    <br />
                                    plantID:
                                    <asp:DynamicControl runat="server" DataField="plantID" Mode="Insert" ValidationGroup="Insert" />
                                    <br />
                                    imgUrl:
                                    <asp:DynamicControl runat="server" DataField="imgUrl" Mode="Insert" ValidationGroup="Insert" />
                                    <br />
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <div class="col-lg-2" style="margin-top:20px">
                                <asp:Image ID="Image3" runat="server" ImageUrl='<%#Eval("imgUrl") %>' CssClass="img-responsive imgmargin"  Height="100px" Width="100px" />
                                   <asp:LinkButton ID="lbdelete" runat="server" CommandName="delete" CssClass=" delbtn btn-danger" CommandArgument='<%# Bind("ImgId") %>'  >Delete</asp:LinkButton>
                                    </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr id="itemPlaceholderContainer" runat="server">
                                        <td id="itemPlaceholder" runat="server"></td>
                                    </tr>
                                </table>
                                <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                </div>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">imgID:
                                    <asp:DynamicControl runat="server" DataField="imgID" Mode="ReadOnly" />
                                    <br />
                                    plantID:
                                    <asp:DynamicControl runat="server" DataField="plantID" Mode="ReadOnly" />
                                    <br />
                                    imgUrl:
                                    <asp:DynamicControl runat="server" DataField="imgUrl" Mode="ReadOnly" />
                                    <br />
                                </td>
                            </SelectedItemTemplate>

                        </asp:ListView>
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
                                <br />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <br />
                                <asp:Button ID="btnupdateplant" runat="server" ValidationGroup="1" OnClick="btnupdateplant_Click"  Text="Update Product" CssClass="btn btn-default" />
                          
                                <br />  </div>
                        </div>


                    </div>

                </div>
                          </div>

        </ContentTemplate>
    </asp:UpdatePanel>
   
</asp:Content>

