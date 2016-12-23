<%@ Page Title="" Language="C#" MasterPageFile="~/student/Site1.Master" AutoEventWireup="true" CodeBehind="cancel_time2.aspx.cs" Inherits="Tutoring.student.cancel_time2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="350px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="748px">
        <Columns>
            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
            <asp:BoundField DataField="튜터과목번호" HeaderText="튜터과목번호" SortExpression="튜터과목번호" />
            <asp:BoundField DataField="강좌명" HeaderText="강좌명" SortExpression="강좌명" />
            <asp:BoundField DataField="종료시간" HeaderText="시작시간" SortExpression="시작시간" />
            <asp:BoundField DataField="시작시간" HeaderText="종료시간" SortExpression="종료시간" />
            <asp:BoundField DataField="상담장소" HeaderText="상담장소" SortExpression="상담장소" />
            <asp:BoundField DataField="가능인원" HeaderText="가능인원" SortExpression="가능인원" />
            <asp:BoundField DataField="현재신청인원" HeaderText="현재신청인원" SortExpression="현재신청인원" />
            <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="삭제" ShowHeader="True" Text="삭제" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;A_상담시간등록&quot; WHERE (신청자학번 = :신청자학번) AND (인덱스 = :인덱스)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT a.NAME, b.튜터과목번호, b.강좌명, b.시작시간, b.종료시간, b.상담장소, b.가능인원, b.현재신청인원 FROM &quot;A_튜터신청현황&quot; c, &quot;A_시간예약뷰&quot; b, &quot;A_학생&quot; a WHERE c.인덱스 = b.튜터과목번호 AND c.튜터학번 = a.ID">
        <DeleteParameters>
            <asp:Parameter Name="신청자학번" />
            <asp:Parameter Name="인덱스" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
