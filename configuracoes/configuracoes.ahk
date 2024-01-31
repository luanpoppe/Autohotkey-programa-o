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
;* Variáveis atalhos 
    ; Ctrl + letra
        ctrl_v := "{Ctrl down}v{Ctrl up}"
        ctrl_c := "{Ctrl down}c{Ctrl up}"
        ctrl_l := "{Ctrl down}l{Ctrl up}"
        ctrl_w := "{Ctrl down}w{Ctrl up}"
        ctrl_x := "{Ctrl down}x{Ctrl up}"
        ctrl_t := "{Ctrl down}t{Ctrl up}"
        ctrl_s := "{Ctrl down}s{Ctrl up}"
        ctrl_b := "{Ctrl down}b{Ctrl up}"
        ctrl_u := "{Ctrl down}u{Ctrl up}"
        ctrl_q := "{Ctrl down}q{Ctrl up}"
        ctrl_e := "{Ctrl down}e{Ctrl up}"
        ctrl_r := "{Ctrl down}r{Ctrl up}"
        ctrl_y := "{Ctrl down}y{Ctrl up}"
        ctrl_i := "{Ctrl down}i{Ctrl up}"
        ctrl_o := "{Ctrl down}o{Ctrl up}"
        ctrl_p := "{Ctrl down}p{Ctrl up}"
        ctrl_a := "{Ctrl down}a{Ctrl up}"
        ctrl_d := "{Ctrl down}d{Ctrl up}"
        ctrl_f := "{Ctrl down}f{Ctrl up}"
        ctrl_g := "{Ctrl down}g{Ctrl up}"
        ctrl_h := "{Ctrl down}h{Ctrl up}"
        ctrl_j := "{Ctrl down}j{Ctrl up}"
        ctrl_k := "{Ctrl down}k{Ctrl up}"
        ctrl_z := "{Ctrl down}z{Ctrl up}"
        ctrl_n := "{Ctrl down}n{Ctrl up}"
        ctrl_m := "{Ctrl down}m{Ctrl up}"
    left_arrow := "{left down}{left up}"
    right_arrow := "{right down}{right up}"
    down_arrow := "{down down}{down up}"
    up_arrow := "{up down}{up up}"
    Enter_key := "{Enter down}{Enter Up}"
    Delete_key := "{Delete down}{Delete up}"
    ctrl_left := "{Ctrl down}{left down}{left up}{Ctrl up}"
    ctrl_right := "{Ctrl down}{right down}{right up}{Ctrl up}"
    ctrl_down := "{Ctrl down}{down down}{down up}{Ctrl up}"
    ctrl_up := "{Ctrl down}{up down}{up up}{Ctrl up}"
    ctrl_tab := "{Ctrl down}{Tab down}{Tap up}{Ctrl up}"
    ctrl_home := "{Ctrl down}{Home down}{Home up}{Ctrl up}"
    ctrl_enter := "{Ctrl down}{Enter down}{Enter up}{Ctrl up}"
    ctrl_shift_tab := "{Shift down}{Ctrl down}{Tab down}{Tap up}{Ctrl up}{Shift up}"
    ctrl_backspace := "{Ctrl down}{Backspace down}{Backspace up}{Ctrl up}"
    ctrl_shift_left := "{Shift down}{Ctrl down}{left down}{left up}{Ctrl up}{Shift up}"
    ctrl_shift_right := "{Shift down}{Ctrl down}{Right down}{Right up}{Ctrl up}{Shift up}"
    ctrl_shift_down := "{Shift down}{Ctrl down}{down down}{down up}{Ctrl up}{Shift up}"
    ctrl_shift_up := "{Shift down}{Ctrl down}{up down}{up up}{Ctrl up}{Shift up}"
    ctrl_shift_c := "{Shift down{ctrl down}}c{Shift Up}{ctrl up}"
    ctrl_shift_v := "{Shift down}{ctrl down}v{Shift Up}{ctrl up}"
    shift_right := "{Shift Down}{right down}{Shift up}{right Up}"
    shift_left := "{Shift Down}{left down}{Shift up}{left Up}"
    alt_tab := "{alt down}{tab down}{tab up}{alt up}"
    alt_enter := "{alt down}{enter down}{enter up}{alt up}"
    alt_shift_down := "{AltDown}{ShiftDown}{down down}{down up}{ShiftUp}{AltUp}"
    alt_shift_up := "{AltDown}{ShiftDown}{up down}{up up}{ShiftUp}{AltUp}"
    alt_shift_right := "{AltDown}{ShiftDown}{right down}{right up}{ShiftUp}{AltUp}"
    alt_shift_left := "{AltDown}{ShiftDown}{left down}{left up}{ShiftUp}{AltUp}"
    windows_r := "{Lwin down}r{Lwin up}"
;

; -------------- Variáveis globais -----------------
qual_pc := SysGet(16) ; PC escritório é 1920 | Notebook é 1366 
SetKeyDelay(pc_ou_notebook(30,90))

; FUNÇÕES
    ; 
    italico(texto)
        {
        global
        Send(ctrl_l)
        SendInput(texto)
        Send(Enter_key)
        }
    ;
    abrir_site(site){
        global
        SetKeyDelay(50)
        clipboardInicial := A_Clipboard
        A_Clipboard := site
        Send(ctrl_v)
        Send("{Enter}")
        A_Clipboard := clipboardInicial ; 
        }
    ;
    pc_ou_notebook(pc, notebook){
        
        If(qual_pc = 1366)
            {
            return notebook
            }
        If(qual_pc = 1920)
            {
            return pc
            }
        }
    
    clicar_mouse(botão:="l", tempo_sleep:=150, qtd_cliques:=1, down_up:="d", xpc:=0, ypc:=0, xnote:=0, ynote:=0){
        global ; 
        coord_pc := [xpc, ypc]
        coord_note := [xnote, ynote]
        MouseClick(botão, pc_ou_notebook(coord_pc[1], coord_note[1]), pc_ou_notebook(coord_pc[2], coord_note[2]), qtd_cliques, , down_up)
        Sleep(tempo_sleep)
        }
    ;
    f_sleep(comando_send, qtd_sleep){
        Send(comando_send)
        Sleep(qtd_sleep)
        }
    ;
    colar_texto(texto){
        global
        clipboardInicial := A_Clipboard
        A_Clipboard := texto
        Send(ctrl_v)
        A_Clipboard := clipboardInicial ; 
        }
    ;
    format_ahk(texto){
        global
        variavel2 := StrReplace(texto, "; ", ":`:")
        variavel := StrReplace(variavel2, " | ", ":`:`n:`:")
        ; Clipboard = %variavel%
        SendInput(variavel)
        ; Send, %ctrl_v% ; 
        Send(":`:")
    }
    ; 

    executar_programas(caminho_pc, caminho_note){ 
        global
        SetKeyDelay(50) ; 
        Send(windows_r)
        Sleep(500) ; 
        abrir_site(pc_ou_notebook(caminho_pc, caminho_note))
        }
;
; 
;
;