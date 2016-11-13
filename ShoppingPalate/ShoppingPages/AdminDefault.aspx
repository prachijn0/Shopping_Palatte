<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingPalate/ShoppingMasterPage.master" AutoEventWireup="true" CodeFile="AdminDefault.aspx.cs" Inherits="ShoppingPalate_ShoppingPages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <center> <p style="color: red;  font-size:x-large">Welcome Admin,<br />
    What You want to do today? </center> </p>

      <style type="text/css">
<!--
 a:link { color: purple; text-decoration: none; }
 a:hover { color: red; text-decoration: underline; }
--></style>
    <ul>
   <li> <a href="AddCategory.aspx">Add/Edit a  Category</a></li><br />
    <li> <a href="AddProduct.aspx">Add a New product</a></li><br />
   <li>  <a href="ViewProduct.aspx"> View/Edit a product</a></li><br />
    
    </ul>
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>

