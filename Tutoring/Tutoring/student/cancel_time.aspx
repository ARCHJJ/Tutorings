<%@ Page Title="" Language="C#" MasterPageFile="~/student/Site1.Master" AutoEventWireup="true" CodeBehind="cancel_time.aspx.cs" Inherits="Tutoring.student.cancel_time" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="344px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="759px">
        <Columns>
            <asp:BoundField DataField="강좌번호" HeaderText="강좌번호" SortExpression="강좌번호" />
            <asp:BoundField DataField="강좌명" HeaderText="강좌명" SortExpression="강좌명" />
            <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="신청취소" ShowHeader="True" Text="취소" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT b.강좌번호, b.강좌명 FROM &quot;A_수강정보&quot; a, &quot;A_튜터신청현황&quot; b, &quot;A_상담시간공지&quot; c WHERE a.강좌번호 = b.강좌번호 AND b.인덱스 = c.인덱스 AND (a.학번 = :ID)">
        <SelectParameters>
            <asp:SessionParameter Name="ID" SessionField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
