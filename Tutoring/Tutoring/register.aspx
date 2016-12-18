<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Tutoring.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        학번<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        이름<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        이메일<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        비밀번호<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    
    </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    
        <br />
        <asp:Label ID="warning" runat="server" Text="Label"></asp:Label>
        <br />
    </form>
</body>
</html>
