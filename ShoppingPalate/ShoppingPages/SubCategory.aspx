<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingPalate/ShoppingMasterPage.master" AutoEventWireup="true" CodeFile="SubCategory.aspx.cs" Inherits="ShoppingPalate_ShoppingPages_SubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="body">
        <%#Eval("CategoryName")%>
    <div class="sidebar">
				<div class="first">
					   <h2 style="color:purple;"><a href="#">Categories</a></h2>
                    <%-- <td>
                                                <a href="ProductDetails.aspx?productId=<%#Eval("ProductId") %>">
                                                   
                                                        <%# Eval("ProductName")%>
                                                    </span>
                                                </a>            
                                                <br />
                                                <span class="ProductPrice">           
                                                    <b>Price: </b><%#Eval("Price")%>
                                                </span>
                                                <br />  
                                                 <span class="ProductPrice">           
                                                    <b>Description: </b><%#Eval("ProductDescription")%>
                                                </span>
                                                <br />            
                                               <%-- <a><a href='AddToCart.aspx?productId=<%#Eval("ProductId")%>'>Add To Cart</a></a>--%>
                      <asp:ListView ID="lstvwCategory" runat="server">
                        <GroupTemplate>    
                                <tr id="itemPlaceholderContainer" runat="server">      
                                    <td id="itemPlaceholder" runat="server"></td>    
                                </tr>  
                            </GroupTemplate>
                         <ItemTemplate>    
                                <td id="itemTemplate" runat="server">      
                                    <table>        
                                        <tr>          
                                            <td>&nbsp;</td>          
                                            <td>
                                                <a href='SubCategory.aspx?categoryId=<%#Eval("CategoryId") %>' >
                                                    <br />
                                                     <span class="CategoryName">           
                                                       <%#Eval("CategoryName")%>
                                                </span>
                                                       </a> 
                                                        
                                            </td>
                                          <%--  <td>
                                                <a href="ProductDetails.aspx?productId=<%#Eval("ProductId") %>">
                                                    <span class="ProductName">   
                                                        <%# Eval("ProductName")%>
                                                    </span>
                                                </a>            
                                                <br />
                                                <span class="ProductPrice">           
                                                    <b>Price: </b><%#Eval("Price")%>
                                                </span>
                                                <br />  
                                                 <span class="ProductPrice">           
                                                    <b>Description: </b><%#Eval("ProductDescription")%>
                                                </span>
                                                <br />            
                                                <a><a href='AddToCart.aspx?productId=<%#Eval("ProductId")%>'>Add To Cart</a></a>
                                            </td>      --%>
                                        </tr>      
                                    </table>    
                                </td>  
                            </ItemTemplate>  
                    </asp:ListView>
				</div>
				
			</div>
    
                    <%--<ul>
						<li class="first">
							<a href="ProductDetails.aspx"><img src="../images/apparel8.jpg" alt=""/></a>
							<p>dolor sit amet</p>
							<span>US$28.00</span></li>
					</ul>--%>
                <asp:ListView ID="lstvwProducts" runat="server" GroupItemCount="3">
             <LayoutTemplate>
                <table>
                    <tr id="groupPlaceHolder" runat="server"></tr>

                </table>
            </LayoutTemplate>
                      <GroupTemplate>
                <tr>
                    <td id="itemplaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ProductID","ProductDetails.aspx?productId={0}") %>'  >
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ProductImage") %>' Height="200px" Width="200px"  /> 
                                       
                                </asp:HyperLink>
                                &nbsp;&nbsp;&nbsp
                                 <tr>
                                     <td>
                                 <h style="color:purple;"> Title:</h>
                                <asp:Label ID="Label1" ForeColor="Red" runat="server" Text='<%# Eval("ProductName") %>' />
                                <br />
                               <h style="color:purple;">  Price:</h>
                                <asp:Label ID="Label2" ForeColor="Red" runat="server" Text='<%# Eval("ProductPrice","{0:c}") %>' />
                                    </td>
                                </tr>
                            </td>
                           
                        </tr>
                    </table>
                </td>
            </ItemTemplate>
                </asp:ListView>
				</div>
           </div>
        </div>
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>

