<%@ Page Title="" Language="C#" MasterPageFile="~/student/Site1.Master" AutoEventWireup="true" CodeBehind="registertime.aspx.cs" Inherits="Tutoring.student.registertime" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<asp:Label ID="Label1" runat="server" Text="상담장소"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label2" runat="server" Text="가능인원"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Value="1">1명</asp:ListItem>
        <asp:ListItem Value="2">2명</asp:ListItem>
        <asp:ListItem Value="3">3명</asp:ListItem>
        <asp:ListItem Value="4">4명</asp:ListItem>
        <asp:ListItem Value="5">5명</asp:ListItem>
        <asp:ListItem Value="6">6명</asp:ListItem>
        <asp:ListItem Value="7">7명</asp:ListItem>
        <asp:ListItem Value="8">8명</asp:ListItem>
        <asp:ListItem Value="9">9명</asp:ListItem>
        <asp:ListItem Value="10">10명</asp:ListItem>
        <asp:ListItem Value="11">11명</asp:ListItem>
        <asp:ListItem Value="12">12명</asp:ListItem>
        <asp:ListItem Value="13">13명</asp:ListItem>
        <asp:ListItem Value="14">14명</asp:ListItem>
        <asp:ListItem Value="15">15명</asp:ListItem>       
    </asp:DropDownList>
    <br />
    <asp:Label ID="Label3" runat="server" Text="시작시간"></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server" ></asp:TextBox>
    <asp:Label ID="Label6" runat="server" Text="ex) 2016-12-26 15:00"></asp:Label>
    <br />
    <asp:Label ID="Label4" runat="server" Text="종료시간"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
    <asp:Label ID="Label7" runat="server" Text="ex) 2016-12-26 17:00"></asp:Label>
    <br />
    <asp:Label ID="Label5" runat="server" Text="취소가능날짜"></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server">
        <asp:ListItem  Value="1"> 1일전</asp:ListItem>
        <asp:ListItem  Value="2"> 2일전</asp:ListItem>
        <asp:ListItem  Value="3"> 3일전</asp:ListItem>
        <asp:ListItem  Value="4"> 4일전</asp:ListItem>
        <asp:ListItem  Value="5"> 5일전</asp:ListItem>
    </asp:DropDownList>
  
    <br />
    <asp:Button ID="Button4" runat="server" Text="시간등록" OnClick="Button4_Click" />
  
    <br />
</asp:Content>
