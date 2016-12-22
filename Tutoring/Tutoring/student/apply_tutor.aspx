<%@ Page Title="" Language="C#" MasterPageFile="~/student/Site1.Master" AutoEventWireup="true" CodeBehind="apply_tutor.aspx.cs" Inherits="Tutoring.student.apply_tutor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="253px" style="margin-bottom: 0px" Width="769px" DataKeyNames="강좌번호,학년도,학기">
    <Columns>
        <asp:BoundField DataField="강좌번호" HeaderText="강좌번호" SortExpression="강좌번호" ReadOnly="True" />
        <asp:BoundField DataField="교과목명" HeaderText="교과목명" SortExpression="교과목명" />
        <asp:BoundField DataField="학년도" HeaderText="학년도" ReadOnly="True" SortExpression="학년도" />
        <asp:BoundField DataField="학기" HeaderText="학기" ReadOnly="True" SortExpression="학기" />
        <asp:BoundField DataField="신청가능평점" HeaderText="신청가능평점" SortExpression="신청가능평점" />
        <asp:BoundField DataField="신청시작" HeaderText="신청시작" SortExpression="신청시작" />
        <asp:BoundField DataField="신청종료" HeaderText="신청종료" SortExpression="신청종료" />
        <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="신청" ShowHeader="True" Text="신청" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;강좌번호&quot;, &quot;교과목명&quot;, &quot;학년도&quot;, &quot;학기&quot;, &quot;신청가능평점&quot;, &quot;신청시작&quot;, &quot;신청종료&quot; FROM &quot;A_강좌개설정보&quot; WHERE ((&quot;학년도&quot; = :학년도) AND (&quot;학기&quot; = :학기)) and 튜터신청가능여부=1 and 신청종료&gt;sysdate">
    <SelectParameters>
        <asp:FormParameter DefaultValue="2016" FormField="year" Name="학년도" Type="Decimal" />
        <asp:FormParameter DefaultValue="2" FormField="semester" Name="학기" Type="Decimal" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
