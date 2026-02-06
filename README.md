# Projeto com LiteLLM, OpenWebUI e PostgreSQL via Docker Compose

Este projeto reúne três serviços principais — LiteLLM, OpenWebUI e PostgreSQL — facilitando o setup e a execução local de todos juntos via Docker Compose. Cada serviço tem sua própria configuração de ambiente através de arquivos `.env`.

## Estrutura de Pastas

```
├── litellm/
│   └── .env
├── openwebui/
│   └── .env
├── postgres/
│   └── .env
└── docker-compose.yml
```

## 1. Configuração dos arquivos .env

Antes de iniciar os containers, crie um arquivo `.env` dentro de cada pasta correspondente contendo as variáveis necessárias para aquele serviço.

### Exemplo do arquivo `litellm/.env`:
```
LITELLM_API_KEY=sua-chave-litellm
LITELLM_PORT=8000
# Adicione outras variáveis conforme documentação do LiteLLM
```

### Exemplo do arquivo `openwebui/.env`:
```
OPENWEBUI_SECRET=sua-chave-secreta
OPENWEBUI_PORT=8080
# Adicione outras variáveis conforme documentação do OpenWebUI
```

### Exemplo do arquivo `postgres/.env`:
```
POSTGRES_USER=meuusuario
POSTGRES_PASSWORD=senhasegura
POSTGRES_DB=meubanco
# Adicione outras variáveis conforme desejado
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