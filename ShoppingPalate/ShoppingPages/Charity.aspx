<%@ Page Title="" Language="C#" MasterPageFile="~/ShoppingPalate/ShoppingMasterPage.master" AutoEventWireup="true" CodeFile="Charity.aspx.cs" Inherits="ShoppingPalate_ShoppingPages_Charity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 29px;
        }
        .auto-style2 {
            width: 120px;
        }
        .auto-style3 {
            height: 29px;
            width: 120px;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

        <div>
             
     <table align="center"             
           
           style="width: 38%; font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: normal; height: 546px;" 
           frame="void">
        
       <tr>
          
           <td class="auto-style2" style="color:purple">Name</td>
           <td>
               <asp:TextBox ID="txtName"   runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="DeepPink"  runat="server" ControlToValidate="txtName"  ErrorMessage="Name field cannot be empty">*</asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtName" Display="Dynamic" 
                        ErrorMessage = "Use letters only " ForeColor="DeepPink" 
                        SetFocusOnError="True"  
                        ValidationExpression="^[a-zA-Z ]+$"  
                        Font-Italic="True" Font-Size="Small">*</asp:RegularExpressionValidator>  
                </td>
       </tr>
         <tr>
           <td class="auto-style2"  style="color:purple">Date of Birth</td>
           <td>
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

             <asp:TextBox ID="txtCalendar"  runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Select a Date Of Birth" ControlToValidate="txtCalendar" Font-Italic="True" Font-Size="Small" ForeColor="DeepPink">*</asp:RequiredFieldValidator>
           <asp:CompareValidator ErrorMessage="(mm/dd/yyyy)" Display="Dynamic" ID="valcDate" ControlToValidate="txtCalendar" Operator="DataTypeCheck" Type="Date" runat="server" Font-Italic="True" Font-Size="Small" ForeColor="DeepPink">*</asp:CompareValidator>           

<%--<asp:RangeValidator ID="valrDate" runat="server" ControlToValidate="txtCalendar" MinimumValue="12/31/1950" MaximumValue="1/1/2100" Type="Date" text="Invalid Date" Display="Dynamic"/>--%>
             <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtCalendar" />
           
</td>
       </tr>
         <tr>
           <td class="auto-style3"  style="color:purple">Phone Number</td>
           <td class="auto-style1">
               <asp:TextBox ID="txtPhoneNo" runat="server"></asp:TextBox>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="txtPhoneNo"   SetFocusOnError="True"  ErrorMessage="Enter Phonenumber in Numeric" 
                        ForeColor="DeepPink"   ValidationExpression="^\d+$" Display="Dynamic"
                        Font-Italic="True" Font-Size="Small">*</asp:RegularExpressionValidator>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="DeepPink" ControlToValidate="txtPhoneNo" ErrorMessage="Phone Number cannot be empty">*</asp:RequiredFieldValidator>
    
                    
</td>
       </tr>
        <tr>
           <td class="auto-style2"  style="color:purple">Address</td>
           <td>
               <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="DeepPink" ControlToValidate="txtAddress"  ErrorMessage="Address field cannot be empty">*</asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                        ControlToValidate="txtAddress" Display="Dynamic" 
                        ErrorMessage="Cannot contain special characters" ForeColor="DeepPink" 
                        SetFocusOnError="True" 
                        ValidationExpression="[0-9a-zA-Z #,-]+"
                        Font-Italic="True" Font-Size="Small">*</asp:RegularExpressionValidator>
</td>
       </tr>
         <tr>
           <td class="auto-style2"  style="color:purple">Amount</td>
           <td>
               <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="DeepPink" ControlToValidate="txtAmount" ErrorMessage="Amount field cannot be empty">*</asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="txtAmount"  SetFocusOnError="True"  ErrorMessage="Enter amount in Numeric" 
                        ForeColor="DeepPink" ValidationExpression="^\d+$"  Display="Dynamic"
                        Font-Italic="True" Font-Size="Small">*</asp:RegularExpressionValidator>
               <asp:RangeValidator ID="RngValidateAmnt" runat="server" ErrorMessage="You can donate upto $1000" ControlToValidate="txtAmount" 
                   Type="Integer" MinimumValue="1" MaximumValue="1000" ForeColor="DeepPink" Font-Italic="True" Font-Size="Small">*</asp:RangeValidator>
           </td>
       </tr>
        <tr>
            <td class="auto-style2"  style="color:purple"> Names for donation </td>
            <td>
               
                
            <asp:DropDownList ID="txtFoundationID" runat="server" ForeColor="Purple" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id" OnSelectedIndexChanged="txtFoundationID_SelectedIndexChanged">
            </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="DeepPink" ErrorMessage="Please select a Foundation" ControlToValidate="txtFoundationID">*</asp:RequiredFieldValidator>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingPalateDb %>" SelectCommand="SELECT * FROM [mst_charity]"></asp:SqlDataSource>
                </td>
        </tr>
         <tr>
          
           <td class="auto-style2" style="color:Purple">
               <asp:Button ID="btnPayment" runat="server" ForeColor="Purple" Text="Payment" OnClick="btnPayment_Click" /></td>
             

             
             <br />
                  <asp:ValidationSummary ID="ValidationSummary1" Visible="true" runat="server" 
                        Font-Size="Medium" ForeColor="DeepPink" />
                   
         <asp:Label ID="Label1" runat="server" ForeColor="Purple"  Text="DONATION"></asp:Label><br/>
             <asp:Label ID="lblMessage"  runat="server" Visible="false" Text="" ForeColor="Red"></asp:Label>
                 </div>
       </tr>
        </div> 
    </table>
    
    
        </div>
    
    
</asp:Content>

