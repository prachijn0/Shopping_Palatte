<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingPalate/ShoppingMasterPage.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="ShoppingPalate_ShoppingPages_ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <center> <p style="color:Purple;"> An exciting place to Shop.Shop for what you want!</center></p>  
    <p style="color:red;"> Hello People! We are Available 24*7</p>
    <asp:BulletedList ID="BulletedList1" ForeColor="Purple" runat="server">
        <asp:ListItem>Main Street- logan,(U.S.A)</asp:ListItem>
        <asp:ListItem>AB,Road -Indore(INDIA)</asp:ListItem>
        <asp:ListItem>Oxford street-London(U.K)</asp:ListItem>
    </asp:BulletedList>
   
    <script
src="http://maps.googleapis.com/maps/api/js">
</script>

<script>
    function initialize() {
        var mapProp = {
            center: new google.maps.LatLng(51.508742, -0.120850),
            zoom: 5,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
    }
    google.maps.event.addDomListener(window, 'load', initialize);
</script>
<div id="googleMap" style="width:500px;height:380px;"></div>
    <br />
       <style type="text/css">
<!--
     a:link { color: purple; text-decoration: none; }
 a:hover { color: red; text-decoration: underline; }
--></style>
    <h5 style="color:purple;">Email ID : <a href: shoppingpalate.com>Shoppingpalate.com</a></h5>
   <br /><br /><br /><br /><br /><br /><br /><br />


</asp:Content>

 