<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="update_user.aspx.cs" Inherits="Tutoring.update_user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        사용자 정보 수정<br />
전화번호<asp:TextBox ID="phone" runat="server" AutoPostBack="True"></asp:TextBox>
<br />
<br />
주소<asp:TextBox ID="address" runat="server" AutoPostBack="True"></asp:TextBox>
<br />
<br />
이메일<asp:TextBox ID="email" runat="server" AutoPostBack="True"></asp:TextBox>
<br />
<br />
비번<asp:TextBox ID="password" runat="server" AutoPostBack="True"></asp:TextBox>
<asp:Button ID="Button1" runat="server" Height="17px" OnClick="Button1_Click" Text="Button" />
<br />
&nbsp;
</asp:Content>
