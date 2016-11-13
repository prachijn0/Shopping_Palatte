<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingPalate/ShoppingMasterPage.master" AutoEventWireup="true" CodeFile="BestSellers.aspx.cs" Inherits="ShoppingPalate_ShoppingPages_BestSellers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ProductImage") %>' Height="300px" Width="300px"  /> 
                                       
                                </asp:HyperLink>
                                &nbsp;&nbsp;&nbsp
                                 <tr>
                                     <td>
                                <h style="color:purple;"> Title:</h>
                                <asp:Label ID="Label1" ForeColor="red" runat="server" Text='<%# Eval("ProductName") %>' />
                                <br />
                                <h style="color:purple;">Price:</h>
                                <asp:Label ID="Label2" runat="server"  ForeColor="Red" Text='<%# Eval("ProductPrice","{0:c}") %>' />
                                    </td>
                                </tr>
                            </td>
                           
                        </tr>
                    </table>
                </td>
            </ItemTemplate>
                </asp:ListView>
        <asp:Label ID="lblMessage" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>

