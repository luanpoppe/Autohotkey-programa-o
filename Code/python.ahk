#Include "../configuracoes.ahk"
; #Requires AutoHotkey >=v2.0
; #SingleInstance


::aPyPrint:: {
    colar_texto("print()")
    Send(left_arrow)
}
::aPyPrintV::
::aPrintV:: {
    actualPrint := A_Clipboard
    pasteContent := "print('" . actualPrint . "', " . actualPrint . ")"
    A_Clipboard := pasteContent
    Send(ctrl("v"))
    A_Clipboard := actualPrint
}