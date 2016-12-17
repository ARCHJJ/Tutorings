<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Tutoring.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        로그인<br />
        아이디(학번)&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        비밀번호&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="로그인" />
        <br />
        <asp:Label ID="warning" runat="server" Text="Label"></asp:Label>
        
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Width="130px">
            <asp:ListItem Value="0" Selected="True">학생</asp:ListItem>
            <asp:ListItem Value="1">교수</asp:ListItem>
        </asp:RadioButtonList>
        
    </div>
    </form>
</body>
</html>
