<%@ Page Title="" Language="C#" MasterPageFile="~/student/Site1.Master" AutoEventWireup="true" CodeBehind="Choice_TIme.aspx.cs" Inherits="Tutoring.student.Choice_TIme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="369px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" Width="877px">
        <Columns>
            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
            <asp:BoundField DataField="튜터과목번호" HeaderText="튜터과목번호" SortExpression="튜터과목번호" />
            <asp:BoundField DataField="강좌명" HeaderText="강좌명" SortExpression="강좌명" />
            <asp:BoundField DataField="TO_CHAR(B.종료시간,'YYYY-MM-DDHH24:MI')" HeaderText="시작시간" SortExpression="시작시간" />
            <asp:BoundField DataField="TO_CHAR(B.시작시간,'YYYY-MM-DDHH24:MI')" HeaderText="종료시간" SortExpression="종료시간" />
            <asp:BoundField DataField="상담장소" HeaderText="상담장소" SortExpression="상담장소" />
            <asp:BoundField DataField="가능인원" HeaderText="가능인원" SortExpression="가능인원" />
            <asp:BoundField DataField="현재신청인원" HeaderText="현재신청인원" SortExpression="현재신청인원" />
            <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="신청" ShowHeader="True" Text="신청" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT a.NAME, b.튜터과목번호, b.강좌명, To_char(b.시작시간, 'YYYY-MM-DD HH24:MI'), To_char(b.종료시간, 'YYYY-MM-DD HH24:MI') , b.상담장소, b.가능인원, b.현재신청인원 FROM &quot;A_튜터신청현황&quot; c, &quot;A_시간예약뷰&quot; b, &quot;A_학생&quot; a WHERE c.인덱스 = b.튜터과목번호 AND c.튜터학번 = a.ID" DeleteCommand="delete from A_상담시간등록 where 신청자학번=:신청자학번 and 인덱스= :인덱스">
        <DeleteParameters>
            <asp:Parameter Name="신청자학번" />
            <asp:Parameter Name="인덱스" />
        </DeleteParameters>
    </asp:SqlDataSource>
    </asp:Content>
