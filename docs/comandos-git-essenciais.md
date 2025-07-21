# ⚡ Comandos Git Essenciais para o Dia a Dia

Guia rápido com os comandos Git mais utilizados em equipes pequenas.

## 🚀 Comandos Básicos Diários

### Verificar Status
```bash
# Ver status dos arquivos
git status

# Versão resumida
git status -s
```

### Adicionar Arquivos
```bash
# Adicionar arquivo específico
git add arquivo.js

# Adicionar todos os arquivos modificados
git add .

# Adicionar apenas arquivos já rastreados
git add -u

# Adicionar interativamente
git add -p
```

### Fazer Commits
```bash
# Commit com mensagem
git commit -m "feat: adicionar nova funcionalidade"

# Commit com editor
git commit

# Adicionar e commitar arquivos já rastreados
git commit -am "fix: corrigir bug no formulário"

# Corrigir último commit
git commit --amend
```

### Sincronizar com Remoto
```bash
# Baixar mudanças
git pull

# Baixar mudanças com rebase
git pull --rebase

# Enviar mudanças
git push

# Enviar nova branch
git push -u origin nome-da-branch
```

## 🌿 Gerenciamento de Branches

### Listar Branches
```bash
# Branches locais
git branch

# Branches remotas
git branch -r

# Todas as branches
git branch -a

# Branches com último commit
git branch -v
```

### Criar e Trocar Branches
```bash
# Criar nova branch
git branch nova-branch

# Trocar de branch
git checkout dev

# Criar e trocar em um comando
git checkout -b feature/nova-funcionalidade

# Trocar para branch anterior
git checkout -
```

### Deletar Branches
```bash
# Deletar branch local (seguro)
git branch -d feature/concluida

# Forçar deleção local
git branch -D feature/abandonada

# Deletar branch remota
git push origin --delete feature/concluida
```

## 🔄 Merge e Rebase

### Merge
```bash
# Mergear branch na atual
git merge feature/nova-funcionalidade

# Merge sem fast-forward
git merge --no-ff feature/nova-funcionalidade

# Abortar merge em caso de conflito
git merge --abort
```

### Rebase
```bash
# Rebase da branch atual com main
git rebase main

# Rebase interativo (últimos 3 commits)
git rebase -i HEAD~3

# Continuar rebase após resolver conflitos
git rebase --continue

# Abortar rebase
git rebase --abort
```

## 📚 Histórico e Logs

### Ver Histórico
```bash
# Log básico
git log

# Log resumido
git log --oneline

# Log com gráfico
git log --oneline --graph --decorate --all

# Log de um arquivo específico
git log arquivo.js

# Log com diferenças
git log -p
```

### Ver Diferenças
```bash
# Diferenças não commitadas
git diff

# Diferenças no staging
git diff --staged

# Diferenças entre branches
git diff main..feature/nova

# Diferenças de um arquivo específico
git diff arquivo.js
```

## 🔍 Busca e Informações

### Buscar no Código
```bash
# Buscar texto no código
git grep "função"

# Buscar em commits
git log --grep="bug"

# Buscar quem modificou uma linha
git blame arquivo.js
```

### Informações de Commits
```bash
# Mostrar commit específico
git show abc123

# Mostrar arquivos modificados
git show --name-only abc123

# Mostrar estatísticas
git show --stat abc123
```

## 🛠️ Correções e Desfazer

### Desfazer Mudanças
```bash
# Descartar mudanças não commitadas
git checkout -- arquivo.js

# Descartar todas as mudanças
git checkout .

# Remover arquivo do staging
git reset HEAD arquivo.js

# Voltar ao último commit
git reset --hard HEAD
```

### Reverter Commits
```bash
# Reverter commit específico
git revert abc123

# Reverter múltiplos commits
git revert abc123..def456

# Reverter sem fazer commit automático
git revert --no-commit abc123
```

### Reset (Cuidado!)
```bash
# Reset suave (mantém mudanças)
git reset --soft HEAD~1

# Reset misto (padrão)
git reset HEAD~1

# Reset hard (perde mudanças!)
git reset --hard HEAD~1
```

## 🏷️ Tags

### Criar Tags
```bash
# Tag simples
git tag v1.0.0

# Tag anotada
git tag -a v1.0.0 -m "Versão 1.0.0"

# Tag em commit específico
git tag -a v1.0.0 abc123 -m "Versão 1.0.0"
```

### Gerenciar Tags
```bash
# Listar tags
git tag

# Mostrar informações da tag
git show v1.0.0

# Enviar tags para remoto
git push origin v1.0.0

# Enviar todas as tags
git push origin --tags

# Deletar tag local
git tag -d v1.0.0

# Deletar tag remota
git push origin --delete v1.0.0
```

## 🔧 Configuração

### Configurações Globais
```bash
# Configurar nome e email
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"

# Ver configurações
git config --list

# Ver configuração específica
git config user.name
```

### Aliases Úteis
```bash
# Configurar aliases
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.graph "log --oneline --graph --decorate --all"
```

## 🆘 Comandos de Emergência

### Recuperar Trabalho Perdido
```bash
# Ver histórico de referências
git reflog

# Recuperar commit "perdido"
git checkout abc123

# Criar branch do commit recuperado
git checkout -b recuperacao abc123
```

### Limpar Repositório
```bash
# Limpar arquivos não rastreados
git clean -f

# Limpar diretórios não rastreados
git clean -fd

# Ver o que seria removido
git clean -n
```

### Stash (Guardar Mudanças Temporariamente)
```bash
# Guardar mudanças
git stash

# Guardar com mensagem
git stash save "trabalho em progresso"

# Listar stashes
git stash list

# Aplicar último stash
git stash pop

# Aplicar stash específico
git stash apply stash@{1}

# Deletar stash
git stash drop stash@{1}
```

## 📋 Checklists Rápidos

### ✅ Antes de Commitar
```bash
git status          # Ver o que será commitado
git diff --staged    # Revisar mudanças
git commit -m "..."  # Commitar com mensagem clara
```

### ✅ Antes de Fazer Push
```bash
git pull --rebase    # Atualizar com remoto
git log --oneline    # Verificar commits
git push             # Enviar mudanças
```

### ✅ Ao Iniciar o Dia
```bash
git checkout main    # Ir para main
git pull origin main # Atualizar main
git checkout dev     # Ir para dev
git pull origin dev  # Atualizar dev
```

### ✅ Ao Finalizar Feature
```bash
git checkout dev     # Ir para dev
git pull origin dev  # Atualizar dev
git merge feature/x  # Mergear feature
git push origin dev  # Enviar para remoto
git branch -d feature/x  # Deletar branch local
```

## 🎯 Dicas de Produtividade

1. **Use aliases** para comandos frequentes
2. **Configure editor** para commits: `git config --global core.editor "code --wait"`
3. **Use .gitignore** para evitar commits acidentais
4. **Faça commits pequenos** e frequentes
5. **Sempre teste** antes de fazer push
6. **Use mensagens descritivas** nos commits
7. **Mantenha branches atualizadas** com a base

## 🚨 Comandos Perigosos (Use com Cuidado!)

```bash
# ⚠️ Perde mudanças não commitadas
git reset --hard

# ⚠️ Reescreve histórico
git rebase -i

# ⚠️ Força push (pode sobrescrever trabalho de outros)
git push --force

# ⚠️ Remove arquivos não rastreados
git clean -fd
```

## 📞 Quando Pedir Ajuda

- **Conflitos complexos**: Peça ajuda de um colega mais experiente
- **Histórico bagunçado**: Considere fazer backup antes de tentar corrigir
- **Push rejeitado**: Verifique se alguém fez push antes de você
- **Trabalho perdido**: Use `git reflog` ou peça ajuda imediatamente

---

*💡 Dica: Mantenha este guia sempre à mão e pratique os comandos regularmente!*

