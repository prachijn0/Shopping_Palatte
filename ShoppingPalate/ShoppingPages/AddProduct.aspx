<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingPalate/ShoppingMasterPage.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="ShoppingPalate_ShoppingPages_AdminInsert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--More values will come after designing of database--%>
    <div>
     <table align="center"             
           
           style="width: 32%; font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: normal; height: 546px;" 
           frame="void">
           
           <tr>
                <td class="style5">
                    <asp:Label ID="Label5" runat="server" Text="Select Category" Font-Bold="True" 
                        Font-Italic="True" Font-Names="Calibri" ForeColor="purple"></asp:Label>
                </td>
                <td class="style7">
                   <%-- <asp:DropDownList ID="ddlSelectCategory" runat="server" Height="52px" 
                        Width="132px">
                    </asp:DropDownList>--%>
                    <asp:DropDownList ID="ddlSelectCategory" runat="server" BackColor="WhiteSmoke"  ForeColor="Purple" DataSourceID="ObjectDataSource1" DataTextField="CategoryName" DataValueField="CategoryId">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetCategories" TypeName="ShoppingDB"></asp:ObjectDataSource>
                    <br />
                </td>
            </tr>
           
            <tr>
                <td class="style3">
                   
                    <asp:Label ID="lblName" runat="server" Text="Product Name" Font-Bold="True" 
                        Font-Italic="True" Font-Names="Calibri" ForeColor="purple"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtProductName" Display="Dynamic" 
                        ErrorMessage="ProductName should not be empty" ForeColor="DeepPink" 
                        SetFocusOnError="True" Font-Italic="True" Font-Size="Small">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtProductName" Display="Dynamic" 
                        ErrorMessage="Cannot contain special characters" ForeColor="DeepPink" 
                        SetFocusOnError="True" 
                        ValidationExpression="[a-z A-Z]+[\w\s(@|-|#|$|\.)*]*" 
                        Font-Italic="True" Font-Size="Small">*</asp:RegularExpressionValidator>
                    </td>
                <td class="style8">
                    <asp:TextBox ID="txtProductName" runat="server" ForeColor="Purple" BorderColor="LightPink" BackColor="WhiteSmoke" Width="184px" Height="33px"></asp:TextBox>
                    &nbsp;&nbsp;<br />

                    <br />
                </td>
            </tr>
            <tr>
                <td class="style4">
                   
                    <asp:Label ID="lblDescrition" runat="server" Text="Description" Font-Bold="True" 
                        Font-Italic="True" Font-Names="Calibri" ForeColor="purple"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtDescription" Display="Dynamic" 
                        ErrorMessage="Description Cannot Be Empty" Font-Italic="True" Font-Size="Small" 
                        ForeColor="DeepPink">*</asp:RequiredFieldValidator>
                </td>
                <td class="style9">
                    <asp:TextBox ID="txtDescription" runat="server" ForeColor="Purple" BorderColor="LightPink" BackColor="WhiteSmoke"  Height="65px" 
                        TextMode="MultiLine" Width="247px" style="margin-left: 2px"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style6" style="border-color:lightpink">
                    <asp:Label ID="Label6" runat="server" Text="Select Image" Font-Bold="True" 
                        Font-Italic="True" Font-Names="Calibri" ForeColor="purple"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="FileUpload1" ErrorMessage="Select An Image" Font-Italic="True" 
                        Font-Size="Small" ForeColor="DeepPink">*</asp:RequiredFieldValidator>
                    </td>
      
                <td class="style10" style="background-color:whitesmoke; border-color:lightpink;">
                   
                    <asp:FileUpload ID="FileUpload1" BorderColor="LightPink" runat="server" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;<asp:Label ID="Label4" runat="server" Text="Price" Font-Bold="True" 
                        Font-Italic="True" Font-Names="Calibri" ForeColor="purple"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtPrice" Display="Dynamic" 
                        ErrorMessage="Price should not be empty" ForeColor="DeepPink" 
                        SetFocusOnError="True" Font-Italic="True" Font-Size="Small">*</asp:RequiredFieldValidator>
                    
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="txtPrice" ErrorMessage="Enter Price in Numeric" 
                        ForeColor="DeepPink" ValidationExpression="\d+[.]\d+">*</asp:RegularExpressionValidator>
                    
                    
                    </td>
                <td class="style11">
                    <asp:TextBox ID="txtPrice" runat="server" ForeColor="Purple" BorderColor="LightPink" BackColor="WhiteSmoke"  Width="186px" Height="31px"></asp:TextBox>
                    &nbsp;&nbsp;
                    <br />
                    <br />
                </td>
            </tr>
              <tr>
                <td class="style2">
                    &nbsp;<asp:Label ID="Label1" runat="server" Text="Available Quantity" Font-Bold="True" 
                        Font-Italic="True" Font-Names="Calibri" ForeColor="purple"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txtInStock" Display="Dynamic" 
                        ErrorMessage="Price should not be empty" ForeColor="DeepPink" 
                        SetFocusOnError="True" Font-Italic="True" Font-Size="Small">*</asp:RequiredFieldValidator>
                    
                    
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ErrorMessage="Enter a whole number" ControlToValidate="txtInStock"
                         Operator="GreaterThanEqual" ValueToCompare="0" Display="Dynamic"
                        SetFocusOnError="True" Font-Italic="True" Font-Size="Small" ForeColor="DeepPink" >*</asp:CompareValidator>
                    
                    
                    </td>
                <td class="style11">
                    <asp:TextBox ID="txtInStock" ForeColor="Purple" BorderColor="LightPink" BackColor="WhiteSmoke"  runat="server" Width="186px" Height="31px"></asp:TextBox>
                    &nbsp;&nbsp;
                    <br />
                    <br />
                </td>
                  </tr>
            <tr>
                <td colspan="2">
                    <br />
                    <br />
                    <asp:Button ID="btnAddProduct" BackColor="WhiteSmoke" runat="server" 
                        Text="Add" Width="104px" onclick="btnAddProduct_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                    
                     <asp:Button ID="btnClear" runat="server" 
                      Text="Clear" BackColor="WhiteSmoke" Width="106px" CausesValidation="False" 
                        onclick="btnClear_Click" />
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
                    &nbsp;<br />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnCancel" runat="server" BackColor="WhiteSmoke" Text="Cancel" Width="101px" 
                        CausesValidation="False" onclick="btnCancel_Click"  />
                   
                    <br />
                   
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        Font-Size="Medium" ForeColor="DeepPink" />
                   
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblMessage" runat="server" ForeColor="purple"></asp:Label>
               <asp:Label ID="lblMsg" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
                   
                    <br />
                </td>  
            </tr>
        </table>
        </div>
    
</asp:Content>

