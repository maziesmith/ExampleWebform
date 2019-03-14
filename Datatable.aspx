<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Datatable.aspx.vb" Inherits="Datatable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="Content/themes/base/jquery-ui.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">

        <form id="e" runat="server">
            <asp:Button class="btn" ID="Button1" runat="server" Text="Registration" PostBackUrl="~/RegistrationForm.aspx"/>
            <asp:Button class="btn" ID="Button2" runat="server" Text="Default" PostBackUrl="~/Default.aspx"/>
        </form>

        <div style="margin: 30px auto"> 
            <table id="myDatatable">
                <thead>
                    <tr>
                        <td>ID</td>
                        <td>Tên giúp đỡ</td>
                        <td>Đường dẫn</td>
                        <td>Thao tác</td>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>

    </div>

    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/jquery.validate.min.js"></script>
    <script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.min.js"></script>

    <script>
        var tableId = "myDatatable";
        var keySearchDetail = window.location.hostname + '_' + tableId + '_DetailDatabase';

        $(document).ready(function () {
            GetTableResult();
        })



        function GetTableResult() {
            //Bind table to DataTable
            tableDaChuyen = $("#myDatatable").dataTable({
                "bProcessing": true,
                "bStateSave": true,
                "bServerSide": true,
                "bSearchHighLight": true,
                "bFilter": true,
                "oLanguage": { "sProcessing": "Đang tìm kiếm..." },
                "sAjaxSource": "/Handler.ashx",
                "aoColumnDefs": [
                    { "mData": "stt", "aTargets": [0] },
                    { "sTitle": "Tên giúp đỡ", "mData": "tengiupdo", "aTargets": [1] },
                    { "sTitle": "Đường dẫn", "mData": "duongdan", "aTargets": [2] },
                    { "sTitle": "Thao tác", "mData": "thaotac", "aTargets": [3] },
                ],
            });
        }


    </script>
</body>
</html>
