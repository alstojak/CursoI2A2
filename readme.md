# 📘 README – Projeto de Análise de Notas Fiscais com n8n e MySQL

Este projeto permite importar dados de notas fiscais a partir de arquivos CSV e realizar consultas por meio de linguagem natural, utilizando um modelo LLM integrado ao n8n.

---

## 🧰 Pré-requisitos

- [Node.js](https://nodejs.org/) (versão LTS recomendada)
- [n8n](https://n8n.io/) instalado globalmente ou via Docker
- MySQL instalado e acessível localmente
- Git (opcional, para clonar o repositório)

---

## 🚀 Instalação do n8n (modo simples)

### Via NPM:
```bash
npm install n8n -g
n8n
```

> O n8n ficará acessível em `http://localhost:5678`

---

## 💠 Preparação do Banco de Dados

Antes de tudo, crie uma credencial no n8n para conectar ao seu MySQL.

**Credencial MySQL:**
- Host: `localhost`
- Porta: `3306` (ou sua porta configurada)
- Usuário: `root` (ou outro usuário com permissão)
- Senha: `********`
- Base de dados: `notas` *(ou outra, desde que configurada nos nodes)*

> ✅ As tabelas serão criadas automaticamente, se não existirem.

---

## 📦 Importação dos Workflows

1. Faça download do arquivo `fluxo-completo.json` do repositório.
2. No n8n, clique no menu `...` no canto superior e selecione `Import from file`.
3. Selecione o JSON exportado e carregue o fluxo completo.

---

## ▶️ Execução do Projeto

### 1. Iniciar o n8n:
```bash
n8n
```

### 2. Rodar o fluxo de carga de dados:

Utilize o seguinte comando `curl` com o arquivo `.zip` contendo os CSVs de notas e itens:

```bash
curl -X POST http://localhost:5679/webhook/importa-dados \
  -H "Content-Type: multipart/form-data" \
  -F "arquivo=@caminho/para/seu/arquivo.zip"
```

### 3. Fazer perguntas ao agente:

Após importar os dados, você pode enviar perguntas com linguagem natural:

```bash
curl -X POST http://localhost:5679/webhook/pergunta-sql \
  -H "Content-Type: application/json" \
  -d "{\"pergunta\": \"Qual o número da nota com maior valor?\"}"
```

---

## 📄 Testes em Lote com PowerShell (opcional)

Se quiser rodar perguntas em sequência, use o script `perguntas.ps1` incluído no repositório.

---

## 📁 Estrutura do Repositório

```
/
├── fluxo-completo.json         # Workflow único exportado do n8n
├── perguntas.ps1               # Script opcional para perguntas em sequência
├── 202401_NFs.zip              # Arquivo com os CSVs de teste
├── README.md                   # Este arquivo técnico
└── Relatorio-Projeto.pdf       # Documento com explicações do projeto
```

---

## ✅ Observações

- O projeto pode ser executado completamente em ambiente local.
- O modelo LLM (como LLaMA 3) foi integrado via HTTP Request no n8n e **não exige credenciais extras** neste teste.
- As tabelas são automaticamente criadas se não existirem.
- Os dados anteriores são limpos a cada nova carga para garantir reprodutibilidade.

---

## 📬 Suporte

Em caso de dúvidas, consulte o `Relatorio-Projeto.pdf` ou entre em contato.

---
