<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 150px;
        }
    </style>
</head>
<body style="width: 702px">
    <h3>GIÚP ĐỠ</h3>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Search ID" Height="24px" Width="106px" />
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Width="164px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <h3>Show data</h3>
            <table style="width: 100%;" border="1">
                <tr>
                    <td>STT</td>
                    <td>Tên giúp đỡ</td>
                    <td>Đường dẫn</td>
                    <td>Thao tác</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <div>
            <h3>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
                    <Columns>
                        <asp:BoundField DataField="STT" HeaderText="STT" SortExpression="STT" />
                        <asp:BoundField DataField="TEN_GIUP_DO" HeaderText="TEN_GIUP_DO" SortExpression="TEN_GIUP_DO" />
                        <asp:BoundField DataField="DUONG_DAN" HeaderText="DUONG_DAN" SortExpression="DUONG_DAN" />
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;VANBAN_DM_GIUP_DO&quot;"></asp:SqlDataSource>
                Form thêm</h3>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">Tên giúp đỡ</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="191px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Đường dẫn</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Width="191px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Button ID="Button2" runat="server" Text="Add" Width="94px" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
