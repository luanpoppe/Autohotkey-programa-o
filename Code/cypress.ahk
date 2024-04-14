#Include "../configuracoes.ahk"
; #Requires AutoHotkey >=v2.0
; #SingleInstance

::aCyExpect::
::aCyExp::
{
    actualPrint := A_Clipboard
    A_Clipboard := "expect(valor).to.be()"
    Send(ctrl("v"))
    Send("{Left}")
    A_Clipboard := actualPrint
}

::aCyExpectToEqual::
::aCyExpToEqual::
::aCyEToEqual::
::aCyExpEqual::
::aCyEEqual::
::aCyEEq::
::aCyEq::
{
    actualPrint := A_Clipboard
    A_Clipboard := "expect(valor).to.equal()"
    Send(ctrl("v"))
    Send("{Left}")
    A_Clipboard := actualPrint
}

::aCyExpectToDeepEqual::
::aCyExpToDeepEqual::
::aCyEToDeepEqual::
::aCyExpTDEqual::
::aCyExpDEqual::
::aCyETDEqual::
::aCyEDEqual::
::aCyEDEq::
::aCyDEq::
{
    actualPrint := A_Clipboard
    A_Clipboard := "expect(valor).to.deep.equal()"
    Send(ctrl("v"))
    Send("{Left}")
    A_Clipboard := actualPrint
}


::aCyShould::
::aCySh:: {
    actualPrint := A_Clipboard
    A_Clipboard := "should('', '')"
    Send(ctrl("v"))
    Send("{Left}{Left}")

    A_Clipboard := actualPrint
}

::aCyShEq:: {

}

::aCyIt:: {
    actualPrint := A_Clipboard
    A_Clipboard := "it('descricao_do_teste', () => {})"
    Send(ctrl("v"))
    Send("{Left}{Left}{Enter}")

    A_Clipboard := actualPrint
}