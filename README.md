# 🚀 Boas Práticas de Git para Equipes Pequenas

> **Guia prático e direto para implementar boas práticas de Git em equipes de 5 a 10 pessoas**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

## 📋 Sobre este Guia

Este repositório serve como **guia prático e tutorial** para implementar boas práticas de Git em equipes pequenas de desenvolvimento. Foi criado com foco na **simplicidade**, **praticidade** e **facilidade de implementação** para times que querem melhorar seus processos sem complexidade desnecessária.

### 🎯 Para quem é este guia?
- **Equipes de 5 a 10 desenvolvedores**
- **Startups e empresas pequenas**
- **Times que querem processos simples mas eficazes**
- **Desenvolvedores que buscam padronização**
- **Líderes técnicos implementando boas práticas**

---

# 📚 PARTE 1: CONCEITO E TEORIA

## 🧠 Por que Boas Práticas de Git?

### Problemas Comuns em Equipes Pequenas
- **Conflitos de merge constantes** entre desenvolvedores
- **Histórico confuso** com commits mal descritos
- **Dificuldade para rastrear** quando bugs foram introduzidos
- **Código perdido** ou sobrescrito acidentalmente
- **Falta de padronização** entre membros da equipe
- **Deploy acidental** de código não testado

### Benefícios das Boas Práticas
- ✅ **Histórico limpo e rastreável** do desenvolvimento
- ✅ **Redução de conflitos** e problemas de integração
- ✅ **Facilita code review** e colaboração
- ✅ **Melhora a qualidade** do código entregue
- ✅ **Acelera onboarding** de novos desenvolvedores
- ✅ **Reduz bugs** em produção

## 🌿 Conceitos Fundamentais

### Estrutura de Branches Simplificada

```
main     ← Produção (sempre estável)
  ↑
dev      ← Desenvolvimento (integração)
  ↑
feature/ ← Novas funcionalidades
hotfix/  ← Correções urgentes
```

**Explicação:**
- **main**: Código em produção, sempre funcional
- **dev**: Integração contínua, onde features são testadas juntas
- **feature/**: Desenvolvimento isolado de funcionalidades
- **hotfix/**: Correções críticas que vão direto para produção

### Anatomia de um Commit Perfeito

```
tipo(escopo): descrição clara em até 50 caracteres

Explicação opcional do que foi feito e por quê.
Pode ter múltiplas linhas se necessário.

Closes #123
```

**Tipos principais:**
- `feat:` Nova funcionalidade
- `fix:` Correção de bug
- `docs:` Documentação
- `style:` Formatação (sem mudança de lógica)
- `refactor:` Refatoração de código
- `test:` Adição ou correção de testes
- `chore:` Tarefas de manutenção

### Pull Request (PR) Eficaz

Um PR deve responder:
- **O quê** foi alterado?
- **Por quê** a mudança é necessária?
- **Como** testar a mudança?
- **Qual** o impacto da mudança?

### Nomenclatura Consistente

**Repositórios:**
```
[tipo]-[projeto]-[contexto]
```
Exemplos: `web-loja-principal`, `api-usuarios`, `mobile-app-cliente`

**Branches:**
```
[tipo]/[descrição-clara]
```
Exemplos: `feature/login-oauth`, `fix/erro-pagamento`, `hotfix/falha-critica`

---

# 🛠️ PARTE 2: COMO APLICAR

## ⚙️ Configuração Inicial (15 minutos)

### 1. Configurar Git Individual

```bash
# Configurações básicas
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@empresa.com"

# Configurações recomendadas
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global push.default current
git config --global color.ui auto

# Editor padrão (VS Code)
git config --global core.editor "code --wait"

# Aliases úteis
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.graph "log --oneline --graph --decorate --all"
```

### 2. Configurar Repositório

```bash
# Criar branches principais
git checkout -b main
git checkout -b dev

# Proteger branches (via interface GitHub/GitLab)
# - Exigir Pull Request reviews
# - Exigir status checks
# - Restringir push direto
```

### 3. Arquivo .gitignore Básico

```gitignore
# Dependências
node_modules/
vendor/

# Arquivos de build
dist/
build/
*.min.js
*.min.css

# Ambientes
.env
.env.local
.env.production

# Logs
*.log
logs/

# Cache
.cache/
.tmp/

# IDEs
.vscode/
.idea/
*.swp

# OS
.DS_Store
Thumbs.db
```

## 🔄 Fluxo de Trabalho Diário

### Desenvolvedor: Iniciar Nova Funcionalidade

```bash
# 1. Atualizar dev
git checkout dev
git pull origin dev

# 2. Criar branch de feature
git checkout -b feature/nome-da-funcionalidade

# 3. Desenvolver e commitar
git add .
git commit -m "feat: implementar login com OAuth"

# 4. Manter atualizado
git checkout dev
git pull origin dev
git checkout feature/nome-da-funcionalidade
git merge dev

# 5. Enviar para remoto
git push -u origin feature/nome-da-funcionalidade
```

### Desenvolvedor: Finalizar Funcionalidade

```bash
# 1. Garantir que está atualizado
git checkout dev
git pull origin dev
git checkout feature/nome-da-funcionalidade
git merge dev

# 2. Fazer self-review
git diff dev..feature/nome-da-funcionalidade

# 3. Abrir Pull Request (via interface web)
# 4. Aguardar review e aprovação
# 5. Após merge, limpar branch local
git checkout dev
git pull origin dev
git branch -d feature/nome-da-funcionalidade
```

## 📝 Templates Práticos

### Template de Pull Request

```markdown
## 📝 Resumo
Breve descrição do que foi implementado.

## 🎯 Motivação
Por que essa mudança é necessária?

## ✅ Checklist
- [ ] Código testado localmente
- [ ] Testes passando
- [ ] Self-review realizado
- [ ] Documentação atualizada (se necessário)

## 🧪 Como Testar
1. Faça checkout desta branch
2. Execute `npm install`
3. Execute `npm test`
4. Teste manualmente: [descrever passos]

## 📸 Screenshots
(Se aplicável)

Closes #123
```

### Exemplos de Commits Bem Estruturados

```bash
# ✅ Feature simples
git commit -m "feat: adicionar botão de logout no header"

# ✅ Feature complexa
git commit -m "feat: implementar sistema de notificações

Adiciona sistema completo de notificações usando WebSockets:
- Notificações push em tempo real
- Histórico no banco de dados
- Interface para marcar como lida

Closes #123"

# ✅ Bug fix
git commit -m "fix: corrigir validação de email no formulário

O regex estava rejeitando emails válidos com subdomínios.
Atualizado para aceitar emails como user@mail.empresa.com.br

Fixes #67"

# ✅ Refatoração
git commit -m "refactor: extrair validação de CPF para função utilitária

Move lógica duplicada em 3 arquivos para utils/validators.js
Sem mudanças na API pública."
```

## 🤝 Processo de Code Review

### Para o Autor do PR

**Antes de abrir o PR:**
- [ ] Fazer self-review completo
- [ ] Executar todos os testes
- [ ] Verificar se não há código comentado/debug
- [ ] Atualizar documentação se necessário
- [ ] Resolver conflitos com branch de destino

**Ao abrir o PR:**
- [ ] Usar template padronizado
- [ ] Adicionar screenshots se aplicável
- [ ] Marcar revisores apropriados
- [ ] Referenciar issues relacionadas

### Para o Revisor

**O que revisar:**
- [ ] **Funcionalidade**: O código faz o que deveria?
- [ ] **Legibilidade**: O código é claro e bem estruturado?
- [ ] **Performance**: Há oportunidades de otimização?
- [ ] **Segurança**: Existem vulnerabilidades?
- [ ] **Testes**: A cobertura é adequada?
- [ ] **Padrões**: Segue as convenções da equipe?

**Como dar feedback:**
```markdown
# 🔴 Crítico (deve ser corrigido)
Possível null pointer exception na linha 45.

# 🟡 Importante (deveria ser corrigido)
Performance: Query N+1 detectada no loop.

# 🔵 Sugestão (melhoria opcional)
Considere extrair este método para melhor legibilidade.
```

## 🚀 Automação Básica

### Git Hooks Simples

**Pre-commit Hook** (`.git/hooks/pre-commit`):
```bash
#!/bin/sh
# Executar testes antes do commit
npm test
if [ $? -ne 0 ]; then
    echo "❌ Testes falharam!"
    exit 1
fi
echo "✅ Testes passaram!"
```

### GitHub Actions Básico

**`.github/workflows/ci.yml`:**
```yaml
name: CI
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm install
      - run: npm test
      - run: npm run lint
```

## 📊 Implementação em Equipe (30 minutos)

### Semana 1: Configuração (30 min)
1. **Configurar Git** para todos (5 min)
2. **Definir estrutura** de branches (5 min)
3. **Configurar proteção** de branches (10 min)
4. **Criar templates** de PR (5 min)
5. **Treinar equipe** no fluxo básico (5 min)

### Semana 2-4: Adoção e Refinamento
- Acompanhar métricas (tempo de PR, conflitos)
- Ajustar processos baseado no feedback
- Resolver problemas conforme surgem

---

# 🆘 PARTE 3: DICAS RÁPIDAS PARA RESOLVER PROBLEMAS

## 🚨 Problemas Comuns e Soluções

### ❌ "Fiz commit na branch errada"

```bash
# Solução 1: Mover último commit para outra branch
git log --oneline -5  # Ver commits recentes
git reset --hard HEAD~1  # Voltar 1 commit (perde mudanças)
git checkout branch-correta
git cherry-pick abc123  # Aplicar commit na branch correta

# Solução 2: Se ainda não fez push
git reset --soft HEAD~1  # Volta commit mas mantém mudanças
git stash  # Guarda mudanças
git checkout branch-correta
git stash pop  # Recupera mudanças
git add . && git commit -m "mensagem correta"
```

### ❌ "Conflitos de merge"

```bash
# 1. Ver arquivos com conflito
git status

# 2. Abrir arquivo e resolver conflitos manualmente
# Procurar por: <<<<<<<, =======, >>>>>>>

# 3. Após resolver todos os conflitos
git add .
git commit  # Não precisa de mensagem, Git gera automaticamente

# 4. Se quiser abortar o merge
git merge --abort
```

### ❌ "Preciso desfazer mudanças"

```bash
# Desfazer mudanças não commitadas
git checkout -- arquivo.js  # Arquivo específico
git checkout .  # Todos os arquivos

# Desfazer último commit (mantém mudanças)
git reset --soft HEAD~1

# Desfazer último commit (perde mudanças)
git reset --hard HEAD~1

# Reverter commit específico (cria novo commit)
git revert abc123
```

### ❌ "Esqueci de fazer pull antes de commitar"

```bash
# Se ainda não fez push
git pull --rebase origin dev

# Se já fez push e deu erro
git pull origin dev  # Vai criar merge commit
# Ou
git pull --rebase origin dev  # Reaplica seus commits
```

### ❌ "Branch está muito desatualizada"

```bash
# Atualizar branch de feature com dev
git checkout feature/minha-branch
git fetch origin
git merge origin/dev

# Ou com rebase (histórico mais limpo)
git rebase origin/dev
```

### ❌ "Commit muito grande, preciso dividir"

```bash
# Desfazer último commit mantendo mudanças
git reset --soft HEAD~1

# Adicionar arquivos em partes
git add arquivo1.js
git commit -m "feat: implementar parte 1"

git add arquivo2.js
git commit -m "feat: implementar parte 2"
```

### ❌ "Preciso alterar mensagem do último commit"

```bash
# Se ainda não fez push
git commit --amend -m "Nova mensagem correta"

# Se já fez push (cuidado!)
git commit --amend -m "Nova mensagem"
git push --force-with-lease origin branch-name
```

## ⚡ Comandos de Emergência

### 🔍 Investigação Rápida

```bash
# Ver histórico resumido
git log --oneline -10

# Ver quem modificou uma linha
git blame arquivo.js

# Buscar texto no histórico
git log --grep="bug"

# Ver diferenças entre branches
git diff main..dev

# Ver arquivos modificados em um commit
git show --name-only abc123
```

### 🧹 Limpeza Rápida

```bash
# Limpar branches já mergeadas
git branch --merged main | grep -v main | xargs git branch -d

# Limpar referências remotas órfãs
git remote prune origin

# Ver branches não mergeadas
git branch --no-merged main

# Limpar arquivos não rastreados
git clean -fd
```

### 💾 Salvar Trabalho Temporariamente

```bash
# Guardar mudanças temporariamente
git stash

# Guardar com mensagem
git stash save "trabalho em progresso"

# Ver lista de stashes
git stash list

# Recuperar último stash
git stash pop

# Recuperar stash específico
git stash apply stash@{1}
```

### 🔄 Sincronização Forçada

```bash
# Forçar branch local igual ao remoto (CUIDADO!)
git fetch origin
git reset --hard origin/main

# Forçar push (CUIDADO!)
git push --force-with-lease origin branch-name
```

## 📋 Checklists de Emergência

### ✅ Antes de Fazer Push

```bash
git status          # Ver o que será enviado
git log --oneline -5 # Ver últimos commits
git pull --rebase   # Atualizar com remoto
git push            # Enviar mudanças
```

### ✅ Quando der Problema

1. **Não entre em pânico** 🧘‍♂️
2. **Não force push** sem entender o problema
3. **Faça backup** da branch atual: `git branch backup-$(date +%Y%m%d)`
4. **Peça ajuda** se não souber como resolver
5. **Documente** a solução para próximas vezes

### ✅ Recuperação de Desastres

```bash
# Ver histórico de todas as ações
git reflog

# Recuperar commit "perdido"
git checkout abc123
git checkout -b recuperacao

# Recuperar arquivo deletado
git checkout HEAD~1 -- arquivo-deletado.js
```

## 🎯 Métricas para Acompanhar

### 📊 Indicadores de Sucesso
- **Tempo médio de PR**: < 2 dias
- **Taxa de aprovação no 1º review**: > 70%
- **Commits por PR**: < 10
- **Conflitos de merge**: < 1 por semana
- **Hotfixes**: < 1 por mês

### 🚨 Sinais de Alerta
- PRs ficam abertos por mais de 3 dias
- Muitos conflitos de merge
- Commits com mensagens vagas
- Código sendo commitado direto em main
- Muitos hotfixes

---

## 🤝 Como Contribuir

1. **Fork** este repositório
2. **Crie** uma branch: `git checkout -b minha-contribuicao`
3. **Faça** suas alterações seguindo este guia
4. **Commit**: `git commit -m "docs: melhorar seção X"`
5. **Push**: `git push origin minha-contribuicao`
6. **Abra** um Pull Request

## 📚 Recursos Adicionais

### 📖 Documentação Oficial
- [Git Documentation](https://git-scm.com/doc)
- [GitHub Guides](https://guides.github.com/)
- [Atlassian Git Tutorials](https://www.atlassian.com/git/tutorials)

### 🎓 Cursos Recomendados
- [Learn Git Branching](https://learngitbranching.js.org/) - Interativo
- [GitHub Learning Lab](https://lab.github.com/) - Prático
- [Git Immersion](http://gitimmersion.com/) - Passo a passo

### 🛠️ Ferramentas Úteis
- **VS Code** com extensão GitLens
- **GitHub Desktop** para iniciantes
- **Sourcetree** para visualização
- **GitKraken** para recursos avançados

## 📄 Licença

Este projeto está sob a licença MIT. Sinta-se livre para usar, modificar e distribuir.

---

## 🙏 Agradecimentos

Este guia foi criado com base em:
- Experiências de equipes reais de desenvolvimento
- Melhores práticas da comunidade Git
- Feedback de desenvolvedores iniciantes e experientes
- Documentação oficial do Git e GitHub

**Feito com ❤️ para a comunidade de desenvolvimento brasileiro**

---

*⭐ Se este guia foi útil, considere dar uma estrela no repositório e compartilhar com sua equipe!*
