<%@ Page Title="" Language="C#" MasterPageFile="~/student/Site1.Master" AutoEventWireup="true" CodeBehind="tutor_estimate.aspx.cs" Inherits="Tutoring.student.tutor_estimate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="강좌명" HeaderText="강좌명" SortExpression="강좌명" />
            <asp:BoundField DataField="튜터학번" HeaderText="튜터학번" SortExpression="튜터학번" />
            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
            <asp:ButtonField ButtonType="Button" CommandName="Cancel" HeaderText="평가하기" ShowHeader="True" Text="평가" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select 강좌명, 튜터학번, s.name from A_튜터신청현황 t, A_학생 s  where t.튜터학번=s.id and 인덱스 in (
select distinct(인덱스) from A_튜터활동내용 where 학생학번=:id and to_char(시작시간, 'yyyy' )=:year)">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="id" />
            <asp:SessionParameter Name="year" SessionField="year" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
