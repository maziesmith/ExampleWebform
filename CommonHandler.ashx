<%@ WebHandler Language="VB" Class="CommonHandler" %>

Imports System
Imports System.Web
Imports System.Web.Script.Serialization
Imports System.Data

Public Class CommonHandler : Implements IHttpHandler
    Public Shared myVanBan As New clsForm
    
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        Dim typepost As String = context.Request("typepost")
        Select Case typepost
            Case "arrayShowByMon"
                Dim result As Object = arrayShowByMon(context)
                Dim serializer As New JavaScriptSerializer
                context.Response.ContentType = "application/json"
                context.Response.Write(serializer.Serialize(result))
            Case "arrayShow"
                Dim result As Object = arrayShow(context)
                Dim serializer As New JavaScriptSerializer
                context.Response.ContentType = "application/json"
                context.Response.Write(serializer.Serialize(result))
            Case "deletearray"
                Dim result As Object = deleteArray(context)
                Dim serializer As New JavaScriptSerializer
                context.Response.ContentType = "application/json"
                context.Response.Write(serializer.Serialize(result))
            Case "deleterow"
                Dim result As Object = deleteRow(context)
                Dim serializer As New JavaScriptSerializer
                context.Response.ContentType = "application/json"
                context.Response.Write(serializer.Serialize(result))
            Case "addnew"
                Dim result As Object = addNew(context)
                Dim serializer As New JavaScriptSerializer
                context.Response.ContentType = "application/json"
                context.Response.Write(serializer.Serialize(result))
            Case "update"
                Dim result As Object = update(context)
                Dim serializer As New JavaScriptSerializer
                context.Response.ContentType = "application/json"
                context.Response.Write(serializer.Serialize(result))
            Case "updateShow"
                Dim result As Object = updateShow(context)
                Dim serializer As New JavaScriptSerializer
                context.Response.ContentType = "application/json"
                context.Response.Write(serializer.Serialize(result))
        End Select
    End Sub
 
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

    Private Function deleteArray(context As HttpContext) As Object
        Dim resultObj As AjaxResult = New AjaxResult()
        context.Response.ContentType = "text/plain"
        Dim dataArray = context.Request("dataArray")
        Try
            myVanBan.DeleteArrayGiupDo(dataArray)
        Catch ex As Exception
            resultObj.message = ex.Message
            resultObj.status = 101
        End Try
        resultObj.status = 200
        Return resultObj
    End Function
    
    Private Function deleteRow(context As HttpContext) As Object
        Dim resultObj As AjaxResult = New AjaxResult()
        context.Response.ContentType = "text/plain"
        Dim dataId = context.Request("dataId")
        Try
            myVanBan.DeleteRowGiupDo(dataId)
        Catch ex As Exception
            resultObj.message = ex.Message
            resultObj.status = 101
        End Try
        resultObj.status = 200
        Return resultObj
    End Function
    
    Private Function addNew(ByVal context As HttpContext) As Object
        Dim resultObj As AjaxResult = New AjaxResult()
        context.Response.ContentType = "text/plain"
        Dim stt = context.Request("stt")
        Dim tengiupdo = context.Request("tengiupdo")
        Dim duongdan = context.Request("duongdan")
        Try
            myVanBan.CreateRowGiupDo(stt, tengiupdo, duongdan)
        Catch ex As Exception
            resultObj.message = ex.Message
            resultObj.status = 101
        End Try
        resultObj.status = 200
        Return resultObj
    End Function
    
    Private Function update(ByVal context As HttpContext) As Object
        Dim resultObj As AjaxResult = New AjaxResult()
        context.Response.ContentType = "text/plain"
        Dim stt = context.Request("stt")
        Dim tengiupdo = context.Request("tengiupdo")
        Dim duongdan = context.Request("duongdan")
        Try
            myVanBan.UpdateRowGiupDo(stt, tengiupdo, duongdan)
            resultObj.status = 200
        Catch ex As Exception
            resultObj.message = ex.Message
            resultObj.status = 101
        End Try
        Return resultObj
    End Function
    
    Private Function updateShow(ByVal context As HttpContext) As Object
        Dim resultObj As AjaxResult = New AjaxResult()
        context.Response.ContentType = "text/plain"
        Dim stt = context.Request("dataId")
        Dim dtsInfoBySTT = myVanBan.getInfoBySTT(stt)
        Try
            resultObj.result = New clsForm()

            resultObj.result.stt = dtsInfoBySTT.Rows(0).Item("STT")
            resultObj.result.tengiupdo = dtsInfoBySTT.Rows(0).Item("TEN_GIUP_DO")
            resultObj.result.duongdan = dtsInfoBySTT.Rows(0).Item("DUONG_DAN")
            resultObj.status = 200
        Catch ex As Exception
            resultObj.message = ex.Message
            resultObj.status = 101
        End Try
        Return resultObj

    End Function

    Private Function arrayShow(ByVal context As HttpContext) As Object
        
        Dim dts = myVanBan.getTenFirstField()
        Dim lstResult As New List(Of Object)
        Dim count As String = dts.Rows.Count
        
        For i As Integer = 0 To dts.Rows.Count - 1
            Dim dataRow As DataRow = dts.Rows(i)
            Dim tengiupdo As String = ""
            Dim duongdan As String = ""
            Dim stt As String = ""
            
            
            If Not IsDBNull(dataRow.Item("TEN_GIUP_DO")) Then
                tengiupdo = dataRow.Item("TEN_GIUP_DO")
            End If
            duongdan = If(IsDBNull(dataRow.Item("DUONG_DAN")), "", dataRow.Item("DUONG_DAN"))
            stt = If(IsDBNull(dataRow.Item("STT")), "", dataRow.Item("STT"))
            
            lstResult.Add(New With {.tengiupdo = tengiupdo, .duongdan = duongdan, .stt = stt, .count = count})
        Next
        
        Return New With {.aaData = lstResult}
        
    End Function
    
    
    Private Function arrayShowByMon(ByVal context As HttpContext) As Object
        
        Dim dts = myVanBan.getDBByMon()
        Dim lstResult As New List(Of Object)
        Dim count As String = dts.Rows.Count
        
        For i As Integer = 0 To dts.Rows.Count - 1
            Dim dataRow As DataRow = dts.Rows(i)
            Dim countt As String = ""
            Dim month As String = ""
            

            countt = If(IsDBNull(dataRow.Item("COUNT")), "", dataRow.Item("COUNT"))
            month = If(IsDBNull(dataRow.Item("MONTH")), "", dataRow.Item("MONTH"))
            
            lstResult.Add(New With {.countt = countt, .month = month, .count = count})
        Next
        
        Return New With {.aaData = lstResult}
        
    End Function
End Class