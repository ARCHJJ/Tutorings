<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="apply_tutor.aspx.cs" Inherits="Tutoring.apply_tutor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="강좌번호" HeaderText="강좌번호" SortExpression="강좌번호" />
        <asp:BoundField DataField="교과목명" HeaderText="교과목명" SortExpression="교과목명" />
        <asp:BoundField DataField="신청가능평점" HeaderText="신청가능평점" SortExpression="신청가능평점" />
        <asp:BoundField DataField="신청시작" HeaderText="신청시작" SortExpression="신청시작" />
        <asp:BoundField DataField="신청종료" HeaderText="신청종료" SortExpression="신청종료" />
        <asp:ButtonField ButtonType="Button" CommandName="Update" HeaderText="신청" ShowHeader="True" Text="신청" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;강좌번호&quot;, &quot;교과목명&quot;, &quot;신청가능평점&quot;, &quot;신청시작&quot;, &quot;신청종료&quot; FROM &quot;A_강좌개설정보&quot; WHERE ((&quot;학년도&quot; = :학년도) AND (&quot;학기&quot; = :학기))">
    <SelectParameters>
        <asp:FormParameter DefaultValue="2016" FormField="year" Name="학년도" Type="Decimal" />
        <asp:FormParameter DefaultValue="2" FormField="semester" Name="학기" Type="Decimal" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
