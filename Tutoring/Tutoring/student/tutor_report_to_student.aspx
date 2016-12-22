<%@ Page Title="" Language="C#" MasterPageFile="~/student/Site1.Master" AutoEventWireup="true" CodeBehind="tutor_report_to_student.aspx.cs" Inherits="Tutoring.student.tutor_report_to_student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="학생의 학번"></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="일자"></asp:Label>
    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
    <asp:Label ID="Label8" runat="server" Text="ex) 2016-12-25"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="시작시간"></asp:Label>
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    <asp:Label ID="Label9" runat="server" Text="ex)15:00"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="종료시간"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <asp:Label ID="Label10" runat="server" Text="ex)18:00"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" Text="상담내용"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox6" runat="server" Height="184px" Width="282px"></asp:TextBox>
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="Label7" runat="server" Text="결석유무"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Value="0">출석</asp:ListItem>
        <asp:ListItem Value="1">결석</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="저장" Width="104px" />
    <br />
    </asp:Content>
