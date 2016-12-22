<%@ Page Title="" Language="C#" MasterPageFile="~/professor/Site2.Master" AutoEventWireup="true" CodeBehind="activitying.aspx.cs" Inherits="Tutoring.professor.activitying" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select  평가자id, 정성평가, 정량평가
from A_평가 
where 인덱스=:indexs and 구분=1">
        <SelectParameters>
            <asp:QueryStringParameter Name="indexs" QueryStringField="index" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
