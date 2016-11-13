<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingPalate/ShoppingMasterPage.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="ShoppingPalate_ShoppingPages_AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br />
    <div>
        <center>
<asp:Panel ID="Panel3" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <asp:RadioButtonList  ID="rdbtncategory" runat="server" ForeColor="Purple" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true" Height="53px">
            <asp:ListItem Text="Add Category"  Selected="True" Value="1"  Enabled="true"></asp:ListItem>
            <asp:ListItem Text="Edit Category" Value="2" Enabled="true" ></asp:ListItem>
        </asp:RadioButtonList>
</asp:Panel>
       
        
        <asp:Panel ID="Panel1" runat="server">
  <h1 style="color:purple;">
Add Category
</h1>
<br />
            &nbsp;<asp:Label ID="lblAddCategory" runat="server" Font-Size="X-Large" ForeColor="Purple" Text="Add Category"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="reqfvAddCategory" runat="server" ControlToValidate="txtAddCategory" ErrorMessage="Enter A Category" ForeColor="DeepPink">*</asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="regexpAddCategory" runat="server" 
        ControlToValidate="txtAddCategory" 
        ErrorMessage="Name Should Not Have Special Characters" ForeColor="DeepPink" 
        ValidationExpression="^[a-zA-Z ]+$">*</asp:RegularExpressionValidator>
            &nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtAddCategory" runat="server" BackColor="WhiteSmoke" BorderColor="LightPink"  Width="194px" Height="42px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;<br />
    <br />
    <br />
    <br />
    <br />
&nbsp;<asp:Button ID="btnSubmit" runat="server" onclick="btnSubmitCategory_Click" 
        Text="Submit" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnClear" runat="server" CausesValidation="False" onclick="btnClearCategory_Click" 
        Text="Clear" Width="76px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
        Text="Cancel" CausesValidation="False" />
    <br />
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ForeColor="DeepPink" />
    <br />
    <asp:Label ID="lblMessage" runat="server" ForeColor="purple" Visible="False"></asp:Label>
        <br />
               </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Visible="false">
            <h1>Edit Category</h1>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingPalateDb %>" DeleteCommand="Delete From Category
   Where CategoryId = @CategoryId" InsertCommand="Insert Into Category ( [CategoryName] ) Values (@CategoryNmane)" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Category]" UpdateCommand="Update Category
   SET [CategoryName]=@CategoryName 
   Where CategoryId = @CategoryId">
                <DeleteParameters>
                    <asp:Parameter Name="CategoryId" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CategoryNmane" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CategoryName" />
                    <asp:Parameter Name="CategoryId" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="CategoryID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="CategoryID" HeaderText="Category ID" InsertVisible="False" ReadOnly="True" SortExpression="CategoryID" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category Name" SortExpression="CategoryName" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
       </center>
       <style type="text/css">
<!--
 a:link { color: purple; text-decoration: none; }
 a:hover { color: red; text-decoration: underline; }
--></style>
        <a  href="AdminDefault.aspx">Admin Home</a>
        
    </div>
    <br /><br />
</asp:Content>

