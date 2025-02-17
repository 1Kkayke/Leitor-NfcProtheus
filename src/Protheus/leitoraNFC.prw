#Include "Totvs.ch"

/*/{Protheus.doc} funcMain
@description respons�vel por chamar a fun��o que executa o arquivo .exe que faz a leitura da NFC e retorna os dados para serem inclu�dos no sistema
@type function
@version Protheus 23.10 / 24.10
@author KAYKE.SILVA
@since 06/02/2025
@param objRotina, object, param_description
@param modelRotina, variant, param_description
@return variant, return_description
@obs Observa��es
/*/
User Function funcMain()
    Local aArea := FWGetArea()

    FWMsgRun(, {|oSay| LeitorNFC() }, "Processando", "Aguardando a leitura do card NFC")
    
    FWRestArea(aArea)
Return

/*/{Protheus.doc} LeitorNFC
@description Fun��o que � respons�vel por executar o arquivo .exe que faz a leitura da NFC e retorna os dados para serem inclu�dos no sistema
@type function
@version protheus 23.10 / 24.10
@author KAYKE.SILVA
@since 06/02/2025
@param modelRotina, variant, param_description
@param objRotina, object, param_description
@return variant, return_description
@obs Observa��es
/*/
static Function LeitorNFC(modelRotina,objRotina)
    Local cRet          := ''
    Local cArquivo      := getTempPath()+"executavel_Teste.exe" //.exe que voce devera executar ( adicione o .EXE do python em alguma local da sua maquina e coloque o caminho aqui)
    Local cArq          := getTempPath()+"retnfc1.txt" // arquivo tempor�rio que ser� lido pelo protheus
    Local aDados        := {}
    Local oJson         := JsonObject():new()

    WaitRun(cArquivo,0) // executa o arquivo .exe    
    
    // verifica se o arquivo foi gerado
    If file(cArq)   

        // l� o arquivo gerado
        cRet    := alltrim(memoread(cArq))
        
        oJson:FromJson(cRet)
        
        aDados  := oJson["dados"]

        if Valtype(aDados) <> 'U'
            if validaDadosNfc(aDados)
                FWAlertSuccess("Dados da NFC lidos com sucesso", "Cart�o NFC")
            else
                FWAlertHelp("Card NFC n�o foi gravado", "Cart�o NFC")
            endif
        else    
            FWAlertInfo("N�o foi encontrado dados da NFC", "Cart�o NFC")
        endif
    Else
        FwAlertInfo("Arquivo NFC n�o encontrada na pasta TEMP do usuario", "Cart�o NFC")
    endif
Return

/*/{Protheus.doc} validaDadosNfc
description: Fun��o que � respons�vel por validar os dados lidos da NFC
@type function
@version  Protheus 23.10 / 24.10
@author KAYKE.SILVA
@since 17/02/2025
@param aDados, array, param_description
@return variant, return_description
@obs Observa��es
/*/
static Function validaDadosNfc(aDados)
    Local lret := .F.
    
    /// CRIE SUA VALIDA��O CUSTOMIZADA DENTRO DESSA FUN��O ESTATICA



    /// CRIE SUA VALIDA��O CUSTOMIZADA DENTRO DESSA FUN��O ESTATICA

return lret
