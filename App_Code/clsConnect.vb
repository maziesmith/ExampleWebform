Imports Microsoft.VisualBasic

Public Class clsConnect
    Public Function pathOrclQuantri() As String
        Dim str As String
        'str = ConfigurationManager.ConnectionStrings("pathOrclQuantri").ConnectionString
        str = "Data Source=VPDT;Persist Security Info=True;User ID=vpdt_laocai_ubndsapaqd28;Password=vnpt#K74"
        pathOrclQuantri = str
        Return str
    End Function

End Class
