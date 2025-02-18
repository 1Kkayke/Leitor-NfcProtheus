# 📡 Leitor NFC ACR122 integrado ao ERP Protheus

Este projeto tem como objetivo realizar a leitura de cartões NFC utilizando a leitora ACR122, integrando os dados capturados ao ERP Protheus. Com essa solução, é possível automatizar processos e melhorar a eficiência.

## 🔹 Funcionalidades

- ✅ Leitura e interpretação de cartões NFC via ACR122
- ✅ Comunicação fluída com o ERP Protheus
- ✅ Registro e validação dos dados do cartão
- ✅ Facilidade de integração com módulos do Protheus

## 🔧 Tecnologias utilizadas

- **Linguagem:** Python & Advpl
- **Bibliotecas:** nfcpy, pyinstaller
- **Banco de dados:** ORACLE

## 🚀 Como usar no Protheus

1. Conecte a leitora ACR122 ao computador
2. Execute a aplicação
3. Aproxime um cartão NFC da leitora
4. Os dados serão capturados e enviados ao ERP Protheus

## 🤖 Como instalar e configurar
  ### 🛠️Instalação Leitora ACR122
1. Foi necessário a instalação do driver ZADIG, sendo ele utilizado para atualizar o driver do usb para a leitora ACR122.
   Tutorial para a leitora ACR122:

![image](https://github.com/user-attachments/assets/05f693c4-0d78-46b9-a630-c5d351d38631)

   - Selecione para listar todos os drivers

![image](https://github.com/user-attachments/assets/152b37ce-3294-43b2-9f56-558d0e79ea96)
   - Clique no driver da leitora

![image](https://github.com/user-attachments/assets/97f556f0-a26b-41da-8de1-ada09e88b12f)
   - Por fim, instale o driver da mesma

![image](https://github.com/user-attachments/assets/08cfdda5-42da-43f5-a141-9c82e225fafc)

### 🐍 Python
O Principal objetivo do python foi ser responsavel por criar um executavel(.exe) para que o protheus consiga usar ele, e assim após o uso, o python gera um arquivo temporario na pasta Temp da maquina do usuario. O arquivo temporario que é gerado, possui encapsulado um JSON já formatado.
  - Exemplo do JSON de retorno:
    ```
    {
    "ID": "04433f7ebd2a81",
    "TYPE": "Type2Tag",
    "DADOS": {
        "HASH_CODIGO_UNICO": "TESTEHASHCODIGOUNICO83215012",
        "PLACA_CAMINHAO": "PLCTEST01",
        "CPF": "3819301841",
        "TIPO_DESTINO": "",
        "DESTINO": "1003052",
        "DATA_EMISSAO": "20250211",
        "HORA_EMISSAO": "15:46",
        "ITENS": [
            {
                "CODIGO_PRODUTO": "000001",
                "DESCRICAO": "PRODUTO_TESTE",
                "TIPO": "PA",
            }
        ]
    }
    ```
### ⚙️Protheus
O Protheus é responsável por executar o .exe que o Python gerou, utilizando a função [WaitRun](https://tdn.totvs.com/display/tec/WaitRun]). Assim após a execução, é feito a leitura de um arquivo .txt que está alocado na pasta temporaria da maquina que está usando. Sendo possivel assim, as tratativas que você deseja fazer, incluir os dados do .txt em campos, em rotinas, ou utilizar para o que bem entender.
## 📌 Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.

## 📄 Licença

Este Projeto foi criado e desenvolvido por Kayke Laurindo Ferreira da Silva.
O uso dele é gratuito, feito para ajudar comunidade de desenvolvedores Advpl & analistas TOTVS Protheus

---
