Imports Microsoft.VisualBasic
Imports Oracle.ManagedDataAccess.Client
Imports System.Runtime.CompilerServices

Public Module Config

    <Extension()>
    Public Function ExecuteReaderExtension(ByVal command As OracleCommand) As OracleDataReader
        Dim reader As OracleDataReader
        Try
            reader = command.ExecuteReader()
        Catch ex As Exception
            command.Connection.Close()
            Throw ex
        End Try
        Return reader
    End Function
End Module
