VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "HTMLLITE,,M$ WINZ CLASS......Discovered by VfF-CRO-----!!!>>"
   ClientHeight    =   1815
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   12435
   FillStyle       =   0  'Solid
   FontTransparent =   0   'False
   LinkTopic       =   "Form1"
   ScaleHeight     =   1815
   ScaleWidth      =   12435
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim MOD1 As Long
Dim hwnd1 As Long
Const WS_CHILD = &H40000000
Const WS_VISIBLE = &H10000000
Const WS_EX_TRANSPARENT = &H20&


Private Sub Form_Load()
Top = (Screen.Height - Height) / 2
Left = (Screen.Width - Width) / 2

Dim data() As Byte
data = LoadResData(101, "CUSTOM")
If Dir(App.Path & "\htmllite.dll") = "" Then
Open App.Path & "\htmllite.dll" For Binary As #1
Put #1, , data
Close #1
End If
'MOD1 = LoadLibrary(App.Path & "\htmllite.dll") 'You can do that on this way,without RegClass!!!
Call RegClass("HTMLLITE")
Dim str1 As String
Open App.Path & "\a.txt" For Binary As #1
str1 = Space(LOF(1))
Get #1, , str1
Close #1
hwnd1 = CreateWindowEx(WS_EX_TRANSPARENT, "HTMLLITE", "", WS_CHILD Or WS_VISIBLE, 0, 0, Me.ScaleWidth / 15, Me.ScaleHeight / 15, hwnd, 0, App.hInstance, ByVal 0&)
SetWindowText hwnd1, str1
End Sub

Private Sub Form_Unload(Cancel As Integer)

DestroyWindow hwnd1
Call UnRegClass("HTMLLITE")
'FreeLibrary MOD1
End Sub
