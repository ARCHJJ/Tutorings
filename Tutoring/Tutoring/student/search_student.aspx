<%@ Page Title="" Language="C#" MasterPageFile="~/student/Site1.Master" AutoEventWireup="true" CodeBehind="search_student.aspx.cs" Inherits="Tutoring.student.search_student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    년<asp:DropDownList ID="year" runat="server" AutoPostBack="True">
        <asp:ListItem Selected="True">2016</asp:ListItem>
        <asp:ListItem>2015</asp:ListItem>
        <asp:ListItem>2014</asp:ListItem>
    </asp:DropDownList>
    월<asp:DropDownList ID="month" runat="server" AutoPostBack="True">
        <asp:ListItem>01</asp:ListItem>
        <asp:ListItem>02</asp:ListItem>
        <asp:ListItem>03</asp:ListItem>
        <asp:ListItem>04</asp:ListItem>
        <asp:ListItem>05</asp:ListItem>
        <asp:ListItem>06</asp:ListItem>
        <asp:ListItem>07</asp:ListItem>
        <asp:ListItem>08</asp:ListItem>
        <asp:ListItem>09</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>11</asp:ListItem>
        <asp:ListItem Selected="True">12</asp:ListItem>
    </asp:DropDownList>
    <hr />
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="인덱스" HeaderText="인덱스" SortExpression="인덱스" />
            <asp:BoundField DataField="강좌명" HeaderText="강좌명" SortExpression="강좌명" />
            <asp:BoundField DataField="시작시간" HeaderText="시작시간" SortExpression="시작시간" />
            <asp:BoundField DataField="종료시간" HeaderText="종료시간" SortExpression="종료시간" />
            <asp:BoundField DataField="상담내용" HeaderText="상담내용" SortExpression="상담내용" />
            <asp:BoundField DataField="결석유무" HeaderText="결석유무" SortExpression="결석유무" />
        </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select a.인덱스, 강좌명, 시작시간, 종료시간, 상담내용, 결석유무 from A_튜터활동내용 a, A_튜터신청현황 b where a.인덱스=b.인덱스 and 학생학번=:id and to_char(시작시간, 'yyyy' )=:year and to_char(시작시간, 'mm')=:month">
    <SelectParameters>
        <asp:SessionParameter Name="id" SessionField="id" />
        <asp:ControlParameter ControlID="year" DefaultValue="" Name="year" PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="month" DefaultValue="" Name="month" PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
