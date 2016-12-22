<%@ Page Title="" Language="C#" MasterPageFile="~/professor/Site2.Master" AutoEventWireup="true" CodeBehind="evaluating.aspx.cs" Inherits="Tutoring.professor.evaluating" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    튜터id : <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    인덱스 : <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <br />
    <br />정성 평가<br />
    <asp:TextBox ID="TextBox1" runat="server" Height="57px" Width="816px"></asp:TextBox>
    <br /><br />
    <br />
    정량 평가<asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Value="아주 우수"></asp:ListItem>
        <asp:ListItem Value="우수"></asp:ListItem>
        <asp:ListItem Value="보통"></asp:ListItem>
        <asp:ListItem Value="불량"></asp:ListItem>
        <asp:ListItem Value="매우 불량"></asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="작성" />
    <br />
</asp:Content>
