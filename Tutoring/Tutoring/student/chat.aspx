<%@ Page Title="" Language="C#" MasterPageFile="~/student/Site1.Master" AutoEventWireup="true" CodeBehind="chat.aspx.cs" Inherits="Tutoring.student.chat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <iframe src="http://52.78.180.143:3000/public/chat.html" width="48%" height="98%" frameborder="0" name="chat" id="chat" scrolling="no"></iframe>
</asp:Content>
