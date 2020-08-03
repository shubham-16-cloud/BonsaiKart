<%@ Page Title="" Language="C#" MasterPageFile="~/user master page.master" AutoEventWireup="true" CodeFile="Advetisementpage.aspx.cs" Inherits="Advetisementpage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger  ControlID="btnadddiscount"/>
        </Triggers>
        <ContentTemplate>
            <div class="container">
                <h2>Add Advertisement</h2>
                <hr />
                <br />
                <div class="form-horizontal">
                    <div class="alert alert-danger">
                        User Post Advertisement only 7 day free and The Admin is confirm your Advertisement ,if admin cancal your Advertisement than your Advertisement remove.
                    </div>
                    
                    <div class=" form-group">
                        <span class="col-md-2 control-label">Advertisement Title:-</span>
                        <div class="col-md-5">
                            <asp:TextBox ID="txttitle" runat="server" PlaceHolder="Advertisement Title" CssClass="form-control" required> </asp:TextBox>
                            
                            <br />
                        </div>

                    </div>

                    <div class=" form-group">
                        <span class="col-md-2 control-label">Advertisement Details:-</span>
                        <div class="col-md-5">
                           <asp:TextBox ID="txtdetails" MaxLength="45" TextMode="MultiLine" runat="server" PlaceHolder="Advertisement Details" CssClass="form-control" required> </asp:TextBox>
                            
                            <br />
                        </div>
                    </div>

                    <div class=" form-group">
                        <span class="col-md-2 control-label">Advertisement Image :-</span>
                        <div class="col-md-5">
                            <asp:FileUpload ID="fuimg" runat="server" CssClass="form-control" />
                            
                            <br />
                        </div>
                    </div>

                    <div class=" form-group">
                        <span class="col-md-2 control-label">Advertisement URL / Website link :-</span>
                        <div class="col-md-5">
                            <br />
                           <asp:TextBox ID="txtlink" runat="server" PlaceHolder="Advertisement URL / Website link " CssClass="form-control" > </asp:TextBox>
                            
                            <br />
                        </div>
                    </div>
                           

                    <div class=" form-group">
                        <span class="col-md-2 control-label"></span>
                        <div class="col-md-5">
                            <br />
                            <asp:Button ID="btnadddiscount" runat="server" Text="Submit" OnClick="btnadddiscount_Click"  CssClass="btn btn-primary btn-md" />
                            <br />
                            <br />
                        </div>
                    </div>

                </div>

            </div>        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

