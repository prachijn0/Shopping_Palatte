<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingPalate/ShoppingMasterPage.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="ShoppingPalate_ShoppingPages_UserProfile" %>

<%@ Register Src="~/ShoppingPalate/ShoppingPages/UserInformation.ascx" TagPrefix="uc1" TagName="UserInformation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div>
       <uc1:UserInformation runat="server" id="UserInformation" />
    </div> 
</asp:Content>

