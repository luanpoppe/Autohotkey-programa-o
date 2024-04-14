#Include "../configuracoes.ahk"
; #Requires AutoHotkey >=v2.0
; #SingleInstance


::aDjHtml:: {
    actualPrint := A_Clipboard
    pasteContent := "{%  %}"
    A_Clipboard := pasteContent
    Send("{CtrlDown}v{CtrlUp}")
    A_Clipboard := actualPrint
    Send("{Left}{Left}{Left}")
}




;; Comandos Django no Terminal:

::aDjStartProject::
    ::aDjSProject:: 
    ::aDjSPr:: {
    actualPrint := A_Clipboard
    pasteContent := "django-admin startproject setup . "
    A_Clipboard := pasteContent
    Send("{CtrlDown}v{CtrlUp}")
    A_Clipboard := actualPrint
}

::aDjPyM::
    ::aDjPyManage:: {
    actualPrint := A_Clipboard
    pasteContent := "python manage.py "
    A_Clipboard := pasteContent
    Send("{CtrlDown}v{CtrlUp}")
    A_Clipboard := actualPrint
}

::aDjRun::
    ::aDjRunServer::
    ::aDjRServer:: {
    actualPrint := A_Clipboard
    pasteContent := "python manage.py runserver"
    A_Clipboard := pasteContent
    Send("{CtrlDown}v{CtrlUp}")
    A_Clipboard := actualPrint
}

::aDjStartApp::
    ::aDjSApp::
    ::aDjStart:: {
        actualPrint := A_Clipboard
    pasteContent := "python manage.py startapp MUDAR_PARA_O_NOME_DO_APP"
    A_Clipboard := pasteContent
    Send("{CtrlDown}v{CtrlUp}")
    A_Clipboard := actualPrint
}

::aDjMakeMigrations::
    ::aDjMMigrations::
    ::aDjMakeMig::
    ::aDjMMig:: {
        actualPrint := A_Clipboard
        pasteContent := "python manage.py makemigrations"
        A_Clipboard := pasteContent
        Send("{CtrlDown}v{CtrlUp}")
        A_Clipboard := actualPrint

}

::aDjMigrate:: 
    ::aDjMig:: {
    actualPrint := A_Clipboard
    pasteContent := "python manage.py migrate"
    A_Clipboard := pasteContent
    Send("{CtrlDown}v{CtrlUp}")
    A_Clipboard := actualPrint
}

::aDjCollectStatic:: 
    ::aDjCStatic:: {
    actualPrint := A_Clipboard
    pasteContent := "python manage.py collectstatic"
    A_Clipboard := pasteContent
    Send("{CtrlDown}v{CtrlUp}")
    A_Clipboard := actualPrint
}

::aDjCSUser::
    ::aDjCreateSuperUser:: {
    actualPrint := A_Clipboard
    pasteContent := "python manage.py createsuperuser"
    A_Clipboard := pasteContent
    Send("{CtrlDown}v{CtrlUp}")
    A_Clipboard := actualPrint
}