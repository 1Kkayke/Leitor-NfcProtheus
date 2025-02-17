#Include "Totvs.ch"

/*/{Protheus.doc} funcMain
@description responsável por chamar a função que executa o arquivo .exe que faz a leitura da NFC e retorna os dados para serem incluídos no sistema
@type function
@version Protheus 23.10 / 24.10
@author KAYKE.SILVA
@since 06/02/2025
@param objRotina, object, param_description
@param modelRotina, variant, param_description
@return variant, return_description
@obs Observações
/*/
User Function funcMain()
    Local aArea := FWGetArea()

    FWMsgRun(, {|oSay| LeitorNFC() }, "Processando", "Aguardando a leitura do card NFC")
    
    FWRestArea(aArea)
Return

/*/{Protheus.doc} LeitorNFC
@description Função que é responsável por executar o arquivo .exe que faz a leitura da NFC e retorna os dados para serem incluídos no sistema
@type function
@version protheus 23.10 / 24.10
@author KAYKE.SILVA
@since 06/02/2025
@param modelRotina, variant, param_description
@param objRotina, object, param_description
@return variant, return_description
@obs Observações
/*/
static Function LeitorNFC(modelRotina,objRotina)
    Local cRet          := ''
    Local cArquivo      := getTempPath()+"executavel_Teste.exe" //.exe que voce devera executar ( adicione o .EXE do python em alguma local da sua maquina e coloque o caminho aqui)
    Local cArq          := getTempPath()+"retnfc1.txt" // arquivo temporário que será lido pelo protheus
    Local aDados        := {}
    Local oJson         := JsonObject():new()

    WaitRun(cArquivo,0) // executa o arquivo .exe    
    
    // verifica se o arquivo foi gerado
    If file(cArq)   

        // lê o arquivo gerado
        cRet    := alltrim(memoread(cArq))
        
        oJson:FromJson(cRet)
        
        aDados  := oJson["dados"]

        if Valtype(aDados) <> 'U'
            if validaDadosNfc(aDados)
                FWAlertSuccess("Dados da NFC lidos com sucesso", "Cartão NFC")
            else
                FWAlertHelp("Card NFC não foi gravado", "Cartão NFC")
            endif
        else    
            FWAlertInfo("Não foi encontrado dados da NFC", "Cartão NFC")
        endif
    Else
        FwAlertInfo("Arquivo NFC não encontrada na pasta TEMP do usuario", "Cartão NFC")
    endif
Return

/*/{Protheus.doc} validaDadosNfc
description: Função que é responsável por validar os dados lidos da NFC
@type function
@version  Protheus 23.10 / 24.10
@author KAYKE.SILVA
@since 17/02/2025
@param aDados, array, param_description
@return variant, return_description
@obs Observações
/*/
static Function validaDadosNfc(aDados)
    Local lret := .F.
    
    /// CRIE SUA VALIDAÇÃO CUSTOMIZADA DENTRO DESSA FUNÇÃO ESTATICA



    /// CRIE SUA VALIDAÇÃO CUSTOMIZADA DENTRO DESSA FUNÇÃO ESTATICA

return lret
