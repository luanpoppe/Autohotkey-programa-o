; Configurações:
#Include "../configuracoes.ahk"

; Index n --> Notion | Index ahk --> autohotkey 

#HotIf WinActive("Chrome")
;
::nMedicos:: ; nconsultas 
    ::nconsultas:: {
    abrir_site("https://www.notion.so/M-dicos-Consultas-70e16a62495b4f6686654457ad69369e")
    }
::nPrMed:: ; nproxresumosmed
    ::nproxresumosmed:: {
    abrir_site("https://www.notion.so/Pr-ximos-Resumos-Medicina-8d5b99f343bc49d3bb5ea361b451cfc6")
    }
::nSumarioMedicina:: ; nSumarioMed | nSumarioMed | nSMedicina 
    ::nSumarioMed::
    ::nSMedicina::
    ::nSMed:: {
    abrir_site("https://www.notion.so/Sum-rio-Medicina-a9ee1a1d1bb24cdfa41ea870ebf2dc7c")
    }
::nTrabalhoPsf:: ; ntpsf 
    ::nTPsf:: {
    abrir_site("https://www.notion.so/Trabalho-PSF-R-pidos-2589f7c6b4c94438a724cacde623fdb8")
    }
;
; 