#!/bin/bash

# 🔧 Configuração Recomendada do Git para Equipes Pequenas
# Execute este script para configurar seu Git com as melhores práticas

# Cores para output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_message() {
    echo -e "${2}${1}${NC}"
}

print_message "🔧 Configurando Git com boas práticas..." $BLUE

# Solicitar informações do usuário
read -p "📝 Digite seu nome completo: " USER_NAME
read -p "📧 Digite seu email: " USER_EMAIL

# Configurações básicas
print_message "👤 Configurando identidade..." $YELLOW
git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"

# Configurações de comportamento
print_message "⚙️ Configurando comportamento..." $YELLOW

# Branch padrão
git config --global init.defaultBranch main

# Comportamento do pull
git config --global pull.rebase true

# Comportamento do push
git config --global push.default current

# Auto-setup de tracking
git config --global branch.autosetupmerge always

# Cores no terminal
git config --global color.ui auto
git config --global color.branch auto
git config --global color.diff auto
git config --global color.status auto

# Editor padrão (VS Code)
git config --global core.editor "code --wait"

# Merge tool (VS Code)
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait $MERGED'

# Diff tool (VS Code)
git config --global diff.tool vscode
git config --global difftool.vscode.cmd 'code --wait --diff $LOCAL $REMOTE'

# Configurações de segurança
git config --global core.autocrlf input  # Para Unix/Mac
# git config --global core.autocrlf true  # Descomente para Windows

# Aliases úteis
print_message "🔗 Configurando aliases úteis..." $YELLOW

git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
git config --global alias.visual '!gitk'
git config --global alias.graph 'log --oneline --graph --decorate --all'
git config --global alias.cleanup '!git branch --merged | grep -v -E "(main|dev|master|\*)" | xargs -n 1 git branch -d'

# Configurações de performance
git config --global core.preloadindex true
git config --global core.fscache true
git config --global gc.auto 256

print_message "✅ Configuração concluída!" $GREEN
print_message "📋 Resumo das configurações:" $BLUE

echo ""
print_message "👤 Identidade:" $YELLOW
echo "   Nome: $USER_NAME"
echo "   Email: $USER_EMAIL"

echo ""
print_message "🔧 Aliases configurados:" $YELLOW
echo "   git st      → git status"
echo "   git co      → git checkout"
echo "   git br      → git branch"
echo "   git ci      → git commit"
echo "   git graph   → git log --oneline --graph --decorate --all"
echo "   git cleanup → remove branches mergeadas"

echo ""
print_message "🎯 Próximos passos:" $BLUE
echo "   1. Teste os aliases: git st"
echo "   2. Configure seu SSH: ssh-keygen -t ed25519 -C '$USER_EMAIL'"
echo "   3. Adicione a chave ao GitHub/GitLab"

print_message "🎉 Git configurado com sucesso!" $GREEN

