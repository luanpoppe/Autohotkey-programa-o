#Include "../configuracoes.ahk"

; Variáveis:
save1 := "Valor inicial" ;
save2 := "Valor inicial" ;
save3 := "Valor inicial" ;
;
; ---------- Utilitários ----------
;* Pegar posição mouse - atalho --> pegarmouse
::pegarmouse:: {
    MouseGetPos(&var_x, &var_y)
    MsgBox("x = " var_x " | y = " var_y, "", "")
    A_Clipboard := var_x ", " var_y
}
;
;* Pegar título do programa/aba
::pegartitulo:: {
    qual_titulo := WinGetTitle("A")
    MsgBox(qual_titulo)
    A_Clipboard := qual_titulo
}
;
; Configurar microfone da JBL -
::aconfigmic:: {
    Send("{lwin down}r{lwin up}")
    Sleep(200)
    SendInput("control mmsys.cpl sounds")
    Send("{Enter}")
    Sleep(2000)
    ErrorLevel := !ImageSearch(&var_x, &var_y, 0, 0, 3000, 3000, "G:\Meu Drive\Luan - Drive\_Programação\AutoHotKey - VSCode\Database Imagens\Gravação.png")
    MouseClick("left", 122, 46)
    Sleep(100)
    MouseClick("right", 159, 332)
    Sleep(100)
    MouseClick("left", 274, 453)
    Sleep(100)
    MouseClick("left", 84, 49)
    Sleep(100)
    MouseClick("left", 89, 188)
}
;
;* Reload do script Master
::areload:: {
    Send(ctrl("s"))
    Run("main_2.ahk")
}

::areload2:: {
    SetKeyDelay(40) ;
    Send("{CtrlDown}{ShiftDown}p{CtrlUp}{ShiftUp}")
    Send("swf")
    Send(pressKey("Enter"))
    Run("`"Master.ahk`"")
}
;
;
;
; Atalho para clicar F1
::af1:: {
    Send("{F1}")
}
; Atalho para clicar F5
::af5:: {
    Send("{F5}")
}
;
; Formatar para ::atalho::
::aformat2:: {
    format_ahk(A_Clipboard)
}

; Data de Hoje
::aHoje:: ; aToday
::aToday:: {
    var_dia := FormatTime(, "dd")
    var_mês := FormatTime(, "MM")
    var_ano := FormatTime(, "yyyy")
    SendInput(var_dia . "/" . var_mês . "/" . var_ano)
}
; Data de Hoje sem o ano -> Ex: 19/04
::aHojeM:: ; aTodayM
::aTodayM:: {
    var_dia := FormatTime(, "dd")
    var_mês := FormatTime(, "MM")
    SendInput(var_dia . "/" . var_mês)
}
; Data de hoje para arquivos -> 17-12-2023
::aHojeA:: ; --> A de arquivo
::aTodayA:: {
    var_dia := FormatTime(, "dd")
    var_mês := FormatTime(, "MM")
    var_ano := FormatTime(, "yyyy")
    SendInput(var_dia . "-" . var_mês . "-" . var_ano)
}
; Data de Ontem
::aOntem:: ; aYesterday | aYest
::aYesterday::
::aYest:: {
    tempo := a_now
    tempo := DateAdd(tempo, -1, 'Days') ;
    var_dia := FormatTime(tempo, "dd")
    var_mês := FormatTime(tempo, "MM")
    var_ano := FormatTime(tempo, "yyyy")
    SendInput(var_dia . "/" . var_mês . "/" . var_ano)
}
; Data de Ontem sem o ano
::aOntemM:: ; aYesterdayM | aYestM
::aYesterdayM::
::aYestM:: {
    tempo := a_now
    tempo := DateAdd(tempo, -1, 'Days') ;
    var_dia := FormatTime(tempo, "dd")
    var_mês := FormatTime(tempo, "MM")
    SendInput(var_dia . "/" . var_mês)
}
; Data de Amanhã
::aAmanhã:: ; aAmanha | aTomorrow | aTomo
::aAmanha::
::aTomorrow::
::aTomo:: {
    tempo := a_now
    tempo := DateAdd(tempo, 1, 'Days') ;
    var_dia := FormatTime(tempo, "dd")
    var_mês := FormatTime(tempo, "MM")
    var_ano := FormatTime(tempo, "yyyy")
    SendInput(var_dia . "/" . var_mês . "/" . var_ano)
}
; Hora atual
::aAgora:: ; aNow
::aNow:: {
    tempo := a_now
    var_hora := FormatTime(tempo, "HH")
    var_minutos := FormatTime(tempo, "mm")
    SendInput(var_hora . ":" . var_minutos)
}

^+p:: {
    colar_texto("hahaha")
    ; Send("{F1}")
}

;
;@ ----- Atalhos do Visual Studio ----
#HotIf WinActive("Visual",)
; ^+p:: ; Control + Alt + P --> Abre o command Pallete
;     Send, {Ctrl down}{alt down}p{Ctrl up}{alt up} PP O
;     }
^!n:: ; ctrl + alt + n --> Executa o arquivo python
{ ; V1toV2: Added bracket
    Send(ctrl("s"))
    Send("{Ctrl down}'{Ctrl up}")
    Send(up_arrow)
    Send(pressKey("Enter"))
}
::FormatIf:: { ; escrever estrutura do if
    SendInput("{raw}if `n")
    Send("{Tab}")
    SendInput("{Raw}{}")
    Send(left_arrow "{Enter}")
    Send(up_arrow "" right_arrow "{Enter}")
}
;
;
;
;* Atalhos em sites/programas específicos:
#HotIf WinActive("Planilhas")
; Excluir linha do Planilhas:
; excluirLinhaPlanilhas:
;     {
;         Send("{CtrlDown}{AltDown}-{CtrlUp}{AltUp}")
;         Send(pressKey("down") "" pressKey("down"))
;         Send(pressKey("Enter"))
;     }

; Mudar página de planilhas - Clicar roda do mouse
Ctrl & MButton:: {
    { ; V1toV2: Added bracket
        Send("{CtrlDown}{ShiftDown}{PgUp}{CtrlUp}{ShiftUp}")
    }
} ; V1toV2: Added Bracket before hotkey or Hotstring
MButton:: {
    { ; V1toV2: Added bracket
        Send("{CtrlDown}{ShiftDown}{PgDn}{CtrlUp}{ShiftUp}")
    }
    ;
    ; Tachar texto no Google Sheets/Planilhas - Ctrl + Shift + S
} ; V1toV2: Added bracket in the end
#HotIf WinActive("Planilhas",)
^+s:: {
    { ; V1toV2: Added bracket
        Send("{AltDown}{ShiftDown}5{AltUp}{ShiftUp}")
    }
    ;
} ; V1toV2: Added bracket in the end
#HotIf WinActive("Visual Studio",)
; Abrir e fechar "pastas" nos códigos do VS code
MButton:: {
    { ; V1toV2: Added bracket
        MouseClick("Left")
        Send("{ShiftDown}{CtrlDown} `[ {ShiftUp}{CtrlUp}")
    }
    ;
} ; V1toV2: Added Bracket before hotkey or Hotstring
Ctrl & MButton:: {
    { ; V1toV2: Added bracket
        MouseClick("Left")
        Send("{ShiftDown}{CtrlDown} `` {ShiftUp}{CtrlUp}")
    }
    ;
} ; V1toV2: Added Bracket before hotkey or Hotstring
::aop:: ; aopen
::aopen:: {
    Send("{ShiftDown}{CtrlDown} `[ {ShiftUp}{CtrlUp}")
}
;
::acl:: ; aclose
::aclose:: {
    Send("{ShiftDown}{CtrlDown} `` {ShiftUp}{CtrlUp}")
}

;
#HotIf
; Criar arrow function JavaScript:
::aJSArrow:: ; aArrowJS | aJSAF | aAFJS
::aArrowJS::
::aJSAF::
::aAFJS:: {
    SetKeyDelay(50)
    varTemp2 := "() => {}"
    varTemp3 := A_Clipboard
    A_Clipboard := varTemp2
    Send(ctrl("v"))
    A_Clipboard := varTemp3
}

; Escrever o seletor do jQuery --> a$$ ou ajqry --> $("")
::a$$::
::ajqry::
::ajqy::
::ajqr:: {
    Send("$(`"`")")
    Send(left_arrow "" left_arrow)
}
; Escrever o ${} para strings no JavaScript - aJStr (Javascript string)
::aJStr::
::aJString::
::aJsString:: {
    Send("{Raw}" "${}") ; ${}
    Send(left_arrow)
}
;
;
; Pausar e Despausar Música
::apause:: {
    Send("{Media_Play_Pause}")
}
; Início da música
::aInicio:: ; aInício | aBegin | aBeg
::aInício::
::aBegin::
::aBeg:: {
    Send("{Media_Prev}")
}
; Música anterior
::aPrevious:: ; aPrev
::aPrev:: {
    Send("{Media_Prev 2}")
}
; Próxima música:
::anext:: {
    Send("{Media_Next}")
}
;
; Escrever "\" fácil no PC --> a&
::a&:: {
    SendInput("\{Space}")
}
; Escrever "|" fácil no PC --> a*
::a*:: {
    SendInput("|{Space}")
}
; Escrever "$" fácil no PC --> açç (a de atalho, ç de "cidilha")
::açç:: {
    Send("$")
}
; Escrever "&" fácil no PC --> aee
::aee:: {
    Send("&")
}
; Escrever "&__" fácil no PC --> aee__
::aee__:: {
    Send("&__")
}
; Escrever "" --> a´´
::a´´:: ;
::aAct::
::aAc:: {
    SetKeyDelay(50)
    IB := InputBox("Digite a String", "Digite a String"), varInput := IB.Value
    ; Sleep, 200 ;
    varTemp := A_Clipboard
    A_Clipboard := "`"" . varInput . "`""
    ; Sleep, 200 ;
    Send(ctrl("v"))
    A_Clipboard := varTemp
    ; Send, %Delete_key% ;
}
; Escrever npm install --save-dev --> anpmisdev
::anpmisdev:: ; anpmisd | anisd | anisdev
::anpmisd::
::anisd::
::anisdev:: {
    SendInput("npm install --save-dev")
}
; Escrever git add, commit e push de vez:
::aGitACP:: ; aGitAdd | ACP de add, commit e push
::aGitAdd:: {
    Sleep(100)
    IB := InputBox("Escreva a descrição do commit", "Descriçaõ Commit", , "novo commit"), descriçaoCommit := IB.Value
    A_Clipboard := "git add . "
    Send(ctrl("v"))
}
; Escrever media query CSS:
::aMediaQuery:: ; aMQuery
::aMQuery:: {
    A_Clipboard := "@media (max-width: 480px) `{`}"
    Send(ctrl("v"))
}
;
;
;
#HotIf WinActive("Excel",)
; Atalhos corrigidos do Excel

isEnterPressedInExcel := 0
Enter::
NumpadEnter:: { ; Editar a célula atual
    global
    if (isEnterPressedInExcel = 0) {
        Send("{F2}")
        isEnterPressedInExcel := 1
    } else if (isEnterPressedInExcel = 1) {
        Send("{Enter}")
        isEnterPressedInExcel := 0
    }
}
^a:: ; ctrl a --> Selecionar tudo
{ ; V1toV2: Added bracket
    Send("{CtrlDown}t{CtrlUp}")
}
^u:: ; ctrl u --> Sublinhar
{ ; V1toV2: Added bracket
    Send("{CtrlDown}s{CtrlUp}")
}
^f:: ; ctrl f --> Localizar e substituir
{ ; V1toV2: Added bracket
    Send("{CtrlDown}u{CtrlUp}")
}
^s:: ; ctrl s --> Salvar
{ ; V1toV2: Added bracket
    Send("{CtrlDown}b{CtrlUp}")
}
+^s:: ; ctrl shift s --> Tachar
{ ; V1toV2: Added bracket
    Send("{CtrlDown}5{CtrlUp}")
}
^b:: ; ctrl b --> Negrito
{ ; V1toV2: Added bracket
    Send("{CtrlDown}n{CtrlUp}")
}

#HotIf WinActive("Word",)
; Atalhos corrigidos do Word
^a:: ; ctrl a --> Selecionar tudo
{ ; V1toV2: Added bracket
    Send("{CtrlDown}t{CtrlUp}")
}
^u:: ; ctrl u --> Sublinhar
{ ; V1toV2: Added bracket
    Send("{CtrlDown}s{CtrlUp}")
}
^f:: ; ctrl f --> Localizar e substituir
{ ; V1toV2: Added bracket
    Send("{CtrlDown}u{CtrlUp}")
}
^s:: ; ctrl s --> Salvar
{ ; V1toV2: Added bracket
    Send("{CtrlDown}b{CtrlUp}")
}
+^s:: ; ctrl shift s --> Tachar
{ ; V1toV2: Added bracket
    Send("{CtrlDown}5{CtrlUp}")
}
^b:: ; ctrl b --> Negrito
{ ; V1toV2: Added bracket
    Send("{CtrlDown}n{CtrlUp}")
}
;
#HotIf WinActive("Gmail",)
; Gmail - Criar filtros
::aGmail1:: {
    if (qual_pc = 1920)
    {
        ; ImageSearch, var_x, var_y, 0, 0, 3000, 3000, \AutoHotKey - VSCode\Database Imagens\Pesquisa Avançada.png
        MouseClick("Left", 954, 143)
        Sleep(100)
        MouseClick("Left", 797, 572)
        Sleep(300)
        MouseClick("Left", 544, 601)
        Sleep(500)
        MouseClick("Left", 369, 355)
        Sleep(300)
        MouseClick("Left", 555, 350)
    }
}
;
#HotIf WinActive("Chrome",)
; Notion - Mudar cor do texto
; #IfWinActive, Chrome
; ^+!p:: ; Control + Shift + Alt + P
; InputBox, var_input, Selecione:, b = blue `nr = red `np = pink, , , , , , , , b
; ImageSearch, x_inicial, y_inicial, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *2 G:\Meu Drive\Luan - Drive\_Programação\AutoHotKey - VSCode\Database Imagens\Notion - Mudar cor texto v3.png
; MsgBox, %y_inicial%
; MsgBox, Coloque o mouse onde vai ser clicado
; MouseGetPos, x_mouse, y_mouse
; soma_x := x_mouse-x_inicial
; soma_y := y_mouse-y_inicial
; MouseClick, left, x_inicial + 16, y_inicial + 19
; ; MsgBox, %x_inicial%
; Msgbox, Somar ao x = %soma_x% `nSomar ao y = %soma_y%
; Clipboard = Somar ao x = %soma_x% | Somar ao y = %soma_y%
; MouseClick, left, x_inicial + soma_x, y_inicial + soma_y
; ; MsgBox, %x_inicial% e %y_inicial%
; }
;
; Notion - Criar um RP numa aula de algo
::anewrp:: ; arpnew
::arpnew:: {
    SendInput("> ")
    Send(ctrl_enter "RP{Enter}")
    SendInput("Anotações da aula{Enter}{Tab}-{Space}")
}
;
; Formatar textos de pdfs para resumos de estudos
::aFormatar:: ; aForm | aFormat
::aform::
::aformat:: {
    Send(ctrl("t") "" ctrl("v"))
    Send("{Control down}a{Control up}")
    Send(ctrl("c") "" ctrl("w"))
}
;
; Hotmart - Baixar vídeo
::ahotdown:: ; ahotmartdownload | ahotdownload
::ahotmartdownload::
::ahotdownload:: {
    ;
    IB := InputBox("Quantos minutos?", "Quantos minutos:"), qts_minutos := IB.Value
    qts_segundos := qts_minutos * 60
    MouseClick("Left", 1226, 69)
    Sleep(200)
    MouseClick("Left", 179, 273)
    Sleep(200)
    MouseClick("Left", 629, 480)
    Sleep(200)
    MouseClick("Left", 389, 650)
    Sleep(400)
    MouseClick("Left", 564, 112)
    Sleep(200)
    MouseClick("Left", 283, 207)
    Sleep(200)
    MouseClick("Left", 521, 526)
    ; MouseClick, Left,
    Sleep(qts_segundos * 1000)
    MouseClick("Left", 499, 138)
    MsgBox("Terminado de gravar tela do vídeo")
}
;
;
;
;* Atalhos diversos
; Atalhos com F1
; #IfWinActive
#HotIf !WinActive("Visual |",)
; f1::
; var_1 := "1 - Abrir Chrome Luan Trabalhos"
; var_2 := "2 - Abrir Chrome Luan Geral"
; var_3 := "3 - Abrir Telegram"
; var_4 := "4 - Abrir whatsapp"
; var_descriçao = %var_1% `n%var_2% `n%var_3% `n%var_4%
; InputBox, var_f1, O que fazer?, %var_descriçao%,,,,,,,,
; if var_f1 = 1 ; Abrir Chrome Trabalhos
;     {
;     Run "C:\Program Files\Google\Chrome\Application\chrome.exe" --profile-directory="Profile 1"
;     }
; if var_f1 = 2 ; Abrir Chrome Luan Geral
;     {
;     Run "C:\Program Files\Google\Chrome\Application\chrome.exe" --profile-directory="Default"
;     }
; ;
; if var_f1 = 3 ; Abrir telegram
;     {
;     Run % pc_ou_notebook("C:\Users\luan2\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Telegram Desktop\Telegram.lnk"
;     , "C:\Users\luan2\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Telegram Desktop\Telegram.lnk")
;     }

; ;
; if var_f1 = 4 ; Abrir whatsapp
;     {
;     executar_programas("C:\Users\luan2\Desktop\Programas\WhatsApp.lnk"
;     , "C:\Users\luan2\AppData\Local\WhatsApp\WhatsApp.exe")
;     }
; ;
; }
;! Atalhos com Ctrl + Q
#HotIf
^q:: {
    global
    { ; V1toV2: Added bracket
        SendMode("Event") ;
        var_1 := "Q - Adicionar 1 à planilha"
        var_2 := "L - Baixar legenda --> Com arquivo selecionado"
        var_3 := "W - Passar página de um chrome para outro"
        var_4 := "B - Baixar torrent do 1377"
        var_5 := "C1 e V1 | Até C5 e V5 - Copiar e colar nos respectivos slots"
        var_6 := "format - Formatação Condicional no Sheets"
        var_descriçao := var_1 "`n" var_2 "`n" var_3 "`n" var_4 "`n`n" var_5 "`n" var_6
        IB := InputBox(var_descriçao, "Escolha:"), var_ctrl_q := IB.Value
        SetKeyDelay(80)
        if (var_ctrl_q = "q") ; Adicionar um ao número da planilha de prioridades
        {
            Send(ctrl("c"))
            var_1 := A_Clipboard
            Sleep(150)
            ; MsgBox, %var_1%
            var_2 := var_1 + 1
            ; MsgBox, %var_2%
            Sleep(150)
            Send("{Enter}{Backspace 2}")
            Sleep(200)
            Send(var_2 "{Enter}")
            ; Clipboard = %var_1% + 4
            ; Send, %ctrl("v")%
        }
        ;
        if (var_ctrl_q = "l") ; Baixar legenda --> Com arquivo selecionado
        {
            SetKeyDelay(200)
            Send("{AppsKey}")
            Send("b")
            Send("{Enter}{Enter}")
        }
        if (var_ctrl_q = "w") ; Passar página de um chrome para outro -> Deixar os dois nos primeiros alt tab
        {
            SetKeyDelay(100)
            Send(ctrl("l") "" ctrl("c"))
            Send(alt_tab "" ctrl("t"))
            Send(ctrl("v") "{Enter}")
            Send(alt_tab "" ctrl("w"))
        }
        ;
        if (var_ctrl_q = "b") ; Baixar do site 1377
        {
            MouseClick("left", pc_ou_notebook(0, 610), pc_ou_notebook(0, 609), 2)
            Send(ctrl("c"))
            WinActivate("qBittorrent")
            MouseClick("left", pc_ou_notebook(0, 30), pc_ou_notebook(0, 71))
            Send("{Ctrl down}{Enter}{ctrl up}")
        }
        ;
        ;
        ;
        ; if (var_ctrl_q = "format") ;
        ; {
        ;     SendMode("Event")
        ;     MouseMove(500, 500)
        ;     Send("{AppsKey}{up}{enter}{enter}")
        ;     Send("{shift down}{tab down}{tab up}{shift up}")
        ;     Send("{Enter}")
        ;     clicar_mouse(Left,50 , 1,"" , 1740, 465, 1161, 477) ; Clica em "se não está vazio"
        ;     clicar_mouse(Left,50 , 1,"" , 1741, 493, 1185, 509) ; Clica em "o texto contém"
        ;     Send("{tab}")
        ; }
        ;
        ; if (var_ctrl_q = "f1") ;
        ; {
        ;     Goto("af1")
        ; } ; V1toV2: Added Bracket before hotkey or Hotstring
    } ;
    if (var_ctrl_q = "f2") ;
    {
        Send("{F2}")
    }
    if (var_ctrl_q = "f5") ;
    {
        Send("{F5}")
    }
    if (var_ctrl_q = "sf10") ; Shift + F10
    {
        Sleep(100)
        Send("{Shift Down}{F10}")
        Sleep(50)
        Send("{Shift Up}") ;
        Sleep(50)
        Send("a")
    }
    ;
    ; if (var_ctrl_q = "reloadq") ;
    ; {
    ;     Goto(areload)
    ; }
    ;
    ; if (var_ctrl_q = "rpnowq") ; RpNowQ
    ; {
    ;     Goto(rpnow)
    ; }
    ; if (var_ctrl_q = "rpnovoq") ; RpNovoQ
    ; {
    ;     Goto(rpnovo)
    ; }
    ; if (var_ctrl_q = "rpnownewq") ; RpNowNewQ
    ; {
    ;     Goto(rpnownew)
    ; }
    ;
    if (var_ctrl_q = "v") ;
    {
        SetKeyDelay(80)
        Send("{LWinDown}v{LWinUp}")
    }
    if (var_ctrl_q = "v1") ;
    {
        SetKeyDelay(80)
        Send("{LWinDown}v{LWinUp}")
        ; Send, %pressKey("down")%
        Send("{Enter}")
    }
    if (var_ctrl_q = "v2")
    {
        SetKeyDelay(80)
        Send("{LWinDown}v{LWinUp}")
        Send(pressKey("down"))
        Send("{Enter}")
    }
    if (var_ctrl_q = "v3")
    {
        SetKeyDelay(80)
        Send("{LWinDown}v{LWinUp}")
        Send(pressKey("down") "" pressKey("down"))
        Send("{Enter}")
    }
    if (var_ctrl_q = "v4")
    {
        SetKeyDelay(80)
        Send("{LWinDown}v{LWinUp}")
        Send(pressKey("down") "" pressKey("down") "" pressKey("down"))
        Send("{Enter}")
    }
    if (var_ctrl_q = "v5") ;
    {
        SetKeyDelay(80)
        Send("{LWinDown}v{LWinUp}")
        Send(pressKey("down") "" pressKey("down") "" pressKey("down") "" pressKey("down"))
        Send("{Enter}")
    }
    ;
    if (var_ctrl_q = "max") ; Maximiza a janela
    {
        Sleep(100)
        WinMaximize(" ")
    }
    if (var_ctrl_q = "min") ; Minimiza a janela
    {
        Sleep(100)
        WinMinimize(" ")
    }
    if (var_ctrl_q = "minall") ;
    {
        Sleep(100)
        WinMinimizeAll
        ; WinMinimize, % " "
    }
    ;
    ; if (var_ctrl_q = "pdata") ; Classifica RPs de acordo com a próxima data
    ; {
    ;     clicar_mouse(left,100,1,"",1123, 347, 753,347)
    ;     clicar_mouse(left,100,1,"",951, 387, 685,386)
    ;     Send(pressKey("down"))
    ;     Send(left_arrow) ;
    ; }
    ;
    ; if (var_ctrl_q = "ch1") ; Abrir Chrome 1
    ; {
    ;     Goto(ech1)
    ; }
    ; if (var_ctrl_q = "ch2") ; Abrir Chrome 2
    ; {
    ;     Goto(ech2)
    ; } ;
    ; if (var_ctrl_q = "ch3") ; Abrir Chrome 3
    ; {
    ;     Goto(ech3)
    ; } ;
    ; if (var_ctrl_q = "fire") ; Abrir Firefox
    ; {
    ;     Goto(efire)
    ; }

    ;
    ; if (var_ctrl_q = "csq") ; Salvar página no Notion -> Página à direita do Notion
    ; {
    ;     label_csq()
    ; }
    ;
    ;
    if (var_ctrl_q = "wrar") ; Adicionar arquivos pro winrar com tamanho de 1998mb
    {
        ; #HotIf WinActive("ahk_exe Explorer.EXE")
        SendMode("Event")
        SetKeyDelay(120)
        Send("{AppsKey}")
        Sleep(800)
        ; MsgBox, %A_SendMode%
        Send("a")
        Send("a")
        Send("{Enter}")
        Sleep(200)
        Send("{Tab 6}")
        SendInput(1998)
    }
    ;
    if (var_ctrl_q = "wrartele") ; Adicionando .rar ao telegram
    {
        SendMode("Event")
        SetKeyDelay(100)
        Send("{F2}")
        Send(ctrl("c"))
        var_winrar_1 := A_Clipboard ; Copiar o nome do arquivo
        Send("{Enter}")
        Send(ctrl("c"))
        WinActivate("ahk_class Qt5159QWindowIcon") ; Abre o telegram
        Send(ctrl("v"))
        Sleep(500)
        SendInput("{#}Dia_a_Dia_do_trader{Space}") ; # que vai ser escrita no telegram
        SendInput(var_winrar_1)
    }
    ;
    ; Emojis
    if (var_ctrl_q = "emojimúsica") ;
    {
        Send("🎶")
    }
    if (var_ctrl_q = "emojicomp") ;
    {
        Send("💻")
    }
    if (var_ctrl_q = "emojigtr") ;
    {
        Send("🎸")
    }
    ;

    ; if (var_ctrl_q = "excl") ;
    ; {
    ;     Goto(excluirLinhaPlanilhas)
    ; }
    ; if (var_ctrl_q = "exclinha")
    ; {
    ;     Goto(excluirLinhaPlanilhas)
    ; }
    ;
    ;
    if (var_ctrl_q = "save1") ;
    {
        Send(ctrl("c"))
        save1 := A_Clipboard
    }
    if (var_ctrl_q = "load1") ;
    {
        A_Clipboard := save1
        Send(ctrl("v"))
    }
    ;
    if (var_ctrl_q = "save2") ;
    {
        Send(ctrl("c"))
        save2 := A_Clipboard
    }
    if (var_ctrl_q = "load2") ;
    {
        A_Clipboard := save2
        Send(ctrl("v"))
    }
    ;
    if (var_ctrl_q = "save3") ;
    {
        Send(ctrl("c"))
        save3 := A_Clipboard
    }
    if (var_ctrl_q = "load3") ;
    {
        A_Clipboard := save3
        Send(ctrl("v"))
    }
    ;
    if (var_ctrl_q = "save4") ;
    {
        Send(ctrl("c"))
        save4 := A_Clipboard
    }
    if (var_ctrl_q = "load4") ;
    {
        A_Clipboard := save4
        Send(ctrl("v"))
    }
    ;
    if (var_ctrl_q = "save5") ;
    {
        Send(ctrl("c"))
        save5 := A_Clipboard
    }
    if (var_ctrl_q = "load5") ;
    {
        A_Clipboard := save5
        Send(ctrl("v"))
    }
    ;
    if (var_ctrl_q = "s1") ;
    {
        Send(ctrl("c"))
        s1 := A_Clipboard
    }
    if (var_ctrl_q = "l1") ;
    {
        A_Clipboard := s1
        Send(ctrl("v"))
    }
    if (var_ctrl_q = "s2") ;
    {
        Send(ctrl("c"))
        s2 := A_Clipboard
    }
    if (var_ctrl_q = "l2") ;
    {
        A_Clipboard := s2
        Send(ctrl("v"))
    }
    if (var_ctrl_q = "s3") ;
    {
        Send(ctrl("c"))
        s3 := A_Clipboard
    }
    if (var_ctrl_q = "l3") ;
    {
        A_Clipboard := s3
        Send(ctrl("v"))
    }
    if (var_ctrl_q = "s4") ;
    {
        Send(ctrl("c"))
        s4 := A_Clipboard
    }
    if (var_ctrl_q = "l4") ;
    {
        A_Clipboard := s4
        Send(ctrl("v"))
    }
    if (var_ctrl_q = "s5") ;
    {
        Send(ctrl("c"))
        s5 := A_Clipboard
    }
    if (var_ctrl_q = "l5") ;
    {
        A_Clipboard := s5
        Send(ctrl("v"))
    }
    ;
    ;
    if (var_ctrl_q = "colapAll") ;
    {
        Send("{CtrlDown}k0{CtrlUp}")
    }
    if (var_ctrl_q = "showAll") ;
    {
        Send("{CtrlDown}kj{CtrlUp}")
    }
    if (var_ctrl_q = "clAll") ;
    {
        Send("{CtrlDown}k0{CtrlUp}")
    }
    if (var_ctrl_q = "opAll") ;
    {
        Send("{CtrlDown}kj{CtrlUp}")
    }
    if (var_ctrl_q = "createColap") ;
    {
        Send("{CtrlDown}k,{CtrlUp}")
    }
    if (var_ctrl_q = "removeColap") ;
    {
        Send("{CtrlDown}k.{CtrlUp}")
    }
    if (var_ctrl_q = "colapInside") ;
    {
        Send("{CtrlDown}k´{CtrlUp}")
    }
    if (var_ctrl_q = "showInside") ;
    {
        Send("{CtrlDown}k[{CtrlUp}")
    }
    if (var_ctrl_q = "clInside") ;
    {
        Send("{CtrlDown}k´{CtrlUp}")
    }
    if (var_ctrl_q = "opInside") ;
    {
        Send("{CtrlDown}k[{CtrlUp}")
    }
    if (var_ctrl_q = "clI") ;
    {
        Send("{CtrlDown}k´{CtrlUp}")
    }
    if (var_ctrl_q = "opI") ;
    {
        Send("{CtrlDown}k[{CtrlUp}")
    }
    if (var_ctrl_q = "colap") ;
    {
        Send("{ShiftDown}{CtrlDown}´{CtrlUp}{ShiftUp}")
    }
    if (var_ctrl_q = "show") ;
    {
        Send("{ShiftDown}{CtrlDown}[{CtrlUp}{ShiftUp}")
    }
    if (var_ctrl_q = "cl") ;
    {
        Send("{ShiftDown}{CtrlDown}´{CtrlUp}{ShiftUp}")
    }
    if (var_ctrl_q = "op") ;
    {
        Send("{ShiftDown}{CtrlDown}[{CtrlUp}{ShiftUp}")
    }
}
;
;
;
;
;
; -------- Atalhos de organização --------
; #IfWinActive YouTube
; ;* Copia a página aberta do youtube para o notion na aba à direita --> Control Shift Q
;     ; Funcionamento:
;         /*
;         Aba do Youtube na esquerda - Aba do notion a direita
;         Seleciona o título do youtube e depois clica o atalho
;         */
;     ^+q:: ; Control Shift Q
;     SetKeyDelay, 80
;     WinGetActiveTitle, var_titulo
;     Send, %ctrl("l")%%ctrl("c")%
;     var_link := Clipboard
;     Send, %ctrl_tab%
;     Clipboard := var_titulo
;     Send, %ctrl("s")hift_v%
;     Send, %ctrl_backspace%%ctrl_backspace% ;
;     Send, %ctrl_backspace%%ctrl_backspace% ;
;     ; Send, {Space}-{Space}
;     SendInput, YT ;
;     Send, %ctrl("s")hift_left%
;     Clipboard := var_link
;     Send, %ctrl("v")%
;     Send, {Enter} ;
;     }
; ;
; #IfWinActive Chrome
; ;* Copia a página aberta para o notion na aba à direita --> Control Shift Q
;     ; Funcionamento
;         ; Seleciona o texto que vai ser o título --> Pressiona o atalho
;     ^+q:: ; Control Shift Q
;     SetKeyDelay, 80
;     WinGetActiveTitle, var_titulo
;     Send, %ctrl("l")%%ctrl("c")%
;     var_link := Clipboard
;     Send, %ctrl_tab%
;     Clipboard := var_titulo
;     Send, %ctrl("s")hift_v%
;     Send, %ctrl_backspace%%ctrl_backspace% ;
;     Sendinput, Link
;     Send, %ctrl("s")hift_left%
;     Clipboard := var_link
;     Send, %ctrl("v")%
;     Send, {Enter}
;     }
;
;
; label_csq() ;
; { ; V1toV2: Added bracket
;     SetKeyDelay(80)
;     var_titulo := WinGetTitle("A")
;     Send(ctrl("l") "" ctrl("c"))
;     var_link := A_Clipboard
;     Send(ctrl_shift_tab)
;     A_Clipboard := var_titulo
;     Send(ctrlShift("v"))
;     Send(ctrl_backspace "" ctrl_backspace) ;
;     SendInput("Link")
;     Send(ctrl_shift_left)
;     A_Clipboard := var_link
;     Send(ctrl("v"))
;     Send("{Enter}")
; }
;

;

#HotIf WinActive("Chrome",)
; Escrever no formato de código do Notion facilmente
::aCoNo:: ; aNoCo
::aNoCo::
::aacn:: {
    SetKeyDelay(50) ;
    IB := InputBox("Escreva código para o Notion", "Código Notion"), textoNotion := IB.Value ; Default
    A_Clipboard := textoNotion
    Send("{ctrl down}e{ctrl up}")
    Send("{ctrl down}v{ctrl up}") ;
    Send("{ctrl down}e{ctrl up}")
}

; SaveNotion | Salvar abas do Chrome no Notion | Página do Notion fica a esquerda
::savenotion:: {
    SetKeyDelay(50)
    IB := InputBox("Quantos loops fazer?`nDeixar em branco pra salvar todas até a aba do notion", "Quantos loops:", , 3), qts_loops := IB.Value
    valor_sleep_local := "500"
    Loop qts_loops
    {
        Sleep(valor_sleep_local)
        Send("{ctrl down}l{ctrl up}") ;  %ctrl("l")%%ctrl("c")%
        Sleep(valor_sleep_local)
        Send("{ctrl down}c{ctrl up}")
        var_link := A_Clipboard
        Sleep(valor_sleep_local)
        var_titulo := WinGetTitle("A")
        Sleep(valor_sleep_local)
        Send(ctrl_shift_tab)
        A_Clipboard := var_titulo
        Send(ctrl("v"))
        Send(ctrl_backspace "" ctrl_backspace)
        SendInput("Link")
        Send(ctrl_shift_tab)
        A_Clipboard := var_link
        Send(ctrl("v"))
        Send("{Enter}")
        Send(ctrl_tab)
        Sleep(valor_sleep_local)
        Send(ctrl("w"))
        ; WinGetActiveTitle, var_titulo
        /*
        */
    } Until var_titulo = "Salvando abas - Google Chrome"
}
;
; aAbasCel | Abrir páginas do celular no histórico do Chrome do PC --> Começar numa aba vazia
; ::aAbasCel:: ; aabascelular
;     ::aAbasCelular:: {
;         IB := InputBox("", "Quantos abas abrir:", "t10"), qtd_loop Quantos Loops: := IB.Value
;         Send("{ctrl down}h{ctrl up}")
;         Sleep(1500) ;
;         Send("{Tab}")
;         Send(pressKey("down"))
;         Send(pressKey("Enter"))
;         Send("{Tab 2}")
;         Loop qtd_loop{
;             Send(ctrl_enter) ;
;             Sleep(100)
;             Send(pressKey("down"))
;         }
;     }
