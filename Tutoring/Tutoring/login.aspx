<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Tutoring.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="login.css">
</head>
<body>
    <form id="form1" runat="server">
        <h1>멘토링 관리 시스템</h1>
    <div id="login">
        로그인<br />
        아이디(학번)
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="숫자 학번(교번)을 입력하세요." ControlToValidate="TextBox1" MaximumValue="99999999" MinimumValue="0" Type="Integer"></asp:RangeValidator>
        <br />
        비밀번호&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox><br />
        <asp:Label ID="warning" runat="server" Text="처음방문한 회원은 회원가입 해주세요."></asp:Label>
        
        
        
        <br /><br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Width="194px">
            <asp:ListItem Value="0" Selected="True">학생</asp:ListItem>
            <asp:ListItem Value="1">교수/관리자</asp:ListItem>
        </asp:RadioButtonList>
        <br/>
        <br />
        
        
        <a href="register.aspx">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="로그인" />
        </div>
    </form>
</body>
</html>
