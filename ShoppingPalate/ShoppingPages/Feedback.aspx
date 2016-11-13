<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingPalate/ShoppingMasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="ShoppingPalate_ShoppingPages_Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #txtFeedback {
            height: 181px;
            width: 505px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <div class="">
        <br />
        <br />
        <br />
        &nbsp;
        <asp:Label ID="lblFeedback" runat="server" ForeColor="Purple" Text="Please Provide Your Valuable Feedback"></asp:Label>
        <br />&nbsp;
        <br />
        <asp:Label ID="Lbl" runat="server" ForeColor="Purple" Text="Category"></asp:Label>
       &nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="Category" runat="server" ForeColor="Purple" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryID">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ForeColor="DeepPink" runat="server" InitialValue="0" ControlToValidate="Category"  ErrorMessage="*" runat="server"></asp:RequiredFieldValidator>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingPalateDb %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
        <br />

        
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="Lbl1" runat="server" ForeColor="Purple" Text="Products"></asp:Label>
            &nbsp;&nbsp;&nbsp;
         <asp:DropDownList ID="Product" runat="server" ForeColor="Purple" DataSourceID="SqlDataSource2" DataTextField="ProductName" DataValueField="ProductID" OnSelectedIndexChanged="ChangeDropdownlist"> </asp:DropDownList>
       </ContentTemplate>
           <Triggers>
           <asp:AsyncPostBackTrigger ControlID="Product" EventName="SelectedIndeXChanged" />
            </Triggers>
       </asp:UpdatePanel>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingPalateDb %>" SelectCommand="SELECT [ProductID], ProductName FROM [Product] where CategoryID = @categoryid">
            <SelectParameters>
                <asp:ControlParameter ControlID="Category" Name="categoryid" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br /><br />

       
        
        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"  Width="500px" Height="299px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please provide feedback" ControlToValidate="TextBox1" ></asp:RequiredFieldValidator>
        
        <ajaxToolkit:HtmlEditorExtender ID="HtmlEditorExtender1" runat="server"   TargetControlID="TextBox1" EnableSanitization="False"></ajaxToolkit:HtmlEditorExtender>
        <br />
        <br />
      
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" BackColor="WhiteSmoke" OnClick="btnSubmit_Click" /><br />
        <asp:Label ID="Label1" runat="server" ></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>

