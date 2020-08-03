<%@ Page Title="" Language="C#" MasterPageFile="~/user master page.master" AutoEventWireup="true" CodeFile="login_page.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <body>
            <div class="container-fluid" >
       
        
                <div class="loginbox">
                    <br /><br/>
            <h1 class="h1 text-center" style="color:white">Log IN</h1>
        <hr />

            <div class="form-group">
               <h4 class="h4" style="color:white">email <i class="glyphicon glyphicon-envelope"></i> </h4>
                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" Placeholder="Enter your email"></asp:TextBox>
               
                <asp:RequiredFieldValidator ID="rfvemail" runat="server" ControlToValidate="txtemail" CssClass="text-danger" ErrorMessage="Plese enter email" ValidationGroup="1"></asp:RequiredFieldValidator>
                <br /><br />

                <h4 class="h4"  style="color:white">Password <i class="glyphicon glyphicon-lock"></i></h4>
                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Enter your Password"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfvpassword" runat="server" ControlToValidate="txtpassword" CssClass="text-danger"  ErrorMessage="Plese enter password" ValidationGroup="1"></asp:RequiredFieldValidator>
                <br />
                <asp:LinkButton ID="lbforgotpassword" CssClass=" pull-right" runat="server" OnClick="lbforgotpassword_Click"><span style="color:white">Forgot Password ?</span></asp:LinkButton>
                <br /><br />
                <asp:LinkButton ID="lblogin" runat="server" OnClick="lblogin_Click" CssClass="btn btn-success btn-lg" ValidationGroup="1">Log In</asp:LinkButton>
                <br />
                <asp:Label ID="lblmsg" runat="server" ></asp:Label>
                <br /><br />
                <hr class="stylehr" />
                <br />
                <br />
                
                        <asp:ImageButton ID="ibfacebook" runat="server" CssClass="btn btn-primary img-rounded btnfacebook"  ImageUrl="~/image/facebook-login.png" Height="50px"/>
                      <asp:LinkButton ID="lbsignup" runat="server" OnClick="lbsignup_Click" CssClass="btn btn-success"><span style="margin-left:10px">New User ?</span></asp:LinkButton>
                

                
                
                  
</div>
        

        </div>
        
    </div>
                </body>
            <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
             <script>
                 window.sr = ScrollReveal();


                 sr.reveal('.loginbox div h4', {
                     origin: 'right',
                     // Can be any valid CSS distance, e.g. '5rem', '10%', '20vw', etc.
                     distance: '29px',
                     // Time in milliseconds.
                     duration: 2000,
                     //delay: 0,
                 });
                 sr.reveal('.h1', {
                     origin: 'right',
                     rotate: { x: 900, y: 10, z: 0 },
                     distance: '29px',
                     // Can be any valid CSS distance, e.g. '5rem', '10%', '20vw', etc.
                     duration: 2000,
                     // Time in milliseconds.
                    

                 });
</script>
        </ContentTemplate>
    </asp:UpdatePanel>
   
</asp:Content>


