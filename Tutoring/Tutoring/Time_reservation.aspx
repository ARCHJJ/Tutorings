<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Time_reservation.aspx.cs" Inherits="Tutoring.Time_reservation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
</p>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="377px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="638px">
    <Columns>
        <asp:BoundField DataField="학년" HeaderText="학년" SortExpression="학년" />
        <asp:BoundField DataField="학기" HeaderText="학기" SortExpression="학기" />
        <asp:BoundField DataField="강좌번호" HeaderText="강좌번호" SortExpression="강좌번호" />
        <asp:ButtonField ButtonType="Button" CommandName="Update" HeaderText="예약버튼" ShowHeader="True" Text="예약" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;학년&quot;, &quot;학기&quot;, &quot;강좌번호&quot; FROM &quot;A_수강정보&quot; WHERE (&quot;학번&quot; = :학번)">
    <SelectParameters>
        <asp:SessionParameter Name="학번" SessionField="id" Type="Decimal" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
