<%@ Page Language="C#" MasterPageFile="~/ShoppingPalate/ShoppingMasterPage.master"  AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="ShoppingPalate_ShoppingPages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


         <div class="header">
			<div>
				<h3 style="color:purple; text-align:center;"> LOGIN HERE!</h3>
			<center>	<asp:Login ID="Login1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" CreateUserText="Register Here" CreateUserUrl="CreateUser.aspx" DestinationPageUrl="Home.aspx" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" Height="251px" PasswordRecoveryText="Forgot Password?" PasswordRecoveryUrl="RecoverPassword.aspx" Width="356px">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
            <TextBoxStyle Font-Size="0.8em" />
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        </asp:Login></center>
			</div>
			
		</div> 
      <div>
          <br />
           <h style="color:blue;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Admin Info<h>
        <h style="color:Purple;">&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UserName:</h> <h style="color:red;">admin</h><br />
        <h style="color:Purple;">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Password:</h> <h style="color:red;"> admin12345!</h>
               <br />
           <h style="color:blue;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User Info<h>
        <h style="color:Purple;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
          <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UserName:</h> <h style="color:red;">user<br />
        <h style="color:Purple;">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password:</h> <h style="color:red;"> user12345!</h></div>
       

         <br /><br />
         </asp:Content>
