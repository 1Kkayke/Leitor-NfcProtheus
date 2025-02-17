import json
import nfc  # Supondo que você tenha a biblioteca NFC instalada
import os


def ler_nfc():
    dispositivo = nfc.ContactlessFrontend('usb')  # Ajuste conforme necessário
    tag = dispositivo.connect(rdwr={'on-connect': lambda tag: False})

    # Captura os dados corretamente
    raw_dados = tag.ndef.records[0]._text

    # Tenta converter 'dados' para um dicionário, caso seja um JSON em string
    try:
        dados_json = json.loads(raw_dados)  # Converte a string JSON para um dicionário
    except json.JSONDecodeError:
        dados_json = raw_dados  # Se não for JSON, mantém como string normal

    dados_tag = {
        "id": tag.identifier.hex(),
        "tipo": tag.type,
        "dados": dados_json  # Agora sem barras invertidas
    }

    return dados_tag


def converter_para_json(dados):
    try:
        json_data = json.dumps(dados, indent=4, ensure_ascii=False)  # JSON bem formatado
        return json_data
    except Exception as e:
        return f"Erro ao converter para JSON: {e}"


def salvar_em_arquivo(json_dados):
    try:
        temp_path = os.path.join(os.getenv('TEMP'), 'retnfc1.txt')

        with open(temp_path, 'w', encoding='utf-8') as arquivo:
            arquivo.write(json_dados)

        print(f"Dados salvos com sucesso em: {temp_path}")
    except Exception as e:
        print(f"Erro ao salvar o arquivo: {e}")


# Exemplo de uso
dados = ler_nfc()
json_dados = converter_para_json(dados)
print(json_dados)
salvar_em_arquivo(json_dados)
