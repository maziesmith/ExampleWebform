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
    <form id="form1" runat="server">
    <asp:Button ID="Button2" runat="server" Text="Default" PostBackUrl="~/Default.aspx"/>
    <asp:Button ID="Button1" runat="server" Text="Registration" PostBackUrl="~/RegistrationForm.aspx"/>
    

    <div style="width: 90%; margin: auto"> 
        <table id="myDatatable">
        </table>
    </div>
    </form>

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
            var oldStart = 0;
            //Bind table to DataTable
            tableDaChuyen = $("#myDatatable").dataTable({
                "sDom": "<<'inline-left'C><'inline-left'l><'inline-left'r><'inline-right'f>><t><ip>",
                "oColVis": { "buttonText": "<i class='fa fa-cog'></i>" },
                "bProcessing": true,
                "bStateSave": true,
                "bServerSide": true,
                "bSearchHighLight": true,
                "oLanguage": { "sProcessing": "Đang tìm kiếm..." },
                "sAjaxSource": "/Handler.ashx",
                "aoColumnDefs": [
                    { "sTitle": "#", "mData": "stt", "aTargets": [0] },
                    { "sTitle": "Tên giúp đỡ", "mData": "tengiupdo", "aTargets": [1] },
                    { "sTitle": "Đường dẫn", "mData": "duongdan", "aTargets": [2] },
                    { "sTitle": "Thao tác", "mData": "thaotac", "aTargets": [3] },
                ],
            });
        }


    </script>
</body>
</html>
