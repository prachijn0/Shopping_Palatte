<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingPalate/ShoppingMasterPage.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ShoppingPalate_ShoppingPages_ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
     <div class="displayimage">
            	
						<%--<div class="show">
							<a href="apparel.html"><img src="../images/apparel8.jpg" alt="" style="height:369px"/></a>
							
						</div>--%>
         <asp:FormView ID="frmvwProductImage" runat="server" Height="424px" Width="328px">
              <ItemTemplate>
                
                <table>
                    <tr>
                        <td>
                           <%-- <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("title_id","Images/{0}.jpg") %>' />--%>
                        </td>
                        <td>
                           
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ProductImage") %>' Height="424px" Width="328px" />
                        </td>
                    </tr>
                </table>

            </ItemTemplate>
         </asp:FormView>
               
    </div>
    <div class="contentdetails">
          <div class="productdetails" style="height:410px" >
               <h2 style="color:purple;">Details Of Products</h2><asp:FormView ID="frmvwProductDetails" runat="server" Height="16px" Width="58px" >
                  <ItemTemplate>
                      <table>
                       <tr> <td><b><h style="color:purple;">Title:</h></b></td>
                            <td><asp:Label ID="titleLabel" ForeColor="Red" runat="server" Text='<%# Bind("ProductName") %>' />
                           </td>
                           &nbsp;&nbsp;&nbsp;&nbsp;
                           </tr>
                           <tr> <td > <b> <h style="color:purple;">Description:</h></b> </td>           
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <td><asp:Label ID="typeLabel" ForeColor="Red" runat="server" Text='<%# Bind("ProductDesc") %>' /></td>
                            <br /><tr>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <tr> <td> <b> <h style="color:purple;">Price:</h> </b> </td>
                            <td><asp:Label ID="priceLabel" ForeColor="Red" runat="server" Text='<%# Bind("ProductPrice","{0:c}") %>' /></td>
                            <br /><tr>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <tr> <td> <b> <h style="color:purple;">In Stock:</h></b> </td>
                            <td><asp:Label ID="inStockLabel" runat="server" ForeColor="Red" Text='<%# Bind("InStock") %>' /></td>
                            <br /><tr>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <tr> <td> <b><h style="color:purple;">Enter Quantity:</h> </b> </td>
                      <td><asp:TextBox ID="txtQty" ForeColor="Red" BackColor="WhiteSmoke" runat="server"></asp:TextBox></td>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter a Qantity" ControlToValidate="txtQty"></asp:RequiredFieldValidator>
                      <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Enter a positive number" ControlToValidate="txtQty" ValueToCompare="1" Operator="GreaterThanEqual"></asp:CompareValidator>
                       <tr>
                               </table>
                          <br /><br />
                      
                  </ItemTemplate>
              </asp:FormView>
             <asp:Button ID="btnCart" runat="server" Text="Add To Cart" OnClick="btnCart_Click" />
              
              
              
              <br />
              <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="green"></asp:Label>
              
              
              
          </div>
       
   </div>
    
   
</asp:Content>

