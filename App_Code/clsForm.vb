Imports Microsoft.VisualBasic
Imports Oracle.ManagedDataAccess.Client
Imports System.Data
Imports System.Globalization

Public Class clsForm
    Public ten_giup_do As String
    Public duong_dan As String


    Function DanhSachGiupDo() As DataTable
        'ket noi oracle
        Dim path As New clsConnect
        Dim myConn As New OracleConnection(path.pathOrclQuantri())

        Dim strQuery As String = "SELECT * FROM vanban_dm_giup_do"

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


End Class
