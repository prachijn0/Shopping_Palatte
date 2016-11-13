<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserInformation.ascx.cs" Inherits="ShoppingPalate_ShoppingPages_UserInformation" %>


<style type="text/css">
    .auto-style1 {
        height: 26px;
    }
</style>


<h1 style="color:purple;">
    Welcome <asp:LoginName ID="LoginName1" runat="server" />
</h1>

<h2  style="color:purple;">Change Password</h2>
<asp:ChangePassword ID="ChangePassword1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em">
    <CancelButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
    <ChangePasswordButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
    <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
    <PasswordHintStyle Font-Italic="True" ForeColor="#888888" />
    <TextBoxStyle Font-Size="0.8em" />
    <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
</asp:ChangePassword>

<h2  style="color:purple;">Your Profile</h2>

<table>
    <tr>
        <td class="auto-style1">
            <asp:Label ID="Label1" runat="server" ForeColor="Purple" Text="First Name:"></asp:Label></td>
        <td class="auto-style1">
            <asp:TextBox ID="TextBox1"  style="color:purple;" runat="server"></asp:TextBox></td>
    </tr>
     <tr>
        <td>
            <asp:Label ID="Label2" runat="server"  style="color:purple;" Text="Last Name:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox2"  style="color:purple;" runat="server"></asp:TextBox></td>
    </tr>
     <tr>
        <td>
            <asp:Label ID="Label7" runat="server" style="color:purple;" Text="Birth Date:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox7"  style="color:purple;" runat="server"></asp:TextBox></td>
    </tr>
     <tr>
        <td>
            <asp:Label ID="Label8" runat="server" style="color:purple;" Text="Street:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox8"  style="color:purple;" runat="server"></asp:TextBox></td>
    </tr>
     <tr>
        <td>
            <asp:Label ID="Label3" runat="server"  style="color:purple;" Text="City:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox3"  style="color:purple;" runat="server"></asp:TextBox></td>
    </tr>
     <tr>
        <td>
            <asp:Label ID="Label9" runat="server"  style="color:purple;" Text="State:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox9"  style="color:purple;" runat="server"></asp:TextBox></td>
    </tr>
     <tr>
        <td>
            <asp:Label ID="Label4" runat="server"  style="color:purple;" Text="Zip:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox4"  style="color:purple;" runat="server"></asp:TextBox></td>
    </tr>
     <tr>
        <td>
            <asp:Label ID="Label5" runat="server"  style="color:purple;" Text="Country:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox5"  style="color:purple;" runat="server"></asp:TextBox></td>
    </tr>
</table>
<br />
<asp:Button ID="Button1" runat="server"  style="color:purple;" Text="Update Profile" OnClick="Button1_Click" />
