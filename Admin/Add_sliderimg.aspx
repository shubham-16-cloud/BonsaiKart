<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_master page.master" AutoEventWireup="true" CodeFile="Add_sliderimg.aspx.cs" Inherits="Admin_Add_sliderimg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

      <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">

        $(function () {
            $('[id*=gvimg]').footable();
        });
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnAdd" />
        </Triggers>

        <ContentTemplate>
            <div class=" container">
        <div class=" container">
            <div class=" form-horizontal">
                <h2>Add Image For Slider</h2>
                <hr /><br />
                <div class="form-group">
                    <asp:Label ID="lbltitle" runat="server" Text="Image title :-" CssClass="control-label col-md-2"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txttitle" runat="server" CssClass="form-control" ValidationGroup="1" ></asp:TextBox>
                        <br />
                    </div>
                </div>

                 <div class="form-group">
                    <asp:Label ID="lbldescrption" runat="server" Text="Image Description :-" CssClass="control-label col-md-2"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtdescreption" runat="server" CssClass="form-control" ValidationGroup="1" ></asp:TextBox>
                        <br />
                    </div>
                </div>

                 <div class="form-group">
                    <asp:Label ID="lblimg" runat="server" Text="Image URL :-" CssClass="control-label col-md-2"></asp:Label>
                    <div class="col-md-3">
                        <asp:FileUpload ID="fuimg" runat="server" CssClass="form-control" />
                        <br />
                    </div>
                </div>

                <div class="form-group">
                     <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" ValidationGroup="1" Text="Add Image" CssClass="btn btn-primary" />
                </div>
            </div>

                </div>

            <br />
            

            <asp:GridView ID="gvimg" runat="server" AutoGenerateColumns="False" OnRowCommand="gvimg_RowCommand" CssClass="footable">
                <Columns>
                    <asp:BoundField DataField="img_title" HeaderText="Title" SortExpression="img_title" />
                    <asp:BoundField DataField="img_drecription" HeaderText="Drecription" SortExpression="img_drecription" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("img_path")%>' Height="100px" Width="100px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CommandName="delete" CommandArgument='<%#Eval("id")%>' Text="Delete" CssClass="btn btn-success"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    


                                    </Columns>
            </asp:GridView>
            <br />
            </div>

        </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    
</asp:Content>

