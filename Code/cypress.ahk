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
    A_Clipboard := "should('equal', )"
    Send(ctrl("v"))
    Send("{Left}{Left}")
    A_Clipboard := actualPrint
}

::aCyShDeepEqual::
::aCyShDEqual::
::aCyShDEq:: {
    actualPrint := A_Clipboard
    A_Clipboard := "should('deep.equal', )"
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

::aCyBefore:: {
    actualPrint := A_Clipboard
    A_Clipboard := "before(function() {})"
    Send(ctrl("v"))
    Send("{Left}{Left}{Enter}")
    A_Clipboard := actualPrint
}

::aCyBeforeEach::
::aCyBEach:: {
    actualPrint := A_Clipboard
    A_Clipboard := "beforeEach(function() {})"
    Send(ctrl("v"))
    Send("{Left}{Left}{Enter}")
    A_Clipboard := actualPrint
}

::aCyAfter:: {
    actualPrint := A_Clipboard
    A_Clipboard := "after(function() {})"
    Send(ctrl("v"))
    Send("{Left}{Left}{Enter}")
    A_Clipboard := actualPrint
}

::aCyAfterEach::
::aCyAEach:: {
    actualPrint := A_Clipboard
    A_Clipboard := "afterEach(function() {})"
    Send(ctrl("v"))
    Send("{Left}{Left}{Enter}")
    A_Clipboard := actualPrint
}

::aCyLog:: {
    actualPrint := A_Clipboard
    A_Clipboard := "cy.log()"
    Send(ctrl("v"))
    Send("{Left}")

    A_Clipboard := actualPrint
}

::aCyLogV:: {
    actualPrint := A_Clipboard
    A_Clipboard := "cy.log('" . actualPrint . "', " . actualPrint . ")"
    Send(ctrl("v"))
    Send("{Left}")

    A_Clipboard := actualPrint
}

::aCyGet:: {
    actualPrint := A_Clipboard
    A_Clipboard := "cy.get('')"
    Send(ctrl("v"))
    Send("{Left}{Left}")

    A_Clipboard := actualPrint
}