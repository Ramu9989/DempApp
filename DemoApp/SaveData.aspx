<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveData.aspx.cs" Inherits="DemoApp.SaveData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div  style="margin-left: 500px;" >
  <asp:label runat="server" text="Enter Values Here to Save data:" Font-Bold="true" ForeColor="Blue"></asp:label><br />

        <asp:label runat="server" text="Fisrt Name  :"></asp:label>
        <asp:TextBox ID="txtFistName" runat="server"></asp:TextBox><br />

        <asp:label runat="server" text="Last Name:"></asp:label>
        <asp:TextBox ID="txtLastName" runat="server" style="margin-left: 6px;"></asp:TextBox><br />

        
        <asp:label runat="server" text="Gender    :"></asp:label>
        <%--<asp:TextBox ID="txtGender" runat="server" style="margin-left: 20px;"></asp:TextBox>--%>
        <asp:DropDownList ID="ddGender" runat="server"  style="margin-left: 24px;" >  
               
            <asp:ListItem>Male</asp:ListItem> 
            <asp:ListItem>Female </asp:ListItem>  
            <asp:ListItem>Transgender</asp:ListItem>                 
        </asp:DropDownList>  
        <br />

         
        <asp:label runat="server" text="Salary:"></asp:label>
        <asp:TextBox ID="txtSalary" runat="server" style="margin-left: 35px;"></asp:TextBox><br />
        
          
        
        
         <asp:label runat="server" text="Search:"></asp:label>
        <asp:TextBox ID="txtSearch" runat="server" style="margin-left: 32px;"></asp:TextBox><br />
         <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" style=" margin-left: 88px;"/>
        <asp:Button ID="btnGetData" runat="server" Text="Get Data" onclick="btnGetData_Click" style=" margin-left: 51px;"/><br /> 
        


        <asp:label ID="lblMsg"   runat="server" text="" Font-Bold="true"></asp:label><br />
         <asp:label ID="lblLastName"   runat="server" text="" Font-Bold="true"></asp:label><br />
         <asp:label ID="lblSalay"   runat="server" text="" Font-Bold="true"></asp:label>
       
<%--         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
Style="top: 98px; left: 367px; position: absolute; height: 26px; width: 162px" 
ErrorMessage="Fisrt name required" ControlToValidate="txtFistName" ForeColor="Red">
</asp:RequiredFieldValidator>  
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
Style="top: 98px; left: 500px; position: absolute; height: 26px; width: 190px" 
ErrorMessage="Last name required" ControlToValidate="txtLastName" ForeColor="Red" >
</asp:RequiredFieldValidator>  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
Style="top: 98px; left: 700px; position: absolute; height: 26px; width: 210px" 
ErrorMessage="Gender  required" ControlToValidate="txtGender" ForeColor="Red" >
</asp:RequiredFieldValidator> 
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
Style="top: 98px; left: 900px; position: absolute; height: 26px; width: 210px" 
ErrorMessage="Salary  required:" ControlToValidate="txtSalary" ForeColor="Red" >
</asp:RequiredFieldValidator> --%>

        <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
         <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

    </div>
        
    </form>
</body>
</html>

