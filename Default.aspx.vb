Imports System.Data
Imports Oracle.ManagedDataAccess.Client
Imports Oracle.ManagedDataAccess.Types
Partial Class _Default
    Inherits System.Web.UI.Page
    'Dim path = ConfigurationManager.ConnectionStrings("pathOrclQuantri").ConnectionString
    Dim path = "Data Source=VPDT;Persist Security Info=True;User ID=vpdt_laocai_ubndsapaqd28;Password=vnpt#K74"
    Dim conn As New OracleConnection(path)

    Dim parm As New OracleParameter
    Dim cmd As New OracleCommand

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        conn.Open()

        parm.OracleDbType = OracleDbType.Decimal
        parm.Value = TextBox3.Text()

        'Select data
        cmd.Connection = conn
        cmd.Parameters.Add(parm)
        cmd.CommandText = "select ten_giup_do from vanban_dm_giup_do where stt = :1"
        cmd.CommandType = CommandType.Text

        'Render the data
        If parm.Value <> "" Then
            Dim dr As OracleDataReader = cmd.ExecuteReader()
            If dr.Read() Then
                Label1.Text = dr.Item("ten_giup_do")
            Else
                Label1.Text = "Id not found"
            End If
        Else
            Label1.Text = "Please insert id"
        End If

        conn.Close()
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        conn.Open()

        cmd.Connection = conn
        cmd.CommandText = "insert into vanban_dm_giup_do (ten_giup_do, duong_dan) values ('" & TextBox1.Text & "','" & TextBox2.Text & "')"
        cmd.ExecuteNonQuery()
        Response.Write("data inserted")

        conn.Close()
    End Sub
End Class
