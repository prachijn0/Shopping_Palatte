<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingPalate/ShoppingMasterPage.master" AutoEventWireup="true" CodeFile="EditProduct.aspx.cs" Inherits="ShoppingPalate_ShoppingPages_EditProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div>
   <br />
        &nbsp;<br />
        <br />
        <br />
        <table align="center"             
           
           style="width: 60%;  font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: normal; height: 372px;">
           
           <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Product Id" Font-Bold="True" 
                        Font-Italic="True" Font-Names="Times New Roman" ForeColor="Purple"></asp:Label>
                </td>
                <td class="style1">
                    <asp:Label ID="lblId" ForeColor="Purple" runat="server"></asp:Label>
                    <br />
                </td>
            </tr>
           
            <tr>
                <td class="style3">
                   
                    <asp:Label ID="lblName" runat="server" Text="Product Name" Font-Bold="True" 
                        Font-Italic="True" Font-Names="Times New Roman" ForeColor="purple"></asp:Label>
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
                <td class="style3">
                    <asp:TextBox ID="txtProductName" ForeColor="Purple" BorderColor="LightPink" runat="server" Width="184px" Height="33px"></asp:TextBox>
                    &nbsp;&nbsp;<br />

                    <br />
                </td>
                 <tr>
                <td class="style3">
                   
                    <asp:Label ID="lblCategoryNames" runat="server" Text="Category Name" Font-Bold="True" 
                        Font-Italic="True" Font-Names="Times New Roman" ForeColor="purple"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtProductName" Display="Dynamic" 
                        ErrorMessage="ProductName should not be empty" ForeColor="DeepPink" 
                        SetFocusOnError="True" Font-Italic="True" Font-Size="Small">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtProductName" Display="Dynamic" 
                        ErrorMessage="Cannot contain special characters" ForeColor="DeepPink" 
                        SetFocusOnError="True" 
                        ValidationExpression="[a-z A-Z]+[\w\s(@|-|#|$|\.)*]*" 
                        Font-Italic="True" Font-Size="Small">*</asp:RegularExpressionValidator>
                    </td>
                     

                     <td class="style3">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingPalateDb %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Category]"></asp:SqlDataSource>
                                   <asp:DropDownList ID="ddlSelectCategory"   ForeColor="Purple" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryID" EnableViewState="true" ></asp:DropDownList>
                          &nbsp;&nbsp;<br />

                    <br />
                </td>
            </tr>
            <tr>
                <td class="style4">
                   
                    &nbsp;<asp:Label ID="lblDescrition" runat="server" Text="Description" Font-Bold="True" 
                        Font-Italic="True" Font-Names="Times New Roman" ForeColor="Purple"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtDescription" Display="Dynamic" 
                        ErrorMessage="Description Cannot Be Empty" Font-Italic="True" Font-Size="Small" 
                        ForeColor="DeepPink">*</asp:RequiredFieldValidator>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtDescription" ForeColor="Purple" BorderColor="LightPink" runat="server" Height="65px" 
                        TextMode="MultiLine" Width="195px"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Select Image" Font-Bold="True" 
                        Font-Italic="True" Font-Names="Times New Roman" ForeColor="Purple"></asp:Label>
                    </td>
                <td class="style1" >
                    <asp:Image ID="Image1" runat="server" style="height:212px"/>
                    <asp:FileUpload ID="FileUpload1" ForeColor="Purple" BorderColor="LightPink" runat="server" Width="240px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;<asp:Label ID="Label4" runat="server" Text="Price" Font-Bold="True" 
                        Font-Italic="True" Font-Names="Times New Roman" ForeColor="Purple"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtPrice" Display="Dynamic" 
                        ErrorMessage="Price should not be empty" ForeColor="DeepPink" 
                        SetFocusOnError="True" Font-Italic="True" Font-Size="Small">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="txtPrice" ErrorMessage="Price Should be like-23.05 format"
                        ForeColor="DeepPink" Display="Dynamic" ValidationExpression="\d+[.]\d+">*</asp:RegularExpressionValidator>
                    </td>
                <td class="style2">
                    <asp:TextBox ID="txtPrice" runat="server" ForeColor="Purple" BorderColor="LightPink" Width="186px" Height="31px"></asp:TextBox>
                    &nbsp;&nbsp;
                    <br />
                    <br />
                </td>
            </tr>
                
              <tr>
                <td class="style2">
                    &nbsp;<asp:Label ID="Label1" runat="server" Text="Available Quantity" Font-Bold="True" 
                        Font-Italic="True" Font-Names="Calibri" ForeColor="Purple"></asp:Label>
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
                    <asp:TextBox ID="txtInStock" runat="server" ForeColor="Purple" BorderColor="LightPink" Width="186px" Height="31px"></asp:TextBox>
                    &nbsp;&nbsp;
                    <br />
                    <br />
                </td>
                  </tr>
            
            <tr>
                <td colspan="2">
                    <br />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="btnEditProduct" BackColor="WhiteSmoke"  runat="server" 
                        Text="Update" Width="96px" onclick="btnEditProduct_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                    
                                         
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="btnCancel" runat="server" Text="Cancel" BackColor="WhiteSmoke"  Width="101px" onclick="btnCancel_Click" 
                        CausesValidation="False"  />
                   
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;<asp:Button ID="btnClear" runat="server" BackColor="WhiteSmoke"  CausesValidation="False" Height="29px" 
                        onclick="btnClear_Click" Text="Clear" Width="98px" style="margin-top: 8px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:Button ID="btnDelete" runat="server"  BackColor="WhiteSmoke"  onclick="btnDelete_Click" 
                        Text="Delete" Width="104px" CausesValidation="False" />
&nbsp;&nbsp;&nbsp;
                   
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:Button ID="btnHome"  BackColor="WhiteSmoke"  runat="server" CausesValidation="False" 
                        onclick="btnHome_Click" Text="Home" />
                   
                    <br />
                   
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        Font-Size="Medium" ForeColor="DeepPink" Height="23px" Width="202px" />
                   
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblMessage" runat="server" ForeColor="DeepPink"></asp:Label>
                   
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
         
    
   </div>
</asp:Content>

