#Include "../configuracoes.ahk"

getAllTxtContent(pathArquivo) {
    fileObject := FileOpen(pathArquivo, "r", "UTF-8")
    ; ; fileObject := FileSelect()
    allContent := fileObject.Read()
    fileObject.Close()
    return allContent
}

getExcelColumn(letraPassada) {
    todasLetras := ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    for letra in todasLetras {
        if (letraPassada = letra) {
            return A_Index
        }
    }
}

getExcelValue(pathArquivo, numeroDaAba, letraDaColuna, numeroLinha, visible := false) {
    ; Create a new Excel application object
    xlApp := ComObject("Excel.Application")
    xlApp.Visible := visible
    xlWorkbook := xlApp.Workbooks.Open(pathArquivo)
    ; Select the first worksheet
    xlWorksheet := xlWorkbook.Worksheets(numeroDaAba)
    ; MsgBox(getExcelColumn(letraDaColuna))
    ; Primeiro parâmetro é a LINHA | Segundo é a COLUNA
    cellValue := xlWorksheet.Cells(numeroLinha, getExcelColumn(letraDaColuna)).Value

    ; Clean up
    xlWorkbook.Close(false)
    xlApp.Quit
    return cellValue
}

; Terminar de criar o método abaixo
getManyExcelValues(pathArquivo, numeroDaAba, letraDaColuna, visible := false) {
    global
    cellValues := []
    ; Create a new Excel application object
    xlApp := ComObject("Excel.Application")
    xlApp.Visible := visible
    xlWorkbook := xlApp.Workbooks.Open(pathArquivo)
    ; Select the first worksheet
    xlWorksheet := xlWorkbook.Worksheets(numeroDaAba)
    ; MsgBox(getExcelColumn(letraDaColuna))
    ; Primeiro parâmetro é a LINHA | Segundo é a COLUNA
    Loop {
        valorDaLinha := xlWorksheet.Cells(A_Index, getExcelColumn(letraDaColuna)).Value
        if (valorDaLinha = "") {
            ; MsgBox("TERMINOU")
            break
        } else {
            cellValues.Push(valorDaLinha)
        }
    }

    ; Clean up
    xlWorkbook.Close(false)
    xlApp.Quit

    return cellValues
}