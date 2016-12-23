<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site3.Master" AutoEventWireup="true" CodeBehind="register_subject.aspx.cs" Inherits="Tutoring.admin.register_subject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="강좌번호,학년도,학기" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="강좌번호" HeaderText="강좌번호" ReadOnly="True" SortExpression="강좌번호" />
            <asp:BoundField DataField="학년도" HeaderText="학년도" ReadOnly="True" SortExpression="학년도" />
            <asp:BoundField DataField="학기" HeaderText="학기" ReadOnly="True" SortExpression="학기" />
            <asp:BoundField DataField="교과목명" HeaderText="교과목명" SortExpression="교과목명" />
            <asp:BoundField DataField="튜터신청가능여부" HeaderText="튜터신청가능여부" SortExpression="튜터신청가능여부" />
            <asp:BoundField DataField="신청가능학점" HeaderText="신청가능학점" SortExpression="신청가능학점" />
            <asp:BoundField DataField="신청가능평점" HeaderText="신청가능평점" SortExpression="신청가능평점" />
            <asp:BoundField DataField="교수ID" HeaderText="교수ID" SortExpression="교수ID" />
            <asp:BoundField DataField="신청시작" HeaderText="신청시작" SortExpression="신청시작" />
            <asp:BoundField DataField="신청종료" HeaderText="신청종료" SortExpression="신청종료" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;A_강좌개설정보&quot; WHERE &quot;강좌번호&quot; = :original_강좌번호 AND &quot;학년도&quot; = :original_학년도 AND &quot;학기&quot; = :original_학기" InsertCommand="INSERT INTO &quot;A_강좌개설정보&quot; (&quot;강좌번호&quot;, &quot;학년도&quot;, &quot;학기&quot;, &quot;교과목명&quot;, &quot;튜터신청가능여부&quot;, &quot;신청가능학점&quot;, &quot;신청가능평점&quot;, &quot;교수ID&quot;, &quot;신청시작&quot;, &quot;신청종료&quot;) VALUES (:강좌번호, :학년도, :학기, :교과목명, :튜터신청가능여부, :신청가능학점, :신청가능평점, :교수ID, :신청시작, :신청종료)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;A_강좌개설정보&quot; ORDER BY &quot;학년도&quot; DESC, &quot;학기&quot; DESC" UpdateCommand="UPDATE &quot;A_강좌개설정보&quot; SET &quot;교과목명&quot; = :교과목명, &quot;튜터신청가능여부&quot; = :튜터신청가능여부, &quot;신청가능학점&quot; = :신청가능학점, &quot;신청가능평점&quot; = :신청가능평점, &quot;교수ID&quot; = :교수ID, &quot;신청시작&quot; = :신청시작, &quot;신청종료&quot; = :신청종료 WHERE &quot;강좌번호&quot; = :original_강좌번호 AND &quot;학년도&quot; = :original_학년도 AND &quot;학기&quot; = :original_학기">
        <DeleteParameters>
            <asp:Parameter Name="original_강좌번호" Type="String" />
            <asp:Parameter Name="original_학년도" Type="Decimal" />
            <asp:Parameter Name="original_학기" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="강좌번호" Type="String" />
            <asp:Parameter Name="학년도" Type="Decimal" />
            <asp:Parameter Name="학기" Type="Decimal" />
            <asp:Parameter Name="교과목명" Type="String" />
            <asp:Parameter Name="튜터신청가능여부" Type="Decimal" />
            <asp:Parameter Name="신청가능학점" Type="Decimal" />
            <asp:Parameter Name="신청가능평점" Type="Decimal" />
            <asp:Parameter Name="교수ID" Type="Decimal" />
            <asp:Parameter Name="신청시작" Type="DateTime" />
            <asp:Parameter Name="신청종료" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="교과목명" Type="String" />
            <asp:Parameter Name="튜터신청가능여부" Type="Decimal" />
            <asp:Parameter Name="신청가능학점" Type="Decimal" />
            <asp:Parameter Name="신청가능평점" Type="Decimal" />
            <asp:Parameter Name="교수ID" Type="Decimal" />
            <asp:Parameter Name="신청시작" Type="DateTime" />
            <asp:Parameter Name="신청종료" Type="DateTime" />
            <asp:Parameter Name="original_강좌번호" Type="String" />
            <asp:Parameter Name="original_학년도" Type="Decimal" />
            <asp:Parameter Name="original_학기" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
