# Projeto Robot Framework - Desafio Site Saucedemo

Estrutura criada para automatizar os cenários do Desafio 2 usando o site: https://www.saucedemo.com

Testes disponíveis em `tests/saucedemo_tests.robot`.

Clonar o projeto

# 1. Clonar o projeto

No terminal, execute:

```bash
git clone https://github.com/joelrocha68/projeto-saucedemo.git
```

# 2. Instalar dependências:

Antes de rodar os testes, certifique-se de ter instalado:

### Python 3.8+  
Verifique sua versão com:

```bash
python3 --version
```

### pip atualizado

```bash
pip install --upgrade pip
```

### Google Chrome

```bash
google-chrome --version
```
### Dependências

Na raiz do projeto, execute:

```bash
pip install -r requirements.txt
```
O arquivo `requirements.txt` inclui as dependências necessárias, como:

- `robotframework`
- `robotframework-seleniumlibrary`
- `selenium`

# 3. Rodar testes:

Rodar todos os testes e salvar evidências em `results/`

```bash
robot -d results tests/
```

Observações:
- As credenciais e URL ficam no arquivo `variables.robot`.