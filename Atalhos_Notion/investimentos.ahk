; Configurações:
#Include "../configuracoes.ahk"

; Index n --> Notion | Index ahk --> autohotkey 

#HotIf WinActive("Chrome")
;
::nTViewBt:: ; nTradingViewBackTest | nTViewBackTest | nTViewBackTests | nTViewBTest | nTViewBTests
    ::nTradingViewBackTest:: ; 
    ::nTViewBackTest::
    ::nTViewBackTests::
    ::nTViewBTest::
    ::nTViewBTests:: {
    abrir_site("https://www.notion.so/Trading-View-Backtests-c4ca4ec57d3441d39787cac3008f5aa2")
    }
::nProfitResumo:: ; nProfit | nRProfit | nProfitResumos | nResumosProfit | nResumoProfit 
    ::nProfit::
    ::nRProfit::
    ::nProfitResumos::
    ::nResumosProfit::
    ::nResumoProfit:: {
    abrir_site("https://www.notion.so/Profit-Resumos-f300af4e12944cc9b0ca3389988caf95")
    }
::nProfitBacktest:: ; nProfitBacktests | nProfitBt | nBtProfit | nBacktestProfit 
    ::nProfitBacktests::
    ::nProfitBt::
    ::nBtProfit::
    ::nBacktestProfit :: {
    abrir_site("https://www.notion.so/Profit-Backtests-c0241bf72a0e42e684ff4672d332c5d1")
    }
::nNCorretagem:: ; nirenda
    ::nirenda:: {
    abrir_site("https://www.notion.so/Notas-de-Corretagem-2e029e7c1dd5464f8e18e15bd1dfc3a8")
    }
::nInvestimentos:: {
    abrir_site("https://www.notion.so/Investimentos-9281ec4b41c2435a8014ec31730fd1ee")
    }
::nResumoInvestimentos:: ; nrinvestimentos | nresumosinvestimentos | nrinvest
    ::nresumosinvestimentos::
    ::nrinvestimentos::
    ::nrinvest:: {
    abrir_site("https://www.notion.so/Resumo-Investimentos-520921a24df844968799206827687e03")
    }
::nTradingView:: ; nTView |
    ::nTView:: {
    abrir_site("https://www.notion.so/Trading-View-Pine-Script-dda07f485907409ea16ce49fda57d04e")
    }
;