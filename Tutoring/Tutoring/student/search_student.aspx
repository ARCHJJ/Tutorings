<%@ Page Title="" Language="C#" MasterPageFile="~/student/Site1.Master" AutoEventWireup="true" CodeBehind="search_student.aspx.cs" Inherits="Tutoring.student.search_student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select 인덱스, 시작시간, 종료시간, 상담내용, 결석유무 from A_튜터활동내용 where 학생학번=:id and to_char(시작시간, 'yyyy' )=:year and to_char(시작시간, 'mm')=:month;">
    <SelectParameters>
        <asp:SessionParameter Name="id" SessionField="id" />
        <asp:FormParameter FormField="year" Name="year" />
        <asp:Parameter DefaultValue="month" Name="month" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
