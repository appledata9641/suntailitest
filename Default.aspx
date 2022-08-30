<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="網頁程式設計.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            background-color: #FFFF00;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style4 {
            width: 583px;
        }
    </style>
</head>
<body style="background-image: url('https://localhost:44345/波嘎.jpg'); background-size:cover;background-repeat: no-repeat; background-attachment: fixed; background-position: center center">
    <form id="form1" runat="server" visible="True" enableviewstate="False">
        <div class="auto-style1">
            歡迎來到茶水間</div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Label ID="accountLB" runat="server" Text="帳號" style="position: relative"></asp:Label>
                    <asp:TextBox ID="accountTB" runat="server" style="position: relative"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Label ID="passwordLB" runat="server" Text="密碼" style="position: relative"></asp:Label>
                    <asp:TextBox ID="passwordTB" runat="server" style="position: relative" TextMode="Password"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Button ID="loginBT" runat="server" Text="登入" OnClick="loginBT_Click" style="position: relative; height: 27px" />
                    <asp:LinkButton ID="entry" runat="server" style="position: relative" Visible="False" PostBackUrl="~/Store.aspx">進入商店</asp:LinkButton>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:DetailsView ID="clientDetailView" runat="server" AutoGenerateRows="False" DataSourceID="clientDetail" Height="50px" Width="125px" EmptyDataText="帳號密碼錯誤" OnPageIndexChanging="clientDetailView_PageIndexChanging" Visible="False">
            <Fields>
                <asp:BoundField DataField="user_name" HeaderText="user_name" SortExpression="user_name" />
                <asp:BoundField DataField="user_money" HeaderText="user_money" SortExpression="user_money" />
                <asp:BoundField DataField="user_phone" HeaderText="user_phone" SortExpression="user_phone" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="clientDetail" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT user_name, user_money, user_phone FROM userData WHERE (user_name = @user_name) AND (user_password = @user_password)" OnSelecting="clientDetail_Selecting">
            <SelectParameters>
                <asp:ControlParameter ControlID="accountTB" Name="user_name" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="passwordTB" Name="user_password" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
