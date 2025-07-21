# 🚀 Boas Práticas de Git para Equipes Pequenas

> **Um guia prático e direto para implementar boas práticas de Git em equipes de 5 a 10 pessoas**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

## 📋 Sobre este Repositório

Este repositório serve como **guia prático e tutorial** para implementar boas práticas de Git em equipes pequenas de desenvolvimento. Foi criado com foco na **simplicidade**, **praticidade** e **facilidade de implementação** para times que querem melhorar seus processos sem complexidade desnecessária.

### 🎯 Para quem é este guia?

- **Equipes de 5 a 10 desenvolvedores**
- **Startups e empresas pequenas**
- **Times que querem processos simples mas eficazes**
- **Desenvolvedores que buscam padronização**
- **Líderes técnicos implementando boas práticas**

### ✨ O que você encontrará aqui?

- ✅ **Guia passo a passo** para implementação
- ✅ **Templates prontos** para usar
- ✅ **Exemplos práticos** e reais
- ✅ **Scripts de automação** simples
- ✅ **Checklists** para validação
- ✅ **Configurações** recomendadas

---

## 🗂️ Estrutura do Repositório

```
📁 git-boas-praticas-equipes-pequenas/
├── 📄 README.md                    # Este arquivo - guia principal
├── 📁 .github/                     # Configurações do GitHub
│   ├── 📁 workflows/               # Actions de CI/CD
│   ├── 📁 PULL_REQUEST_TEMPLATE/   # Templates de PR
│   └── 📁 ISSUE_TEMPLATE/          # Templates de Issues
├── 📁 docs/                        # Documentação detalhada
├── 📁 examples/                    # Exemplos de configuração
├── 📁 scripts/                     # Scripts de automação
└── 📁 templates/                   # Templates para copiar
```

---

## 🚀 Implementação Rápida (15 minutos)

### 1️⃣ Configuração Básica do Git

```bash
# Configure seu Git (substitua pelos seus dados)
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@empresa.com"

# Configurações recomendadas
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global push.default current
```

### 2️⃣ Estrutura de Branches

Mantenha **simples** com apenas 3 tipos de branches:

```
main     ← Produção (sempre estável)
  ↑
dev      ← Desenvolvimento (integração)
  ↑
feature/ ← Novas funcionalidades
```

**Comandos essenciais:**
```bash
# Criar nova funcionalidade
git checkout dev
git pull origin dev
git checkout -b feature/nome-da-funcionalidade

# Finalizar funcionalidade
git checkout dev
git pull origin dev
git merge feature/nome-da-funcionalidade
git push origin dev
git branch -d feature/nome-da-funcionalidade
```

### 3️⃣ Padrão de Commits

Use o formato **simples** e **claro**:

```
tipo: descrição clara em até 50 caracteres

Explicação opcional do que foi feito e por quê.
```

**Tipos principais:**
- `feat:` Nova funcionalidade
- `fix:` Correção de bug
- `docs:` Documentação
- `style:` Formatação
- `refactor:` Refatoração
- `test:` Testes

**Exemplos:**
```bash
git commit -m "feat: adicionar login com Google"
git commit -m "fix: corrigir erro de validação no formulário"
git commit -m "docs: atualizar README com novas instruções"
```

---

## 📝 Nomenclatura de Repositórios

### Padrão Recomendado

```
[tipo]-[projeto]-[contexto]
```

### Exemplos por Categoria

**🌐 Aplicações Web:**
- `web-loja-principal`
- `web-dashboard-admin`
- `web-portal-cliente`

**📱 Aplicações Mobile:**
- `mobile-app-cliente`
- `mobile-app-vendedor`

**🔧 APIs e Backend:**
- `api-usuarios`
- `api-pagamentos`
- `api-notificacoes`

**📚 Bibliotecas e Ferramentas:**
- `lib-componentes-ui`
- `tool-deploy-automatico`

### ❌ Evite

- Nomes genéricos: `projeto`, `sistema`, `app`
- Caracteres especiais: `projeto_novo`, `sistema-v2.0`
- Nomes muito longos: `sistema-completo-de-gestao-de-vendas-online`

---

## 🌿 Gestão de Branches

### Branches Principais

| Branch | Propósito | Proteção |
|--------|-----------|----------|
| `main` | Código em produção | ✅ Protegida |
| `dev` | Integração e testes | ✅ Protegida |
| `feature/*` | Desenvolvimento | ❌ Temporária |

### Nomenclatura de Branches

```bash
# ✅ Bom
feature/login-oauth
feature/carrinho-compras
fix/erro-pagamento
hotfix/falha-critica

# ❌ Evite
nova-feature
correcao
branch-do-joao
temp
```

### Ciclo de Vida

1. **Criar** a partir de `dev`
2. **Desenvolver** a funcionalidade
3. **Testar** localmente
4. **Abrir** Pull Request
5. **Revisar** código
6. **Mergear** em `dev`
7. **Deletar** a branch

---

## 🔄 Pull Requests Eficazes

### Template Básico

```markdown
## 📝 Resumo
Breve descrição do que foi implementado.

## 🎯 Motivação
Por que essa mudança é necessária?

## ✅ Checklist
- [ ] Código testado localmente
- [ ] Testes passando
- [ ] Documentação atualizada
- [ ] Self-review realizado

## 🖼️ Screenshots
(Se aplicável)
```

### Tamanho Ideal

- **📏 Máximo 400 linhas** alteradas
- **📁 Máximo 10 arquivos** modificados
- **⏱️ Máximo 30 minutos** para revisar

### Processo de Review

1. **Autor** faz self-review
2. **Revisor** analisa código
3. **Discussão** se necessário
4. **Aprovação** e merge
5. **Limpeza** da branch

---

## ⚙️ Automação Simples

### Git Hooks Básicos

**Pre-commit** (validação antes do commit):
```bash
#!/bin/sh
# Executar testes
npm test
if [ $? -ne 0 ]; then
    echo "❌ Testes falharam!"
    exit 1
fi
echo "✅ Testes passaram!"
```

### GitHub Actions Básico

```yaml
# .github/workflows/ci.yml
name: CI
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
      - run: npm install
      - run: npm test
```

---

## 📋 Checklists Práticos

### ✅ Checklist do Desenvolvedor

**Antes de fazer commit:**
- [ ] Código funciona localmente
- [ ] Testes passando
- [ ] Mensagem de commit clara
- [ ] Sem código comentado/debug

**Antes de abrir PR:**
- [ ] Branch atualizada com `dev`
- [ ] Self-review completo
- [ ] Descrição clara no PR
- [ ] Screenshots se necessário

### ✅ Checklist do Revisor

- [ ] Funcionalidade atende requisito
- [ ] Código legível e bem estruturado
- [ ] Sem problemas óbvios de performance
- [ ] Testes adequados
- [ ] Documentação atualizada

---

## 🛠️ Ferramentas Recomendadas

### Para Iniciantes
- **GitHub Desktop** - Interface visual simples
- **VS Code** - Editor com Git integrado
- **Sourcetree** - Visualização de branches

### Para Experientes
- **Terminal + Oh My Zsh** - Linha de comando
- **GitKraken** - Interface avançada
- **JetBrains IDEs** - Integração completa

### Extensões VS Code
- GitLens
- Git Graph
- Git History

---

## 📚 Recursos Adicionais

### 📖 Documentação Oficial
- [Git Documentation](https://git-scm.com/doc)
- [GitHub Guides](https://guides.github.com/)
- [Atlassian Git Tutorials](https://www.atlassian.com/git/tutorials)

### 🎓 Cursos e Tutoriais
- [Learn Git Branching](https://learngitbranching.js.org/)
- [GitHub Learning Lab](https://lab.github.com/)
- [Git Immersion](http://gitimmersion.com/)

### 📝 Artigos Recomendados
- [A successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/)

---

## 🤝 Como Contribuir

1. **Fork** este repositório
2. **Crie** uma branch: `git checkout -b minha-contribuicao`
3. **Faça** suas alterações
4. **Commit**: `git commit -m "feat: adicionar nova seção"`
5. **Push**: `git push origin minha-contribuicao`
6. **Abra** um Pull Request

### 💡 Ideias de Contribuição

- Melhorias na documentação
- Novos exemplos práticos
- Scripts de automação
- Templates adicionais
- Correções e atualizações

---

## 📞 Suporte e Comunidade

### 🐛 Reportar Problemas
- Abra uma [Issue](../../issues) descrevendo o problema
- Use os templates disponíveis
- Seja específico e forneça contexto

### 💬 Discussões
- Use as [Discussions](../../discussions) para dúvidas
- Compartilhe experiências e dicas
- Ajude outros desenvolvedores

### 📧 Contato
- Para dúvidas específicas sobre implementação
- Sugestões de melhorias
- Parcerias e colaborações

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

## 🙏 Agradecimentos

Este guia foi criado com base em:
- Experiências de equipes reais
- Melhores práticas da comunidade
- Feedback de desenvolvedores
- Documentação oficial do Git

**Feito com ❤️ para a comunidade de desenvolvimento**

---

## 🔄 Histórico de Versões

- **v1.0.0** - Versão inicial do guia
- Foco em equipes pequenas
- Templates e exemplos básicos
- Automação simples

---

*⭐ Se este guia foi útil, considere dar uma estrela no repositório!*

