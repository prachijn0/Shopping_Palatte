<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingPalate/ShoppingMasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="ShoppingPalate_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
	<div class="featured">
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/ShoppingPalate/Images/advertisement.jpg" OnClick="ImageButton1_Click" />		
         <%--<img src="../Images/advertisement.jpg" alt=""/>--%>
				<div class="gallery">
					       <%--   <img src="../Images/aurora.jpg" alt=""/></>--%>
                     <asp:AdRotator ID="AdRotator1" runat="server" DataSourceID="XmlData" target="_blank" Height="459px" Width="790px" /> 

        <asp:XmlDataSource ID="XmlData" runat="server" DataFile="~\ShoppingPalate\ShoppingPages\AddRotator.xml"></asp:XmlDataSource>
					<ul class="first">
						<li><img src="../Images/beach-bride.jpg" alt=""/></li>
                        <li><img src="../Images/bagsperfect.jpg" height="140" width="390" alt=""/></li>
                        <li><img src="../Images/final.jpg" height="140" width="390" alt=""/></li>
					</ul>
					<ul>
						<li><img src="../Images/fashionable.jpg" alt=""/></li>
						<li><img src="../Images/accessories.jpg" alt=""/></li>
						<li><img src="../Images/skin-perfect.jpg" alt=""/></li>
                        
					</ul>
				</div>
			</div>
</asp:Content>

