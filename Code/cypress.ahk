#Include "../configuracoes.ahk"
; #Requires AutoHotkey >=v2.0
; #SingleInstance

::aCyExpect::
::aCyExp::
{
    actualPrint := A_Clipboard
    A_Clipboard := "expect(resposta).to.be()"
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
::aCyEq:: {
    actualPrint := A_Clipboard
    A_Clipboard := "expect(resposta).to.equal()"
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
::aCyDEq:: {
    actualPrint := A_Clipboard
    A_Clipboard := "expect(resposta).to.deep.equal()"
    Send(ctrl("v"))
    Send("{Left}")
    A_Clipboard := actualPrint
}

::aCyShould::
::aCySh:: {
    actualPrint := A_Clipboard
    A_Clipboard := "should('', )"
    Send(ctrl("v"))
    Send("{Left}{Left}")
    A_Clipboard := actualPrint
}

::aCyShEq:: {
    actualPrint := A_Clipboard
    A_Clipboard := "should('to.equal', )"
    Send(ctrl("v"))
    Send("{Left}{Left}")
    A_Clipboard := actualPrint
}

::aCyShDeepEqual::
::aCyShDEqual::
::aCyShDEq:: {
    actualPrint := A_Clipboard
    A_Clipboard := "should('to.deep.equal', )"
    Send(ctrl("v"))
    Send("{Left}{Left}")
    A_Clipboard := actualPrint
}

::aCyIt:: {
    actualPrint := A_Clipboard
    A_Clipboard := "it('descricao_do_teste', function() {})"
    Send(ctrl("v"))
    Send("{Left}{Left}{Enter}")
    A_Clipboard := actualPrint
}

::aCyDescribe::
::aCyDesc:: {
    actualPrint := A_Clipboard
    A_Clipboard := "describe('descricao_do_describe', function() {})"
    Send(ctrl("v"))
    Send("{Left}{Left}{Enter}")
    A_Clipboard := actualPrint
}

::aCyRequest::
::aCyReq:: {
    previousPrint := A_Clipboard
    A_Clipboard := "cy.request({})"
    Send(ctrl("v"))
    Send("{Left}{Left}{Enter}")
    actualPrint := A_Clipboard
    A_Clipboard := "method: '',"
    Send(ctrl("v"))
    Send("{Enter}")
    actualPrint := A_Clipboard
    A_Clipboard := "url: '',"
    Send(ctrl("v"))
    Send("{Enter}")
    actualPrint := A_Clipboard
    A_Clipboard := "auth: {},"
    Send(ctrl("v"))
    Send("{Left}{Left}{Enter}")
    actualPrint := A_Clipboard
    A_Clipboard := "bearer: token"
    Send(ctrl("v"))

    A_Clipboard := previousPrint
}