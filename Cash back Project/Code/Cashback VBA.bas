Attribute VB_Name = "Module1"
Option Explicit

Sub AllStep()
    Step1
    Step2
    Step3
End Sub

Sub Step1()
    'Tat che do cap nhat cong thuc
    Application.Calculation = xlCalculationManual
    'Tat che do cap nhat man hinh
    Application.ScreenUpdating = False
    SQL_Check1
    Check1
    'Bat che do cap nhat cong thuc
    Application.Calculation = xlCalculationAutomatic
    'Bat che do cap nhat man hinh
    Application.ScreenUpdating = True
End Sub

Sub Step2()
    'Tat che do cap nhat cong thuc
    Application.Calculation = xlCalculationManual
    'Tat che do cap nhat man hinh
    Application.ScreenUpdating = False
    SQL_Check2
    Check2
    'Bat che do cap nhat cong thuc
    Application.Calculation = xlCalculationAutomatic
    'Bat che do cap nhat man hinh
    Application.ScreenUpdating = True
End Sub

Sub Step3()
    'Tat che do cap nhat cong thuc
    Application.Calculation = xlCalculationManual
    'Tat che do cap nhat man hinh
    Application.ScreenUpdating = False
    If Len(Sheets("Note").Range("D22").Value) <> 0 Then
        Sheets("Report").Range("A2").Value = "VCC Report for the date of " & Sheets("Note").Range("B22").Value & " " & Sheets("Note").Range("C23").Value & " " & Sheets("Note").Range("B24").Value
    Else
        Sheets("Report").Range("A2").Value = "VCC Report for the month " & Sheets("Note").Range("C23").Value & " " & Sheets("Note").Range("B24").Value
    End If
    Check3
    SQL_Report
    'Bat che do cap nhat cong thuc
    Application.Calculation = xlCalculationAutomatic
    'Bat che do cap nhat man hinh
    Application.ScreenUpdating = True
End Sub

Sub SQL_Check1()
    On Error Resume Next
    'Dat ben bien cho tên sheet báo cáo
    Dim rname As String
    rname = "Check1"
    'Dat bien cho vung ket qua bao cao
    Dim vname As String
    vname = "A2:J" & Rows.Count
    ' Dat ten bien Sheet du lieu
    Dim sname As String
    sname = "DATA"
    
    'Dat bien cho sheets bao cao
    Dim shr As Worksheet
    Set shr = ThisWorkbook.Sheets(rname)
    'Xoa so lieu va format cu cua bao cao
    shr.Range(vname).ClearContents
    shr.Range(vname).ClearFormats
    
    ' Khai báo connnectionstring cho file excel dang .xlsx, .xlsm, .xlsb
    Dim cnnstr As String
    cnnstr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & ThisWorkbook.FullName & ";Extended Properties=""Excel 12.0 Xml;HDR=YES;"";"
        
    'Tao Connecttion va recordset trong ADO
    Dim conn As Object
    Set conn = CreateObject("ADODB.Connection")
    conn.Open cnnstr

    Dim rst As Object
    Set rst = CreateObject("ADODB.Recordset")

    ' Viet lenh SQL vào ô A2 cua sheet bao cao
    Dim qry As String
    qry = Sheets("Note").Range("A13").Value
    Set rst = conn.Execute(qry)
    
    'Tra ket qua bao cao
    Dim d As Long, c As Long
    d = shr.Range(vname).Cells(1, 1).CopyFromRecordset(rst) 'So dong tra ve
    c = rst.Fields.Count 'So cot tra ve
    
    
    ' Ðóng recordset và connection
    rst.Close
    conn.Close
    On Error GoTo 0
End Sub
    
Sub Check1()
    'Dat bien cho sheets bao cao
    Dim shc1 As Worksheet
    Set shc1 = ThisWorkbook.Sheets("Check1")
    'Dat bien cho sheets bao cao
    Dim shs As Worksheet
    Set shs = ThisWorkbook.Sheets("Settle")
    'Dong cuoi Check1 va Settle
    Dim lastrowc1 As Long, lastrows As Long
    
    lastrowc1 = shc1.Range("A" & Rows.Count).End(xlUp).Row
    lastrows = shs.Range("A" & Rows.Count).End(xlUp).Row
    
    Dim i As Long
        For i = 2 To lastrowc1
        shc1.Range("I" & i).FormulaR1C1 = _
            "=SUMIFS(Settle!R2C13:R" & lastrows & "C13,Settle!R2C2:R" & lastrows & "C2,""*""&RIGHT(Check1!RC[-8],13))"
        shc1.Range("J" & i).FormulaR1C1 = _
            "=AVERAGEIFS(Settle!R2C13:R" & lastrows & "C13,Settle!R2C2:R" & lastrows & "C2,""*""&RIGHT(Check1!RC[-9],13))"
        shc1.Range("H" & i).Formula = "=AND(I" & i & "=D" & i & ",E" & i & "=J" & i & ")"
    Next
    
    'Tao dong tinh tong
    shc1.Range("D" & lastrowc1 + 1).Formula = "=Sum(D2:D" & lastrowc1 & ")"
    shc1.Range("I" & lastrowc1 + 1).Formula = "=Sum(I2:I" & lastrowc1 & ")"
    shc1.Range("H" & lastrowc1 + 1).Formula = "=I" & lastrowc1 + 1 & "=D" & lastrowc1 + 1
    
    'Dinh dang
    shc1.Range("D2:E" & lastrowc1 + 1).NumberFormat = "#,##0.00"
    shc1.Range("I2:J" & lastrowc1 + 1).NumberFormat = "#,##0.00"
    'Check so tong Settle
    'Dim TongS_PayAmt As Boolean
    'If Application.WorksheetFunction.Round(Application.WorksheetFunction.Sum(shs.Range("M2:M" & lastrows)), 2) = Application.WorksheetFunction.Round(shs.Range("D" & lastrowc1 + 1), 2) Then
        'shc1.Range("L1") = True
    'Else
        'shc1.Range("L1") = False
    'End If
End Sub


Sub SQL_Check2()
    On Error Resume Next
    'Dat ben bien cho tên sheet báo cáo
    Dim rname As String
    rname = "Check2"
    'Dat bien cho vung ket qua bao cao
    Dim vname As String
    vname = "A2:J" & Rows.Count
    ' Dat ten bien Sheet du lieu
    Dim sname As String
    sname = "DATA"
    
    'Dat bien cho sheets bao cao
    Dim shr As Worksheet
    Set shr = ThisWorkbook.Sheets(rname)
    'Xoa so lieu va format cu cua bao cao
    shr.Range(vname).ClearContents
    shr.Range(vname).ClearFormats
    
    ' Khai báo connnectionstring cho file excel dang .xlsx, .xlsm, .xlsb
    Dim cnnstr As String
    cnnstr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & ThisWorkbook.FullName & ";Extended Properties=""Excel 12.0 Xml;HDR=YES;"";"
        
    'Tao Connecttion va recordset trong ADO
    Dim conn As Object
    Set conn = CreateObject("ADODB.Connection")
    conn.Open cnnstr

    Dim rst As Object
    Set rst = CreateObject("ADODB.Recordset")

    ' Viet lenh SQL vào ô A2 cua sheet bao cao
    Dim qry As String
    qry = Sheets("Note").Range("A16").Value
    Set rst = conn.Execute(qry)
    
    'Tra ket qua bao cao
    Dim d As Long, c As Long
    d = shr.Range(vname).Cells(1, 1).CopyFromRecordset(rst) 'So dong tra ve
    c = rst.Fields.Count 'So cot tra ve
    
    ' Ke border cho vung ket qua
    
    ' Ðóng recordset và connection
    rst.Close
    conn.Close
    On Error GoTo 0
End Sub

Sub Check2()
    'Dat bien cho sheets bao cao
    Dim shc2 As Worksheet
    Set shc2 = ThisWorkbook.Sheets("Check2")
    'Dat bien cho sheets bao cao
    Dim ShA As Worksheet
    Set ShA = ThisWorkbook.Sheets("Auth")
    'Dong cuoi Check1 va Auth
    Dim lastrowc2 As Long, lastrowa As Long
    
    lastrowc2 = shc2.Range("A" & Rows.Count).End(xlUp).Row
    lastrowa = ShA.Range("B" & Rows.Count).End(xlUp).Row
    
    Dim i As Long
        For i = 2 To lastrowc2
        shc2.Range("I" & i).FormulaR1C1 = _
            "=COUNTIFS(Auth!R2C9:R" & lastrowa & "C9,""DECLINED"",Auth!R2C3:R" & lastrowa & "C3,""*""&RIGHT(Check2!RC[-8],13))/COUNTIFS(Auth!R2C3:R" & lastrowa & "C3,""*""&RIGHT(Check2!RC[-8],13))"
        
        shc2.Range("H" & i).Formula = "=I" & i & "=E" & i
    Next
    
    'Dinh dang
    shc2.Range("C2:D" & lastrowc2).NumberFormat = "#,##0"
    shc2.Range("E2:E" & lastrowc2).NumberFormat = "0.00%"
    shc2.Range("I2:I" & lastrowc2).NumberFormat = "0.00%"

End Sub

Sub Check3()
    Application.DecimalSeparator = ","
    Dim i As Long, j As Long
    Dim lastrowc1 As Long, lastrowc2 As Long, lastrowc3 As Long, lastrown As Long
    Dim numc As Long
    
    Dim shc1 As Worksheet, shc2 As Worksheet, shc3 As Worksheet, ShN As Worksheet
    Set shc1 = Sheets("Check1")
    Set shc2 = Sheets("Check2")
    Set shc3 = Sheets("Check3")
    Set ShN = Sheets("Note")
    
    'Xoa so lieu va format cu cua bao cao
    shc3.Range("A2:W" & Rows.Count).ClearContents
    shc3.Range("A2:I" & Rows.Count).ClearFormats
    'Dong cuoi Check1
    lastrowc1 = shc1.Range("A" & Rows.Count).End(xlUp).Row
    lastrowc2 = shc2.Range("A" & Rows.Count).End(xlUp).Row
    
    lastrown = ShN.Range("A37").End(xlDown).Row
    'Copy du lieu Check1 sang Check3
    shc1.Range("A2:E" & lastrowc1).Copy Destination:=shc3.Range("A2")
    lastrowc3 = shc3.Range("A" & Rows.Count).End(xlUp).Row
    'Copy Declined rate
    Dim kq
    For i = 2 To lastrowc3
        kq = Application.VLookup(shc3.Range("A" & i).Value, shc2.Range("A2:E" & lastrowc2), 5, False)
        If TypeName(kq) = "Error" Then
            shc3.Range("F" & i) = 0
            
        Else
            shc3.Range("F" & i) = kq
        End If

    Next
    'Check ket qua
    'shc3.Range("J2:P" & lastrowc3).NumberFormat = "@"
    For i = 2 To lastrowc3
        If shc3.Range("F" & i) < ShN.Range("C30").Value And shc3.Range("E" & i) > ShN.Range("C31").Value And shc3.Range("D" & i) >= ShN.Range("C32") Then
            shc3.Range("G" & i).Value = True
            For j = lastrown To 37 Step -1
                If shc3.Range("D" & i) > ShN.Range("A" & j).Value Then
                    numc = j
                    Exit For
                End If
            Next
            If numc = lastrown Then
                shc3.Range("I" & i).Value = Format(ShN.Range("C" & numc).Value, "#,##0.00%")
                shc3.Range("N" & i).Value = Format(ShN.Range("C" & numc).Value, "#,##0.00%")
                shc3.Range("O" & i).Value = Format(ShN.Range("C" & numc).Value, "#,##0.00%")
                shc3.Range("P" & i).Value = Format(Round(0, 2), "#,##0.00")
            Else
                shc3.Range("I" & i).Value = Format(ShN.Range("C" & numc).Value, "#,##0.00%")
                shc3.Range("N" & i).Value = Format(ShN.Range("C" & numc).Value, "#,##0.00%")
                shc3.Range("O" & i).Value = Format(ShN.Range("C" & numc + 1).Value, "#,##0.00%")
                shc3.Range("P" & i).Value = Format(Round(ShN.Range("A" & numc + 1).Value - shc3.Range("D" & i), 2), "#,##0.00")
            End If
            shc3.Range("H" & i).Value = Application.WorksheetFunction.Round(ShN.Range("C" & numc).Value * shc3.Range("D" & i).Value, 2)
        Else
            shc3.Range("G" & i).Value = False
            shc3.Range("H" & i).Value = 0
            For j = lastrown To 37 Step -1
                If shc3.Range("D" & i) > ShN.Range("A" & j).Value Then
                    numc = j
                    Exit For
                End If
            Next
            If numc = lastrown Then
                shc3.Range("I" & i).Value = Format(0, "#,##0.00%")
                shc3.Range("N" & i).Value = Format(ShN.Range("C" & numc).Value, "#,##0.00%")
                shc3.Range("O" & i).Value = Format(ShN.Range("C" & numc).Value, "#,##0.00%")
                shc3.Range("P" & i).Value = Format(Round(0, 2), "#,##0.00")
            Else
                shc3.Range("I" & i).Value = Format(0, "#,##0.00%")
                shc3.Range("N" & i).Value = Format(ShN.Range("C" & numc).Value, "#,##0.00%")
                shc3.Range("O" & i).Value = Format(ShN.Range("C" & numc + 1).Value, "#,##0.00%")
                shc3.Range("P" & i).Value = Format(Round(ShN.Range("A" & numc + 1).Value - shc3.Range("D" & i), 2), "#,#00.00")
            End If
        End If
    shc3.Range("J" & i).Value = Format(Round(shc3.Range("D" & i).Value, 2), "#,##0.00")
    shc3.Range("K" & i).Value = Format(Round(shc3.Range("E" & i).Value, 2), "#,##0.00")
    shc3.Range("L" & i).Value = Format(Round(shc3.Range("F" & i).Value, 4), "#,##0.00%")
    shc3.Range("M" & i).Value = Format(Round(shc3.Range("H" & i).Value, 2), "#,##0.00")

    Next
    
    For i = 2 To lastrowc3
        shc3.Range("Q" & i).Formula = "=Text(J" & i & ",""#.##0,00"")"
        shc3.Range("Q" & i).Value = shc3.Range("Q" & i).Value
        shc3.Range("R" & i).Formula = "=Text(K" & i & ",""#.##0,00"")"
        shc3.Range("R" & i).Value = shc3.Range("R" & i).Value
        shc3.Range("S" & i).Formula = "=Text(L" & i & ",""#.##0,00%"")"
        shc3.Range("S" & i).Value = shc3.Range("S" & i).Value
        shc3.Range("T" & i).Formula = "=Text(M" & i & ",""#.##0,00"")"
        shc3.Range("T" & i).Value = shc3.Range("T" & i).Value
        shc3.Range("U" & i).Formula = "=Text(I" & i & ",""#.##0,00%"")"
        shc3.Range("U" & i).Value = shc3.Range("U" & i).Value
        shc3.Range("V" & i).Formula = "=Text(O" & i & ",""#.##0,00%"")"
        shc3.Range("V" & i).Value = shc3.Range("V" & i).Value
        shc3.Range("W" & i).Formula = "=Text(P" & i & ",""#.##0,00"")"
        shc3.Range("W" & i).Value = shc3.Range("W" & i).Value
    Next
    'Format hien thi
    shc3.Range("D2:D" & lastrowc3).NumberFormat = "#,##0.00"
    shc3.Range("E2:E" & lastrowc3).NumberFormat = "#,##0.00"
    shc3.Range("F2:F" & lastrowc3).NumberFormat = "0.00%"
    shc3.Range("H2:H" & lastrowc3).NumberFormat = "#,##0.00"
    shc3.Range("N2:N" & lastrowc3).NumberFormat = "0.00%"
End Sub

Sub SQL_Report()
    On Error Resume Next
    'Dat ben bien cho tên sheet báo cáo
    Dim rname As String
    rname = "Report"
    'Dat bien cho vung ket qua bao cao
    Dim vname As String
    vname = "B5:I" & Rows.Count
    ' Dat ten bien Sheet du lieu
    Dim sname As String
    sname = "DATA"
    
    'Dat bien cho sheets bao cao
    Dim shr As Worksheet
    Set shr = ThisWorkbook.Sheets(rname)
    'Xoa so lieu va format cu cua bao cao
    shr.Range("A5:I" & Rows.Count).ClearContents
    shr.Range("A5:I" & Rows.Count).ClearFormats
    
    ' Khai báo connnectionstring cho file excel dang .xlsx, .xlsm, .xlsb
    Dim cnnstr As String
    cnnstr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & ThisWorkbook.FullName & ";Extended Properties=""Excel 12.0 Xml;HDR=YES;"";"
        
    'Tao Connecttion va recordset trong ADO
    Dim conn As Object
    Set conn = CreateObject("ADODB.Connection")
    conn.Open cnnstr

    Dim rst As Object
    Set rst = CreateObject("ADODB.Recordset")

    ' Viet lenh SQL vào ô A2 cua sheet bao cao
    Dim qry As String
    qry = Sheets("Note").Range("A19").Value
    Set rst = conn.Execute(qry)
    
    'Tra ket qua bao cao
    Dim d As Long, c As Long
    d = shr.Range(vname).Cells(1, 1).CopyFromRecordset(rst) 'So dong tra ve
    c = rst.Fields.Count 'So cot tra ve
    
    'Dat bien tim dong cuoi cung
    Dim lastrow As Long
    lastrow = shr.Range("B" & Rows.Count).End(xlUp).Row
    'Dat bien cho vung ket qua
    Dim rng As Range
    Set rng = shr.Range("A4:I" & lastrow + 1)
    
    rng.Borders(xlEdgeLeft).LineStyle = xlContinuous
    rng.Borders(xlEdgeTop).LineStyle = xlContinuous
    rng.Borders(xlEdgeBottom).LineStyle = xlContinuous
    rng.Borders(xlEdgeRight).LineStyle = xlContinuous
    rng.Borders(xlInsideVertical).LineStyle = xlContinuous
    rng.Borders(xlInsideHorizontal).LineStyle = xlContinuous
    'Tao dong tinh tong
    shr.Range("E" & lastrow + 1) = Application.WorksheetFunction.Sum(shr.Range("E5:E" & lastrow))
    shr.Range("H" & lastrow + 1) = Application.WorksheetFunction.Sum(shr.Range("H5:H" & lastrow))
    'Them dong tong cong
    shr.Range("A" & lastrow + 1).Value = "Total"
    'Fomat dong Tong cong
    shr.Range("A" & lastrow + 1 & ":D" & lastrow + 1).HorizontalAlignment = xlCenterAcrossSelection
    shr.Range("A" & lastrow + 1 & ":D" & lastrow + 1).VerticalAlignment = xlCenter
    'Format hien thi
    shr.Range("E5:E" & lastrow + 1).NumberFormat = "#,##0.00"
    shr.Range("F5:F" & lastrow).NumberFormat = "#,##0.00"
    shr.Range("H5:H" & lastrow + 1).NumberFormat = "#,##0.00"
    shr.Range("G5:G" & lastrow + 1).NumberFormat = "0.00%"
    shr.Range("I5:I" & lastrow + 1).NumberFormat = "0.00%"
    shr.Range("A" & lastrow + 1 & ":H" & lastrow + 1).Font.Bold = True
    
    
    'Dien STT
    Dim i As Long
    For i = 5 To lastrow
        shr.Range("A" & i).Value = i - 4
    Next
    'Format STT
    shr.Range("A5:A" & lastrow).Select
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
    End With
    ' Ðóng recordset và connection
    rst.Close
    conn.Close
    On Error GoTo 0
End Sub

