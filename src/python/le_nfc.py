import json
import nfc
import os

def ler_nfc():
    try:
        clf = nfc.ContactlessFrontend('usb')  # abre leitor USB
    except OSError as e:
        print(f'Erro ao abrir o leitor NFC (usb): {e}')
        return None

    try:
        tag = clf.connect(rdwr={'on-connect': lambda tag: False})
        raw_dados = tag.ndef.records[0]._text

        try:
            dados_json = json.loads(raw_dados)
        except json.JSONDecodeError:
            dados_json = raw_dados

        dados_tag = {
            "id": tag.identifier.hex(),
            "tipo": str(tag.type),
            "dados": dados_json
        }
        return dados_tag
    finally:
        clf.close()

def converter_para_json(dados):
    try:
        return json.dumps(dados, indent=4, ensure_ascii=False)
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

if __name__ == "__main__":
    dados = ler_nfc()
    if dados is not None:
        json_dados = converter_para_json(dados)
        print(json_dados)
        salvar_em_arquivo(json_dados)
