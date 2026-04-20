#!/bin/bash

# Inicia o servidor Ollama em segundo plano
/bin/ollama serve &
pid=$!

# Aguarda o servidor estar pronto
echo "Aguardando Ollama iniciar..."
sleep 10
echo "Ollama está pronto!"

# Função para baixar modelos de forma organizada
pull_model() {
    echo "Verificando/Baixando modelo: $1..."
    if ollama pull "$1"; then
        echo "✅ Sucesso ao baixar $1"
    else
        echo "❌ Erro ao baixar $1. Pulando para o próximo..."
    fi
}

# --- Lista de Modelos ---

# 1. Modelos Gerais e Chat
#pull_model "llama3"


# 2. Modelos Qwen (Atualmente os melhores para código)
# O modelo padrão (que geralmente é o 7b instruct)
#pull_model "qwen2.5-coder"
pull_model "qwen2.5-coder:1.5b" # Levíssimo e excelente para tarefas simples
#pull_model "qwen3-next"
#pull_model "qwen3-coder-next"
pull_model "qwen3.5:9b" # Versão mais poderosa, mas pesada
#pull_model "qwen3.5:27b" # Versão completa, mais pesada mas mais poderosa
#pull_model "qwen3-coder:30b" # Versão especializada para código, mais pesada mas extremamente poderosa
pull_model "qooba/qwen3-coder-30b-a3b-instruct:q3_k_m" # Versão especializada para código, mais leve que a oficial, excelente para tarefas de preenchimento e autocompletar

# 3. Modelos DeepSeek
pull_model "deepseek-coder-v2:lite" # Excelente para lógica complexa
#pull_model "deepseek-coder-v2:16b" # Versão completa, mais pesada mas mais poderosa

# 4. Modelos Especializados em Preenchimento (FIM - Fill In the Middle)
#pull_model "starcoder2:3b"
#pull_model "stable-code:3b"     # Levíssimo e focado em autocomplete

# 5. Modelos do google 
#pull_model "gemma4" # Modelo leve e eficiente para código, excelente para tarefas simples
#pull_model "gemma4:26b" # Modelo completo, mais pesado mas extremamente poderoso para código, especialmente para tarefas complexas
#pull_model "codegemma:2b" # Modelo especializado para código, leve e eficiente, excelente para tarefas de preenchimento e autocompletar

# 6 Modelos Ministral 
#pull_model "ministral-3" # Modelo leve e eficiente para código, excelente para tarefas simples
#pull_model "ministral-3:14b" # Modelo completo, mais pesado mas extremamente

# Modelos devstral
#pull_model "devstral-small-2" # Modelo leve e eficiente para código, excelente para tarefas simples

echo "Configuração concluída com sucesso!"

# Mantém o processo principal rodando
wait $pid