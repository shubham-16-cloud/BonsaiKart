<%@ Page Title="" Language="C#" MasterPageFile="~/user master page.master" AutoEventWireup="true" CodeFile="newpassword.aspx.cs" Inherits="newpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="forgot">
                <div id="div">
                    <center><h1>Create New Password</h1>
                     <hr style="height:5px;width:50%; border:none;color:#333;background-color:#333;"  /> </center>
                    <br />
                    <br />
                    <p> Enter Minimu 8 char atleast 1 UpperCase Alphabet,1 LowerCase Alphabet,1 Number,1 Special char)</p>
                    <br />
                    <div class="form-group">
                        <h4>New Password:-</h4>
                        <asp:TextBox ID="txtnewpassword" runat="server" placeholder="Enter New Password" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfpassword" runat="server" ControlToValidate="txtnewpassword" CssClass=" texterroe2" ErrorMessage=" Plese create password" ValidationGroup="2"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="plese enter valid password" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$" ControlToValidate="txtnewpassword" ValidationGroup="2" CssClass="texterroe2"></asp:RegularExpressionValidator>
                   
                        <h4 class="h4">Confirm Password:-</h4>
                            <asp:TextBox ID="txtconfirm" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Re-enter Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfconfirmpassword" runat="server" ControlToValidate="txtconfirm" CssClass=" texterroe2" ErrorMessage="Plese re-enter password" ValidationGroup="2"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtnewpassword"   ControlToValidate="txtconfirm" CssClass=" texterroe2" ErrorMessage="*Plese enter valid password" ValidationGroup="2"></asp:CompareValidator>
                        <br />
                        <asp:Button ID="btnnewpassword" runat="server" CssClass="btn btn-success" ValidationGroup="2" OnClick="btnnewpassword_Click" Text="Set Password" />
                         </div>

                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

