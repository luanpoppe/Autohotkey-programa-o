#Requires AutoHotkey >=v2.0
#Include "./configuracoes.ahk"

varTesteA := 0

::aAng:: {
    dataAgora := FormatTime(, "dd/MM/yyyy - HH:mm")
    clipAntigo := A_Clipboard
    global varTesteA := varTesteA + 1
    A_Clipboard := "Teste " . dataAgora . " | Ang" . varTesteA
    Send("{CtrlDown}v{CtrlUp}")
    A_Clipboard := clipAntigo
}