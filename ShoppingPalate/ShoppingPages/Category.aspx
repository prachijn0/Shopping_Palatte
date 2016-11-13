<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingPalate/ShoppingMasterPage.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="ShoppingPalate_ShoppingPages_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="body">
			<div class="sidebar">
				<div class="first">
					<h2><a href="#">Categories</a></h2>
                    <%--</a>--%>
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
                                        </tr>      
                                    </table>    
                                </td>  
                            </ItemTemplate>  
                    </asp:ListView>
				    <asp:EntityDataSource ID="EntityDataSource1" runat="server">
                    </asp:EntityDataSource>
				</div>
				
			</div>
			<div class="content">
				<div class="figure">
					<img src="../Images/apparel.jpg" alt=""/>
				</div>
				<div class="products">
				
					<ul>
						<li class="first">
                            <%--<a href="apparel.html">--%>
                                <img src="../Images/apparel1.jpg" alt=""/>
							<%--</a>--%>
							<h4></h4>
							<p></p>
							<span> </span>
						</li>
						<li class="first">
                            <%--<a href="apparel.html">--%>
                                <img src="../images/apparel7.jpg" alt=""/>
							<%--</a>--%>
							<h4></h4>
							<p></p>
							<span> </span>
						</li>
						<li class="first">
                            <%--<a href="apparel.html">--%>
                                <img src="../images/apparel3.jpg" alt=""/>
							<%--</a>--%>
							<h4></h4>
							<p></p>
							<span> </span>
						</li>
						<li class="first">
							<%--<a href="apparel.html">--%>
                                <img src="../images/apparel4.jpg" alt=""/>
							<%--</a>--%>
							<h4></h4>
							<p></p>
							<span> </span>
						</li>
						
						
					</ul>
				</div>
			</div>
			
		</div>
</asp:Content>

