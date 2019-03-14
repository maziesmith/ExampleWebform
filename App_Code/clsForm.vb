Imports Microsoft.VisualBasic
Imports Oracle.ManagedDataAccess.Client
Imports System.Data
Imports System.Globalization

Public Class clsForm

    Function DanhSachGiupDo(P_START_ROW As Integer,
                            P_END_ROW As Integer
                            ) As DataTable

        Dim cond As String = "WHERE rn BETWEEN " & P_START_ROW & " AND " & P_END_ROW & " "

        'ket noi oracle
        Dim path As New clsConnect
        Dim myConn As New OracleConnection(path.pathOrclQuantri())

        Dim strQuery As String = "SELECT * FROM (SELECT m.*, rownum rn FROM vanban_dm_giup_do m) " & cond

        'command
        Dim cmd As New OracleCommand
        cmd.Connection = myConn
        cmd.Connection.Open()
        cmd.CommandText = strQuery
        cmd.CommandType = CommandType.Text
        Using reader As OracleDataReader = cmd.ExecuteReaderExtension()
            Dim dataTable As New DataTable
            dataTable.Load(reader)
            cmd.Connection.Close()
            myConn.Close()
            Return dataTable
        End Using
    End Function

    Function CountDanhSachGiupDo()

        'ket noi oracle
        Dim path As New clsConnect
        Dim myConn As New OracleConnection(path.pathOrclQuantri())

        Dim strQuery As String = "SELECT COUNT(*) FROM (SELECT m.*, rownum rn FROM vanban_dm_giup_do m) "


        'command
        Dim cmd As New OracleCommand
        cmd.Connection = myConn
        cmd.Connection.Open()
        cmd.CommandText = strQuery
        cmd.CommandType = CommandType.Text

        Dim reader As Integer

        cmd.Connection.Close()
        myConn.Close()


        If reader.IsNull Then
            Return 0
        Else
            Return reader.Value
        End If
    End Function

End Class
