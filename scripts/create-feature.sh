#!/bin/bash

# 🚀 Script para Criar Branch de Feature
# Uso: ./scripts/create-feature.sh nome-da-feature

set -e  # Parar em caso de erro

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Função para imprimir mensagens coloridas
print_message() {
    echo -e "${2}${1}${NC}"
}

# Verificar se o nome da feature foi fornecido
if [ -z "$1" ]; then
    print_message "❌ Erro: Nome da feature é obrigatório" $RED
    print_message "📖 Uso: ./scripts/create-feature.sh nome-da-feature" $YELLOW
    print_message "📖 Exemplo: ./scripts/create-feature.sh login-oauth" $YELLOW
    exit 1
fi

FEATURE_NAME="$1"
BRANCH_NAME="feature/$FEATURE_NAME"

print_message "🚀 Criando branch de feature: $BRANCH_NAME" $BLUE

# Verificar se estamos em um repositório Git
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    print_message "❌ Erro: Não estamos em um repositório Git" $RED
    exit 1
fi

# Verificar se a branch já existe
if git show-ref --verify --quiet refs/heads/$BRANCH_NAME; then
    print_message "❌ Erro: Branch $BRANCH_NAME já existe" $RED
    exit 1
fi

# Salvar branch atual
CURRENT_BRANCH=$(git branch --show-current)
print_message "📍 Branch atual: $CURRENT_BRANCH" $YELLOW

# Ir para dev e atualizar
print_message "🔄 Atualizando branch dev..." $BLUE
git checkout dev
git pull origin dev

# Criar e mudar para nova branch
print_message "🌿 Criando branch $BRANCH_NAME..." $BLUE
git checkout -b $BRANCH_NAME

# Fazer push inicial da branch
print_message "📤 Publicando branch no repositório remoto..." $BLUE
git push -u origin $BRANCH_NAME

print_message "✅ Branch $BRANCH_NAME criada com sucesso!" $GREEN
print_message "🎯 Próximos passos:" $YELLOW
print_message "   1. Desenvolva sua funcionalidade" $YELLOW
print_message "   2. Faça commits regulares" $YELLOW
print_message "   3. Execute: git push origin $BRANCH_NAME" $YELLOW
print_message "   4. Abra um Pull Request quando pronto" $YELLOW

# Mostrar status atual
print_message "📊 Status atual:" $BLUE
git status --short

