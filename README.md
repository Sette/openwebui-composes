# Projeto com LiteLLM, OpenWebUI e PostgreSQL via Docker Compose

Este projeto reúne três serviços principais — LiteLLM, OpenWebUI e PostgreSQL — facilitando o setup e a execução local de todos juntos via Docker Compose. Cada serviço tem sua própria configuração de ambiente através de arquivos `.env`.

## Estrutura de Pastas

```
├── litellm/
│   └── .env
├── openweb/
│   └── .env
├── postgres/
│   └── .env
└── docker-compose.yml
```

## 1. Configuração dos arquivos .env

Antes de iniciar os containers, crie um arquivo `.env` dentro de cada pasta correspondente contendo as variáveis necessárias para aquele serviço.

### Exemplo do arquivo `litellm/.env`:
```
LITELLM_API_KEY="sua-chave-litellm"
LITELLM_PORT=7000
LITELLM_MASTER_KEY="sk-1234"
DATABASE_URL="postgresql://llmproxy:dbpassword9090@db:5432/litellm"
STORE_MODEL_IN_DB="True"
```

### Exemplo do arquivo `openweb/.env`:
```
WEBUI_SECRET_KEY=sua-chave-secreta
PORT=8080
OPENWEBUI_DB_NAME=openwebui
DATABASE_URL_OPENWEBUI=postgresql://llmproxy:sua_senha_secreta@host.docker.internal:5432/openwebui
```

### Exemplo do arquivo `postgres/.env`:
```
POSTGRES_USER=llmproxy
POSTGRES_PASSWORD=sua_senha_secreta
POSTGRES_DB=litellm
# Adicione outras variáveis conforme desejado
```

### Crie a database do openwebui
```bash
docker exec -it litellm_db psql -U llmproxy -d litellm -c "CREATE DATABASE openwebui;"
```

> **Importante:**  
> - Não compartilhe os arquivos `.env` em repositórios públicos!  
> - Personalize o conteúdo das variáveis conforme suas necessidades.

## 2. Subindo o ambiente com Docker Compose

Com todos os `.env` criados, basta executar o comando abaixo na raiz do projeto (onde está o arquivo `docker-compose.yml`):

Para subir o ambiente e ver os logs no terminal:
```bash
docker compose up
```

Para rodar os serviços em modo "detached" (em segundo plano):
```bash
docker compose up -d
```

Para parar e remover todos os containers, utilize:
```bash
docker compose down
```

## 3. Observações

- Certifique-se de ter o [Docker](https://docs.docker.com/get-docker/) e o [Docker Compose](https://docs.docker.com/compose/) instalados na sua máquina.
- Consulte a documentação oficial de cada serviço para definir as variáveis de ambiente específicas ou para quaisquer configurações avançadas.

---

Sinta-se à vontade para adaptar este README conforme as particularidades do seu projeto!
