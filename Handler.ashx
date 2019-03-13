<%@ WebHandler Language="VB" Class="Handler" %>

Imports System
Imports System.Web
Imports System.Web.Script.Serialization
Imports System.Data

Public Class Handler : Implements IHttpHandler
    
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        'Switch Case
        'Dim type As String = context.Request("tabletype")
        'Dim result As Object = Nothing
        'Select Case type
        '    Case "loadgiupdo"
        '        result = LoadGiupDo(context)
        'End Select
        
        
        
        'Return json
        Dim result As Object = Nothing
        result = LoadGiupDo(context)
        Dim serializer As New JavaScriptSerializer
        context.Response.ContentType = "application/json"
        context.Response.Write(serializer.Serialize(result))
    End Sub
 
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property
    
    
    Private Function LoadGiupDo(context As HttpContext) As Object
        Dim myForm As New clsForm
        Dim dts As DataTable = myForm.DanhSachGiupDo
        
        
        Dim start As Integer = 0
        Dim lstResult As New List(Of Object)
        
        
        'Create Object 
        For i As Integer = 0 To dts.Rows.Count - 1
            Dim dataRow As DataRow = dts.Rows(i)
            Dim tengiupdo As String = ""
            Dim duongdan As String
            Dim thaotac As String = ""
        
            If Not IsDBNull(dataRow.Item("TEN_GIUP_DO")) Then
                tengiupdo = dataRow.Item("TEN_GIUP_DO")
            End If
            duongdan = If(IsDBNull(dataRow.Item("DUONG_DAN")), "", dataRow.Item("DUONG_DAN"))
            
            lstResult.Add(New With {.stt = i + start + 1, .tengiupdo = tengiupdo, .duongdan = duongdan, .thaotac = thaotac})
        Next
        Return New With {.aaData = lstResult}
        
    End Function
    
End Class