<%@ Page Title="" Language="C#" MasterPageFile="~/professor/Site2.Master" AutoEventWireup="true" CodeBehind="activitying.aspx.cs" Inherits="Tutoring.professor.activitying" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    학생들의 평가
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select  평가자id, 정성평가, 정량평가
from A_평가 
where 인덱스=:indexs and 구분=1">
        <SelectParameters>
            <asp:QueryStringParameter Name="indexs" QueryStringField="index" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />튜터활동내역
    <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2">
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select 인덱스, 학생학번, 시작시간, 종료시간, 상담내용, 결석유무 from A_튜터활동내용 where 인덱스=:indexs">
        <SelectParameters>
            <asp:QueryStringParameter Name="indexs" QueryStringField="index" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
