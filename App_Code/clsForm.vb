Imports Microsoft.VisualBasic
Imports Oracle.ManagedDataAccess.Client
Imports System.Data
Imports System.Globalization

Public Class clsForm
    Public Property stt As String
    Public Property tengiupdo As String
    Public Property duongdan As String
    Function DanhSachGiupDo(P_START_ROW As Integer, P_END_ROW As Integer,
                            P_SORT_COLUMN As String, P_SORT_DIRECTION As String, strFilter As String
                            ) As DataTable

        Dim strRange As String = "WHERE rn BETWEEN " & P_START_ROW & " AND " & P_END_ROW & " "
        Dim strOrderClause As String = CreateOrderClauseForXemDen(P_SORT_COLUMN, P_SORT_DIRECTION)
        Dim strWhereClause As String = CreateWhereClauseForXemDen(strFilter)

        'ket noi oracle
        Dim path As New clsConnect
        Dim myConn As New OracleConnection(path.pathOrclQuantri())

        Dim strQuery As String = "SELECT * FROM (SELECT m.*, rownum rn FROM vanban_dm_giup_do m " & strWhereClause & ") " & strRange & strOrderClause

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

    Function CountDanhSachGiupDo(strFilter As String) As Integer

        'ket noi oracle
        Dim path As New clsConnect
        Dim myConn As New OracleConnection(path.pathOrclQuantri())

        Dim strQuery As String = "SELECT COUNT(*) FROM vanban_dm_giup_do "


        'command
        Dim cmd As New OracleCommand
        cmd.Connection = myConn
        cmd.Connection.Open()
        cmd.CommandText = strQuery

        Dim reader As OracleDataReader = cmd.ExecuteReader()
        Dim rowcount As Integer = 0
        If reader.Read() Then
            rowcount = reader.GetInt32(0)
        End If

        cmd.Connection.Close()
        myConn.Close()

        Return rowcount
    End Function

    Sub DeleteRowGiupDo(dataId As Integer)
        'ket noi oracle
        Dim path As New clsConnect
        Dim myConn As New OracleConnection(path.pathOrclQuantri())

        Dim strQuery As String = "DELETE FROM vanban_dm_giup_do  WHERE STT = '" & dataId & "'"


        'command
        Dim cmd As New OracleCommand
        cmd.Connection = myConn
        cmd.CommandText = strQuery
        cmd.CommandType = CommandType.Text

        cmd.Connection.Open()
        cmd.ExecuteNonQuery()
        cmd.Connection.Close()
        myConn.Close()

    End Sub

    Sub CreateRowGiupDo(stt As Integer, tengiupdo As String, huongdan As String)
        'ket noi oracle
        Dim path As New clsConnect
        Dim myConn As New OracleConnection(path.pathOrclQuantri())

        Dim strQuery As String = "INSERT INTO vanban_dm_giup_do (STT, TEN_GIUP_DO, DUONG_DAN) VALUES ('" & stt & "', '" & tengiupdo & "', '" & huongdan & "') "


        'command
        Dim cmd As New OracleCommand
        cmd.Connection = myConn
        cmd.CommandText = strQuery
        cmd.CommandType = CommandType.Text

        cmd.Connection.Open()
        cmd.ExecuteNonQuery()
        cmd.Connection.Close()
        myConn.Close()
    End Sub

    Public Function getInfoBySTT(stt As Integer) As DataTable

        'ket noi oracle
        Dim path As New clsConnect
        Dim myConn As New OracleConnection(path.pathOrclQuantri())

        Dim strQuery As String = "SELECT * FROM vanban_dm_giup_do WHERE STT='" & stt & "' "

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

    Sub UpdateRowGiupDo(stt As Integer, tengiupdo As String, huongdan As String)
        'ket noi oracle
        Dim path As New clsConnect
        Dim myConn As New OracleConnection(path.pathOrclQuantri())

        Dim strQuery As String = "UPDATE vanban_dm_giup_do SET TEN_GIUP_DO = '" & tengiupdo & "', DUONG_DAN = '" & huongdan & "' WHERE STT='" & stt & "' "

        'command
        Dim cmd As New OracleCommand
        cmd.Connection = myConn
        cmd.CommandText = strQuery
        cmd.CommandType = CommandType.Text

        cmd.Connection.Open()
        cmd.ExecuteNonQuery()
        cmd.Connection.Close()
        myConn.Close()
    End Sub

    Private Function CreateOrderClauseForXemDen(P_SORT_COLUMN As String, P_SORT_DIRECTION As String) As String
        Dim strOrderClause As String = " ORDER BY "
        Select Case P_SORT_COLUMN
            Case "stt"
                strOrderClause += " TEN_GIUP_DO " & P_SORT_DIRECTION
            Case "tengiupdo"
                strOrderClause += " TEN_GIUP_DO " & P_SORT_DIRECTION
            Case "duongdan"
                strOrderClause += " DUONG_DAN " & P_SORT_DIRECTION
            Case Else
                strOrderClause = " "
        End Select
        Return strOrderClause
    End Function

    Private Function CreateWhereClauseForXemDen(strFilter As String) As String
        Dim builder As New StringBuilder()

        If Not String.IsNullOrEmpty(strFilter) Then
            strFilter = LTrim(RTrim(strFilter))
            builder.Append(" WHERE UPPER(TEN_GIUP_DO)  like UPPER('%" & strFilter & "%') ")
        End If

        Return builder.ToString()
    End Function
End Class
