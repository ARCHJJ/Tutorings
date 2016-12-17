<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TutorActing.aspx.cs" Inherits="Tutoring.TutorActing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    튜터의 활동보고
        <br />
        <br />
        튜터 학번 :
        <asp:Label ID="Label1" runat="server" Text="Tutorid"></asp:Label>
        <br />
        <br />
        이름 :
        <asp:Label ID="Label2" runat="server" Text="TutorName"></asp:Label>
        <br />
        <br />
        강좌정보 :
        <asp:Label ID="Label3" runat="server" Text="inform"></asp:Label>
        <br />
        <br />
        학생의 학번 :
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        &nbsp;<br />
        <br />
        날짜 : <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" style="margin-top: 0px" Width="496px"></asp:Calendar>
&nbsp;
        <br />
        <br />
        시작시간 :&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        종료시간 :&nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        상담내용 :
        <asp:TextBox ID="TextBox2" runat="server" Width="556px"></asp:TextBox>
        <br />
        <br />
        학생평가 :
        <asp:TextBox ID="TextBox3" runat="server" Width="553px"></asp:TextBox>
        <br />
        <br />
        결석유무 :<asp:RadioButton ID="출석" runat="server" OnCheckedChanged="RadioButton1_CheckedChanged" />
        <asp:RadioButton ID="결석" runat="server" />
        <br />
        <br />
    <asp:Button ID="저장하기" runat="server" Text="Button" Height="37px" OnClick="Button1_Click" Width="248px" />
        <br />
        <br />
    </div>
    </form>
</body>
</html>
