<%@ WebHandler Language="VB" Class="Handler" %>

Imports System
Imports System.Web
Imports System.Web.Script.Serialization
Imports System.Data

Public Class Handler : Implements IHttpHandler
    
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
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
        Dim lstResult As New List(Of Object)
        Dim length As Integer = Integer.Parse(context.Request("iDisplayLength"))
        Dim start As Integer = Integer.Parse(context.Request("idisplaystart"))
        Dim count As Integer
        Dim strFilter As String = context.Request("sSearch")
        Dim sortColumn As String
        Dim sortDirection As String

        
        Try
            sortColumn = context.Request("mDataProp_" & Integer.Parse(context.Request("iSortCol_0")))
            sortDirection = context.Request("sSortDir_0")
        Catch ex As Exception
            sortColumn = 0
            sortDirection = " DESC"
        End Try
        
       
        
        
        'Load database by class
        Dim myForm As New clsForm
        start = start + 1
        Dim dts As DataTable = myForm.DanhSachGiupDo(start, start + length - 1, sortColumn, sortDirection, strFilter)
        count = myForm.CountDanhSachGiupDo(strFilter)

        
        'Create Object 
        For i As Integer = 0 To dts.Rows.Count - 1
            Dim dataRow As DataRow = dts.Rows(i)
            Dim tengiupdo As String = ""
            Dim duongdan As String = ""
            Dim thaotac As String = ""
            Dim chon As String
            Dim maxoa As String
            
            maxoa = dataRow.Item("STT")
            chon = "<input type='checkbox' class='minimal' name='cidxemden[]' value='" & maxoa & "'/>"
            thaotac = "<button class='btn btn-danger btn-sm delete' id='" & maxoa & "'>Xóa</button><button style='margin-left: 10px' class='btn btn-warning btn-sm update' id='" & maxoa & "'>Sửa</button>"
            
            If Not IsDBNull(dataRow.Item("TEN_GIUP_DO")) Then
                tengiupdo = dataRow.Item("TEN_GIUP_DO")
            End If
            duongdan = If(IsDBNull(dataRow.Item("DUONG_DAN")), "", dataRow.Item("DUONG_DAN"))
            
            lstResult.Add(New With {.stt = i + start, .tengiupdo = tengiupdo, .duongdan = duongdan, .thaotac = thaotac, .chon = chon})
        Next
        Return New With {.iTotalRecords = count, .iTotalDisplayRecords = count, .aaData = lstResult}
        
    End Function
    
End Class