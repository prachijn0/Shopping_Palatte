<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingPalate/ShoppingMasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="ShoppingPalate_ShoppingPages_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--List of product will come--%>
    <asp:Repeater ID="Repeater1" runat="server"></asp:Repeater>
    <%--For now to show how to data will appear--%>
    <div class="">

        &nbsp;&nbsp;&nbsp;&nbsp;
       <asp:GridView ID="grdvwCart" runat="server" AutoGenerateColumns="False"
            OnRowCommand="grdvwCart_RowCommand" ForeColor="Purple" OnRowEditing="grdvwCart_RowEditing" DataKeyNames="ProductId" 
           OnDataBound="grdvwCart_DataBound">
            <Columns>
            <asp:BoundField DataField="ProductName" ItemStyle-ForeColor="Red" HeaderText="Product Name" />
            <asp:BoundField DataField="ProductPrice" ItemStyle-ForeColor="Red" HeaderText="ProductPrice" DataFormatString="{0:c}" />
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                  
                  
                    <asp:TextBox ID="txtQuantity" runat="server" ForeColor="Red" AutoPostBack="false" Text='<%# Bind("Quantity") %>' 
                        Width="41px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            
             <asp:ButtonField CommandName="Edit" Text="Update Quantity" />
            
            <asp:TemplateField>
            
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="btnRemove" Text="Remove" CommandName="Remove" CommandArgument='<%# Eval("ProductId") %>'></asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate>
             
                Total: $<asp:Label ID="lblTotal" ForeColor="Blue" runat="server"></asp:Label>
                </FooterTemplate>
            
            </asp:TemplateField>
                </Columns>
       </asp:GridView>
        <br />
        <asp:Label ID="Label1" runat="server" Text=" Total: $"></asp:Label>
     <asp:Label ID="lblTotal" runat="server"></asp:Label>
        <br />
        <br />
          <asp:LoginView
         ID="LoginView1" runat="server"  >
        <AnonymousTemplate>
          <h style="color:purple;">  To place your order, please <br /><br />
            <asp:LoginStatus ID="LoginStatus1" runat="server" /> <h style="color:red;"> or </h><a href="CreateUser.aspx">
                create an account</a>.
        </AnonymousTemplate>
        <LoggedInTemplate>
            <asp:ImageButton ID="btnCheckoutWithPaypal" runat="server" ImageUrl="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" OnClick="btnChkOut_Click" />
               <%--<asp:button runat="server" text="Check Out" ID="btnChkOut" OnClick="btnChkOut_Click"/>--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:button runat="server" text="Continue Shopping" ID="btnContShpng" OnClick="btnContShpng_Click"  />
        </LoggedInTemplate>
     </asp:LoginView>
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       
    </div>
  <br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>

