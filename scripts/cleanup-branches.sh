#!/bin/bash

# 🧹 Script para Limpeza de Branches
# Remove branches locais que já foram mergeadas

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

print_message "🧹 Iniciando limpeza de branches..." $BLUE

# Verificar se estamos em um repositório Git
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    print_message "❌ Erro: Não estamos em um repositório Git" $RED
    exit 1
fi

# Atualizar referências remotas
print_message "🔄 Atualizando referências remotas..." $YELLOW
git remote prune origin

# Ir para main para fazer a limpeza
print_message "📍 Mudando para branch main..." $YELLOW
git checkout main
git pull origin main

# Listar branches mergeadas (exceto main, dev e a atual)
print_message "🔍 Procurando branches mergeadas..." $BLUE
MERGED_BRANCHES=$(git branch --merged main | grep -v -E "(main|dev|\*)" | sed 's/^[ \t]*//' || true)

if [ -z "$MERGED_BRANCHES" ]; then
    print_message "✅ Nenhuma branch para limpar!" $GREEN
    exit 0
fi

print_message "📋 Branches que serão removidas:" $YELLOW
echo "$MERGED_BRANCHES" | while read branch; do
    if [ ! -z "$branch" ]; then
        print_message "   - $branch" $YELLOW
    fi
done

# Confirmar remoção
echo ""
read -p "🤔 Confirma a remoção dessas branches? (y/N): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    print_message "🗑️ Removendo branches..." $BLUE
    
    echo "$MERGED_BRANCHES" | while read branch; do
        if [ ! -z "$branch" ]; then
            print_message "   Removendo: $branch" $YELLOW
            git branch -d "$branch" || print_message "   ⚠️ Falha ao remover: $branch" $RED
        fi
    done
    
    print_message "✅ Limpeza concluída!" $GREEN
else
    print_message "❌ Limpeza cancelada pelo usuário" $YELLOW
fi

# Mostrar branches restantes
print_message "📊 Branches locais restantes:" $BLUE
git branch --list

