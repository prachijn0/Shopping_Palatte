<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingPalate/ShoppingMasterPage.master" AutoEventWireup="true" CodeFile="ViewProduct.aspx.cs" Inherits="ShoppingPalate_ShoppingPages_AdminUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <%--More values will come after designing of database.Also, the data will be in textboxes at page load.--%>
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingPalateDb %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br /><h style="color:purple;">Category Names:</h>
        <asp:DropDownList ID="DropDownList1" ForeColor="Purple" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingPalateDb %>" SelectCommand="SELECT * FROM [Product] WHERE ([CategoryID] = @CategoryID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1"  Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        View Products:<br /><br />
        <asp:GridView ID="GridView1" runat="server" ForeColor="Purple" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:TemplateField HeaderText="ProductName" SortExpression="ProductName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ProductName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price" SortExpression="Price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Instock" SortExpression="Instock">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Instock") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Instock") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sold" SortExpression="Sold">
                    <EditItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Sold") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Sold") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="ProductID" DataNavigateUrlFormatString="EditProduct.aspx?Id={0}" HeaderText="Edit" Text="Edit" />
            </Columns>
        </asp:GridView> 
         
    </div>
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
  
       <style type="text/css">
<!--
 a:link { color: purple; text-decoration: none; }
 a:hover { color: red; text-decoration: underline; }
--></style>
</asp:Content>


