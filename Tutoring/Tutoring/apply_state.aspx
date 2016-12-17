<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="apply_state.aspx.cs" Inherits="Tutoring.apply_state" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="인덱스" DataSourceID="SqlDataSource1" Height="267px" Width="675px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="인덱스" HeaderText="신청번호" SortExpression="인덱스" />
            <asp:BoundField DataField="강좌번호" HeaderText="강좌코드" SortExpression="강좌번호" />
            <asp:BoundField DataField="강좌명" HeaderText="강좌명" SortExpression="강좌명" />
            <asp:BoundField DataField="튜터학번" HeaderText="튜터학번" SortExpression="튜터학번" />
            <asp:BoundField DataField="확정여부" HeaderText="확정여부" SortExpression="확정여부" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;강좌번호&quot;, &quot;튜터학번&quot;, &quot;확정여부&quot;, &quot;인덱스&quot;, &quot;강좌명&quot; FROM &quot;A_튜터신청현황&quot; WHERE (&quot;튜터학번&quot; = :튜터학번)" DeleteCommand="DELETE FROM &quot;A_튜터신청현황&quot; WHERE (인덱스 = :인덱스)" InsertCommand="INSERT INTO &quot;A_튜터신청현황&quot; (&quot;강좌번호&quot;, &quot;튜터학번&quot;, &quot;확정여부&quot;, &quot;인덱스&quot;, &quot;강좌명&quot;) VALUES (:강좌번호, :튜터학번, :확정여부, :인덱스, :강좌명)" UpdateCommand="UPDATE &quot;A_튜터신청현황&quot; SET &quot;강좌번호&quot; = :강좌번호, &quot;튜터학번&quot; = :튜터학번, &quot;확정여부&quot; = :확정여부, &quot;강좌명&quot; = :강좌명 WHERE &quot;인덱스&quot; = :인덱스">
        <DeleteParameters>
            <asp:Parameter Name="인덱스" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="강좌번호" Type="String" />
            <asp:Parameter Name="튜터학번" Type="Decimal" />
            <asp:Parameter Name="확정여부" Type="Decimal" />
            <asp:Parameter Name="인덱스" Type="Decimal" />
            <asp:Parameter Name="강좌명" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="튜터학번" SessionField="id" Type="Decimal" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="강좌번호" Type="String" />
            <asp:Parameter Name="튜터학번" Type="Decimal" />
            <asp:Parameter Name="확정여부" Type="Decimal" />
            <asp:Parameter Name="강좌명" Type="String" />
            <asp:Parameter Name="인덱스" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
