#Requires AutoHotkey >=v2.0

;* Configurações
SendMode("Event")

SetTitleMatchMode(2)
; REMOVED:     #LTrim
#SingleInstance Force
#HotIf

;* Variáveis comuns
var1 := "^b"
var_sleep := 100
rp_note_key_delay := "90" ;

; -------------- Variáveis globais -----------------
if (A_ComputerName = "WINDOWS-11-LUAN") {
    qual_pc := 2
    SetKeyDelay(120)
    ; } else if (A_ComputerName = "DESKTOP-CP6ETDU") {
    ;     qual_pc := 1
} else {
    qual_pc := SysGet(16) ; PC escritório é 1920 | Notebook é 1366
    SetKeyDelay(pc_ou_notebook(30, 90))
}

; FUNÇÕES
;
italico(texto)
{
    global
    Send(ctrl("l"))
    SendInput(texto)
    Send(Enter_key)
}
;
abrir_site(site) {
    global
    SetKeyDelay(50)
    clipboardInicial := A_Clipboard
    A_Clipboard := site
    Send(ctrl("v"))
    Send("{Enter}")
    A_Clipboard := clipboardInicial ;
}
;
pc_ou_notebook(pc, notebook) {

    If (qual_pc = 1366)
    {
        return notebook
    }
    If (qual_pc = 1920)
    {
        return pc
    }
}

clicar_mouse(botão := "l", tempo_sleep := 150, qtd_cliques := 1, down_up := "d", xpc := 0, ypc := 0, xnote := 0, ynote := 0) {
    global ;
    coord_pc := [xpc, ypc]
    coord_note := [xnote, ynote]
    MouseClick(botão, pc_ou_notebook(coord_pc[1], coord_note[1]), pc_ou_notebook(coord_pc[2], coord_note[2]), qtd_cliques, , down_up)
    Sleep(tempo_sleep)
}
;
f_sleep(comando_send, qtd_sleep) {
    Send(comando_send)
    Sleep(qtd_sleep)
}
;
;
format_ahk(texto) {
    global
    variavel2 := StrReplace(texto, "; ", ":`:")
    variavel := StrReplace(variavel2, " | ", ":`:`n:`:")
    ; Clipboard = %variavel%
    SendInput(variavel)
    ; Send, %ctrl("v")% ;
    Send(":`:")
}
;

executar_programas(caminho_pc, caminho_note) {
    global
    SetKeyDelay(100) ;
    Send(windows_r)
    Sleep(500) ;
    abrir_site(pc_ou_notebook(caminho_pc, caminho_note))
}
;
;
;
;
