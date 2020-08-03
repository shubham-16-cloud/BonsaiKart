<%@ Page Title="" Language="C#" MasterPageFile="~/user master page.master" AutoEventWireup="true" CodeFile="resetpassword.aspx.cs" Inherits="resetpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="forgot">
                <div id="div">
                    <center><H1>Reset Password</H1>
                    <hr style="height:5px;width:50%; border:none;color:#333;background-color:#333;"  /></center>
                    <br />
                    <p>Plese Enter your OTP PIN to Reset your password</p>
                    <br />
                    <div class="form-group">
                        <h4>Enter OTP :- </h4>
                        <asp:TextBox ID="txtotp" runat="server" CssClass="form-control" placeholder="Enter Your OTP"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfotp" runat="server" ControlToValidate="txtotp"  ErrorMessage="Plese enter OTP" ValidationGroup="2"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblmsg" runat="server" ></asp:Label>
                        <br />
                        <asp:Button ID="btnresetpassword" runat="server" CssClass="btn btn-success" Text="Reset password" OnClick="btnresetpassword_Click" ValidationGroup="2" />

                    </div>

                </div>

            </div>
        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>

