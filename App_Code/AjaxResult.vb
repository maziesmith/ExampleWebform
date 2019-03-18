Imports Microsoft.VisualBasic

Public Class AjaxResult
    Public Property status As String = 200
    Public Property message As String
    Public Property result As Object
    Public Property extensionobj As Object
    Sub SetNewErr(ByVal _status As Integer, ByVal _message As String)
        status = _status
        message = _message
    End Sub
End Class
Public Class ResponseResult
    Public Property status As String = 1
    Public Property message As String
    Public Property value As Object
    Sub SetNewErr(ByVal _status As Integer, ByVal _message As String)
        status = _status
        message = _message
    End Sub
End Class

