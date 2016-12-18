<%@ Page Title="" Language="C#" MasterPageFile="~/professor/Site2.Master" AutoEventWireup="true" CodeBehind="confirm_tutor.aspx.cs" Inherits="Tutoring.confirm_tutor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="인덱스" DataSourceID="SqlDataSource1" Height="176px" Width="777px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="인덱스" HeaderText="인덱스" ReadOnly="True" SortExpression="인덱스" />
        <asp:BoundField DataField="강좌번호" HeaderText="강좌번호" SortExpression="강좌번호" />
        <asp:BoundField DataField="학년도" HeaderText="학년도" SortExpression="학년도" />
        <asp:BoundField DataField="학기" HeaderText="학기" SortExpression="학기" />
        <asp:BoundField DataField="강좌명" HeaderText="강좌명" SortExpression="강좌명" />
        <asp:BoundField DataField="튜터학번" HeaderText="튜터학번" SortExpression="튜터학번" />
        <asp:BoundField DataField="튜터이름" HeaderText="튜터이름" SortExpression="튜터이름" />
        <asp:BoundField DataField="튜터평점" HeaderText="튜터평점" SortExpression="튜터평점" />
        <asp:BoundField DataField="확정여부" HeaderText="확정여부" SortExpression="확정여부" />
        <asp:CommandField ButtonType="Button" HeaderText="승인" SelectText="승인" ShowSelectButton="True" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select t.인덱스, t.강좌번호, 강좌명, 튜터학번, s.name as 튜터이름,  grade as 튜터평점, 확정여부, t.학년도, t.학기
from A_튜터신청현황 t, A_강좌개설정보 g, A_학생 s
where t.강좌번호 = g.강좌번호 and t.튜터학번=s.id and 교수id=:pid and g.학년도=:year">
    <SelectParameters>
        <asp:SessionParameter Name="PID" SessionField="id" />
        <asp:FormParameter DefaultValue="2016" FormField="year" Name="year" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
