# 🚀 Git Para Desenvolvedores Júnior: O Guia Definitivo

> **O material de referência que todo dev júnior precisa dominar antes de entrar numa empresa**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

## 📋 Sobre este Guia

Este é **O GUIA** que você precisa dominar para trabalhar com Git em qualquer empresa. Criado especificamente para **desenvolvedores júnior** que já sabem o que é Git mas precisam aprender **como usar na prática** no dia a dia de uma empresa real.

### 🎯 Para quem é este guia?
- **Desenvolvedores júnior** entrando no mercado
- **Estudantes** que querem se preparar para o primeiro emprego
- **Bootcampers** que precisam entender Git além do básico
- **Devs** que sempre fazem `git add .` e `git commit -m "fix"` 😅
- **Qualquer pessoa** que quer dominar Git de verdade

### 🔥 Por que este guia vai te salvar?
- ✅ **Conceitos claros** de repositório, branch, commit, merge, rebase
- ✅ **Exemplos reais** do que fazer e o que **NÃO** fazer
- ✅ **Rotinas diárias** passo a passo
- ✅ **Solução de problemas** comuns que acontecem todo dia
- ✅ **Boas práticas** que toda empresa espera que você saiba

> 💡 **Este guia foca em times de 5-10 pessoas porque atende 90% dos projetos, mas os conceitos valem para qualquer tamanho de equipe!**

---

# 📚 PARTE 1: CONCEITOS FUNDAMENTAIS (O QUE VOCÊ PRECISA SABER)

## 🏠 O que é um Repositório?

**Repositório (repo)** = A "pasta" onde fica todo o histórico do seu projeto

```
meu-projeto/           ← Isso é um repositório
├── .git/             ← Pasta mágica do Git (nunca mexe aqui!)
├── src/              ← Seu código
├── README.md         ← Documentação
└── package.json      ← Configurações
```

**Analogia:** Repositório é como o "projeto no Google Drive", mas muito mais inteligente - ele guarda TODAS as versões que já existiram do seu código.

### 🎯 Boas Práticas para Nomes de Repositórios

**✅ BOM:**
```
api-usuarios          ← Claro e direto
web-loja-virtual     ← Específico
mobile-app-delivery  ← Indica a plataforma
admin-dashboard      ← Função clara
```

**❌ RUIM:**
```
projeto              ← Muito genérico
app                  ← Não diz nada
sistema123          ← Números aleatórios
meuapp               ← Sem padrão
TesteProjetoFinal   ← CamelCase confuso
```

**Padrão recomendado:**
```
[tipo]-[projeto]-[contexto]
```

## 🌿 O que é uma Branch?

**Branch** = Uma "linha do tempo" paralela do seu código

```
main     ●─●─●─●─●     ← Código em produção (o que está no ar)
           ↘
feature    ●─●─●       ← Sua nova funcionalidade
```

**Analogia:** É como escrever um livro. A branch `main` é o livro oficial publicado. Quando você quer escrever um novo capítulo, você cria uma cópia (branch) para trabalhar sem estragar o livro original.

### 🏗️ As 4 Branches que Você Vai Encontrar

```
main     ← 🔴 PRODUÇÃO (o que está no ar, NUNCA mexa diretamente)
  ↑
dev      ← 🟡 DESENVOLVIMENTO (onde tudo é testado junto)
  ↑
feature/ ← 🟢 SUAS FUNCIONALIDADES (onde você trabalha)
hotfix/  ← 🔥 CORREÇÕES URGENTES (bugs críticos em produção)
```

**Explicação detalhada:**

1. **main/master**: 
   - O código que está em produção (no ar)
   - SEMPRE funcional, nunca quebra
   - Você NUNCA faz commit direto aqui

2. **dev/development**: 
   - Onde todas as features são integradas e testadas
   - Pode ter bugs temporários
   - É aqui que você vai buscar atualizações

3. **feature/nome-da-feature**: 
   - Onde VOCÊ trabalha no seu dia a dia
   - Uma branch nova para cada funcionalidade
   - Exemplo: `feature/login-oauth`, `feature/carrinho-compras`

4. **hotfix/nome-do-problema**: 
   - Para correções urgentes em produção
   - Vai direto da main e volta para main
   - Exemplo: `hotfix/bug-pagamento`, `hotfix/falha-login`

### 🎯 Boas Práticas para Nomes de Branches

**✅ BOM:**
```
feature/login-oauth           ← Tipo + descrição clara
feature/carrinho-compras      ← Funcionalidade específica
fix/bug-validacao-email       ← Problema específico
hotfix/falha-pagamento        ← Urgente e claro
feature/dashboard-vendas      ← Contexto + funcionalidade
```

**❌ RUIM:**
```
nova-feature                  ← Não diz qual feature
bug                          ← Muito genérico
teste                        ← O que está testando?
feature                      ← Qual feature?
minha-branch                 ← Sem contexto
```

**Padrão recomendado:**
```
[tipo]/[descrição-clara-com-hifens]
```

## 📝 O que é um Commit?

**Commit** = Um "save" do seu código com uma mensagem explicando o que você fez

```
Commit abc123: "feat: adicionar botão de login"
├── login.html     (adicionado)
├── style.css      (modificado) 
└── app.js         (modificado)
```

**Analogia:** É como tirar uma foto do seu código naquele momento, com uma legenda explicando o que mudou.

### 🎯 Anatomia de um Commit Perfeito

```
tipo(escopo): descrição clara em até 50 caracteres

Explicação opcional do que foi feito e por quê.
Pode ter múltiplas linhas se necessário.

Closes #123
```

### 📋 Tipos de Commit (Conventional Commits)

**Os tipos que você vai usar 90% do tempo:**

- **`feat:`** ← Nova funcionalidade
- **`fix:`** ← Correção de bug
- **`docs:`** ← Documentação
- **`style:`** ← Formatação (sem mudança de lógica)
- **`refactor:`** ← Refatoração de código
- **`test:`** ← Testes
- **`chore:`** ← Tarefas de manutenção

### ✅ Exemplos de Commits BONS

```bash
# Feature simples
feat: adicionar botão de logout no header

# Feature com contexto
feat: implementar sistema de notificações

Adiciona sistema completo usando WebSockets:
- Notificações push em tempo real
- Histórico no banco de dados
- Interface para marcar como lida

Closes #123

# Bug fix claro
fix: corrigir validação de email no formulário

O regex estava rejeitando emails com subdomínios.
Aceita agora emails como user@mail.empresa.com.br

Fixes #67

# Refatoração explicada
refactor: extrair validação de CPF para utils

Move lógica duplicada de 3 arquivos para utils/validators.js
Sem mudanças na API pública.
```

### ❌ Exemplos de Commits RUINS

```bash
# Muito vago
fix

# Não diz o que fez
update

# Sem tipo
adicionar botão

# Muito genérico
correções

# CamelCase (ruim)
feat: AdicionarBotaoLogin

# Sem contexto
teste

# Múltiplas coisas
feat: adicionar login, corrigir bug do carrinho e atualizar docs
```

## ↔️ Push e Pull: Sincronizando com o Servidor

### 📤 Push = Enviar seus commits

```
Seu computador ──push──→ GitHub
   (commits)              (servidor)
```

**Quando usar:**
- Depois de fazer commits
- No final do dia
- Antes de sair para almoço
- Quando terminar uma funcionalidade

### 📥 Pull = Baixar commits dos outros

```
Seu computador ←──pull── GitHub
   (atualiza)             (servidor)
```

**Quando usar:**
- Antes de começar a trabalhar
- Antes de criar uma nova branch
- Antes de fazer merge
- Quando alguém avisa que fez push

### 🔄 O Fluxo Básico Diário

```bash
# 1. Sempre começe o dia assim:
git checkout dev
git pull origin dev

# 2. Trabalhe na sua branch
git checkout feature/minha-feature
git add .
git commit -m "feat: implementar algo"

# 3. Envie para o servidor
git push origin feature/minha-feature

# 4. No final do dia, atualize novamente
git checkout dev
git pull origin dev
```

## 🔗 Merge vs Rebase: Juntando Branches

### 🤝 Merge = Juntar duas branches

```
ANTES:                    DEPOIS:
main   ●─●─●             main   ●─●─●─●
         ↘                         ↙ ↘
feature   ●─●             feature   ●─●
```

**Quando usar merge:**
- Para Pull Requests
- Quando quer preservar o histórico
- Quando está juntando features na dev

### 📐 Rebase = Reorganizar commits

```
ANTES:                    DEPOIS:
main   ●─●─●─●           main   ●─●─●─●─●─●
         ↘   ↙                         ↑
feature   ●─●             feature commits linearizados
```

**Quando usar rebase:**
- Para manter histórico limpo
- Antes de abrir PR
- Para atualizar sua branch com mudanças da dev

### ⚖️ Merge vs Rebase na Prática

**Use MERGE quando:**
- Fazendo Pull Request
- Juntando features testadas
- Quer preservar quando cada commit foi feito

**Use REBASE quando:**
- Atualizando sua branch pessoal
- Quer histórico linear e limpo
- Preparando PR para review

---

# 🛠️ PARTE 2: ROTINAS DIÁRIAS (COMO FAZER NA PRÁTICA)

## 🌅 Rotina: Começando o Dia de Trabalho

### 1️⃣ Primeira coisa ao abrir o computador:

```bash
# Sempre comece atualizando a branch principal
git checkout dev
git pull origin dev

# Veja o que mudou desde ontem
git log --oneline -10
```

**Por que fazer isso?**
- Pega todas as mudanças que a equipe fez
- Evita conflitos futuros
- Você fica por dentro do que aconteceu

### 2️⃣ Criando uma nova funcionalidade:

```bash
# Certifique-se que está na dev atualizada
git checkout dev
git pull origin dev

# Crie sua branch de feature
git checkout -b feature/nome-da-funcionalidade

# Exemplo prático:
git checkout -b feature/login-google
```

### 3️⃣ Trabalhando na sua feature:

```bash
# Faça suas modificações nos arquivos...

# Veja o que você modificou
git status
git diff

# Adicione os arquivos
git add .
# OU adicione arquivos específicos:
git add src/login.js src/styles.css

# Faça o commit
git commit -m "feat: implementar login com Google OAuth"

# Envie para o servidor
git push -u origin feature/login-google
```

## 🔄 Rotina: Durante o Desenvolvimento

### ⏰ A cada 2-3 horas de trabalho:

```bash
# Salve seu progresso
git add .
git commit -m "feat: adicionar validação de formulário"
git push origin feature/login-google

# Atualize com mudanças da equipe
git checkout dev
git pull origin dev
git checkout feature/login-google
git merge dev  # Ou git rebase dev para histórico mais limpo
```

### 📝 Commits pequenos e frequentes:

**✅ FAÇA ASSIM:**
```bash
# Commit 1: Estrutura básica
git commit -m "feat: criar componente de login"

# Commit 2: Estilização
git commit -m "style: adicionar CSS para formulário de login"

# Commit 3: Validação
git commit -m "feat: implementar validação de email"

# Commit 4: Integração
git commit -m "feat: integrar com API do Google OAuth"
```

**❌ NÃO FAÇA ASSIM:**
```bash
# Um commit gigante no final
git commit -m "feat: implementar todo o sistema de login"
```

## 🎯 Rotina: Finalizando uma Feature

### 1️⃣ Preparando para Pull Request:

```bash
# Certifique-se que está atualizado
git checkout dev
git pull origin dev
git checkout feature/login-google
git rebase dev  # Deixa histórico limpo

# Faça um self-review
git diff dev..feature/login-google

# Teste tudo uma última vez
npm test  # ou yarn test
npm run build  # verificar se builda sem erro
```

### 2️⃣ Criando o Pull Request:

**No GitHub/GitLab, use este template:**

```markdown
## 📝 O que foi feito?
Implementação do sistema de login com Google OAuth

## 🎯 Por que foi necessário?
Os usuários solicitaram uma forma mais rápida de fazer login sem criar conta

## ✅ Checklist
- [x] Código testado localmente
- [x] Testes passando
- [x] Self-review realizado
- [x] Sem console.log ou código comentado
- [x] Branch atualizada com dev

## 🧪 Como testar?
1. Faça checkout desta branch: `git checkout feature/login-google`
2. Execute `npm install`
3. Execute `npm start`
4. Acesse `/login` e teste o botão "Entrar com Google"
5. Verifique se redireciona corretamente após login

## 📸 Screenshots
[Anexar prints da tela de login]

Closes #123
```

### 3️⃣ Durante o Code Review:

**Se pedirem mudanças:**
```bash
# Faça as correções solicitadas
# ... modificar arquivos ...

# Commit as correções
git add .
git commit -m "fix: corrigir validação conforme review"
git push origin feature/login-google

# O PR é atualizado automaticamente!
```

### 4️⃣ Após aprovação e merge:

```bash
# Volte para dev e atualize
git checkout dev
git pull origin dev

# Delete a branch local (já foi mergeada)
git branch -d feature/login-google

# A branch remota é deletada automaticamente no GitHub
```

## 🚨 Rotina: Resolvendo Conflitos

### 💥 Quando aparecer conflito:

```bash
# Durante merge ou rebase, pode aparecer:
# CONFLICT (content): Merge conflict in src/app.js

# 1. Veja quais arquivos têm conflito
git status

# 2. Abra o arquivo e procure por:
# <<<<<<< HEAD
# seu código
# =======
# código de outra pessoa
# >>>>>>> branch-name

# 3. Decida o que manter e delete as linhas do Git:
# Exemplo no arquivo:
function login() {
  // Mantenha o que faz sentido, pode ser uma mistura dos dois
  console.log("Login iniciado");
  validateForm();
  submitToGoogle();
}

# 4. Depois de resolver todos os conflitos:
git add .
git commit  # Não precisa de mensagem, Git gera automaticamente

# 5. Continue o processo:
git push origin feature/sua-branch
```

### 🔧 Exemplo prático de conflito:

**Arquivo original:**
```javascript
function calculatePrice(item) {
  return item.price * 1.1; // taxa de 10%
}
```

**Sua versão:**
```javascript
function calculatePrice(item) {
  return item.price * 1.2; // taxa de 20%
}
```

**Versão de outro dev:**
```javascript
function calculatePrice(item) {
  return item.price * 1.15; // taxa de 15%
}
```

**Como o Git mostra o conflito:**
```javascript
function calculatePrice(item) {
<<<<<<< HEAD
  return item.price * 1.2; // taxa de 20%
=======
  return item.price * 1.15; // taxa de 15%
>>>>>>> dev
}
```

**Como resolver:**
```javascript
// Opção 1: Manter sua versão
function calculatePrice(item) {
  return item.price * 1.2; // taxa de 20%
}

// Opção 2: Aceitar a versão da dev
function calculatePrice(item) {
  return item.price * 1.15; // taxa de 15%
}

// Opção 3: Criar uma solução híbrida
function calculatePrice(item, taxRate = 0.15) {
  return item.price * (1 + taxRate);
}
```

## 📋 Pull Request: Como Pedir Review

### 🎯 Como escrever um PR que será aprovado rapidamente:

**✅ TÍTULO BOM:**
```
feat: implementar sistema de login com Google OAuth
fix: corrigir bug de validação de email
refactor: extrair lógica de pagamento para service
```

**❌ TÍTULO RUIM:**
```
alterações
update
fixes
nova feature
```

**✅ DESCRIÇÃO BOA:**
```markdown
## 📝 Resumo
Implementa autenticação via Google OAuth para facilitar login dos usuários.

## 🎯 Motivação
- 45% dos usuários abandonam o cadastro por ser muito longo
- Suporte solicitou forma mais rápida de login
- Reduzir chamados sobre "esqueci minha senha"

## ✅ O que foi feito
- Integração com Google OAuth 2.0
- Botão "Entrar com Google" na tela de login
- Salvamento automático de dados do usuário
- Redirecionamento pós-login

## 🧪 Como testar
1. Acesse `/login`
2. Clique em "Entrar com Google"
3. Autorize a aplicação
4. Verifique se foi redirecionado para dashboard
5. Confirme se dados do usuário estão salvos

## 📸 Evidências
[Screenshots ou GIF do fluxo funcionando]

## ⚠️ Pontos de atenção
- Requer variáveis de ambiente do Google configuradas
- Usuários existentes mantêm login normal
- Fallback para erro de rede implementado

Closes #123, #124
```

## 👀 Pull Request: Como Fazer Review

### 🔍 O que revisar (checklist):

**📋 Funcionalidade:**
- [ ] O código faz o que deveria?
- [ ] Funciona nos cenários de erro?
- [ ] Performance está ok?

**📖 Legibilidade:**
- [ ] Código está claro e bem estruturado?
- [ ] Nomes de variáveis fazem sentido?
- [ ] Comentários necessários estão presentes?

**🔒 Segurança:**
- [ ] Não há dados sensíveis no código?
- [ ] Validações de entrada estão presentes?
- [ ] Não há vulnerabilidades óbvias?

**🧪 Testes:**
- [ ] Funcionalidade está testada?
- [ ] Testes cobrem cenários de erro?
- [ ] Testes passam localmente?

### 💬 Como dar feedback construtivo:

**✅ FEEDBACK BOM:**
```markdown
# 🔴 Crítico - deve ser corrigido
Linha 45: Possível null pointer exception. 
Sugestão: adicionar verificação `if (user && user.email)`

# 🟡 Importante - deveria ser corrigido  
Linha 67: Query N+1 detectada no loop.
Considere usar `includes` ou uma query única.

# 🔵 Sugestão - melhoria opcional
Linha 23: `getUserData()` poderia ter um nome mais específico.
Que tal `fetchUserProfile()` ou `loadUserDetails()`?

# ✅ Elogio
Excelente tratamento de erro na linha 89! Muito claro.
```

**❌ FEEDBACK RUIM:**
```markdown
# Muito vago
"Não gostei"
"Está errado"
"Muda isso"

# Sem contexto
"Bug na linha 45"
"Performance ruim"
"Faltam testes"

# Não construtivo
"Esse código é horrível"
"Quem escreveu isso?"
"Refaz tudo"
```

### ✅ Como aprovar um PR:

**Quando aprovar:**
- Funcionalidade está completa
- Código está legível
- Testes estão passando
- Sem problemas críticos de segurança
- Pequenos problemas podem ser resolvidos depois

**Mensagem de aprovação:**
```markdown
✅ LGTM! (Looks Good To Me)

Código está muito bem estruturado. 
Apenas uma sugestão menor sobre nomenclatura, 
mas pode ser endereçada em outro PR.

Ótimo trabalho! 🚀
```

## 🔀 Merge: Finalizando o Pull Request

### 🎯 Quem pode fazer merge?

**Normalmente:**
- Tech Lead
- Senior Developer  
- Pessoa responsável pelo projeto
- **NUNCA** a mesma pessoa que criou o PR

### 📝 Processo de merge:

```bash
# 1. Revisor testa localmente (opcional mas recomendado)
git checkout feature/login-google
git pull origin feature/login-google
npm test
npm start  # testa manualmente

# 2. Se tudo ok, faz merge via interface web
# GitHub/GitLab → "Merge Pull Request"

# 3. Escolher tipo de merge:
# - Merge commit: preserva histórico
# - Squash: transforma tudo em 1 commit
# - Rebase: aplica commits direto na main
```

### 🧹 Após o merge:

```bash
# Todos da equipe devem atualizar:
git checkout dev
git pull origin dev

# A branch da feature pode ser deletada:
git branch -d feature/login-google
git push origin --delete feature/login-google
```

---

# 🆘 PARTE 3: PROBLEMAS DO DIA A DIA E COMO RESOLVER

## 🚨 "Socorro! Fiz besteira!" - Problemas Comuns

### 😱 "Commitei na branch errada!"

**Situação:** Você estava trabalhando na `feature/login` mas commitou na `dev` por engano.

```bash
# Solução 1: Se ainda não fez push
git log --oneline -3  # veja seu commit
git reset --soft HEAD~1  # volta 1 commit, mantém as mudanças
git stash  # guarda as mudanças
git checkout feature/login  # vai para branch correta
git stash pop  # recupera as mudanças
git add .
git commit -m "feat: implementar login OAuth"

# Solução 2: Se já fez push (mais complicado)
git log --oneline -3  # anote o hash do commit (ex: abc123)
git reset --hard HEAD~1  # remove commit da branch errada
git push origin dev --force-with-lease  # CUIDADO! Só se ninguém mais puxou
git checkout feature/login
git cherry-pick abc123  # aplica o commit na branch correta
```

### 😵 "Meu merge deu conflito e não sei resolver!"

**Situação:** Você fez `git merge dev` e apareceu conflito.

```bash
# 1. Não entre em pânico!
git status  # veja quais arquivos têm conflito

# 2. Abra cada arquivo com conflito e procure por:
# <<<<<<< HEAD
# seu código
# =======  
# código da outra pessoa
# >>>>>>> dev

# 3. Exemplo prático:
# Arquivo: src/utils.js
# <<<<<<< HEAD
# function formatCurrency(value) {
#   return `R$ ${value.toFixed(2)}`;
# }
# =======
# function formatCurrency(value) {
#   return `R$ ${value.toFixed(2).replace('.', ',')}`;
# }
# >>>>>>> dev

# 4. Escolha uma versão ou misture as duas:
function formatCurrency(value) {
  return `R$ ${value.toFixed(2).replace('.', ',')}`;  // Versão da dev é melhor
}

# 5. Remova TODAS as linhas do Git (<<<<, ====, >>>>)

# 6. Salve o arquivo e continue:
git add .
git commit  # Git gera mensagem automaticamente

# 7. Se quiser abortar tudo:
git merge --abort  # volta ao estado anterior
```

### 🤯 "Preciso desfazer o último commit!"

```bash
# Se ainda NÃO fez push:
git reset --soft HEAD~1    # Volta commit, mantém mudanças no staging
git reset --mixed HEAD~1   # Volta commit, mudanças ficam no working directory  
git reset --hard HEAD~1    # CUIDADO! Volta commit e APAGA mudanças

# Se JÁ fez push:
git revert HEAD            # Cria novo commit que desfaz o anterior
git push origin sua-branch # Seguro, não quebra histórico

# Para desfazer vários commits:
git reset --soft HEAD~3    # Volta 3 commits
git reset --hard HEAD~3    # APAGA 3 commits (cuidado!)
```

### 😤 "Esqueci de fazer pull e agora não consigo fazer push!"

**Erro típico:** `rejected - non-fast-forward`

```bash
# Solução 1: Merge (mais comum)
git pull origin dev        # Puxa mudanças e cria merge commit
git push origin sua-branch # Agora vai funcionar

# Solução 2: Rebase (histórico mais limpo)
git pull --rebase origin dev  # Reaplica seus commits em cima das mudanças
git push origin sua-branch    # Histórico linear

# Se der conflito durante rebase:
# 1. Resolva conflitos nos arquivos
# 2. git add .
# 3. git rebase --continue
# 4. Repita até terminar

# Para abortar rebase:
git rebase --abort
```

### 🤦 "Minha branch está muito desatualizada!"

**Situação:** Você trabalhou 1 semana na sua branch e agora a `dev` tem 50 commits novos.

```bash
# Opção 1: Merge (mais seguro)
git checkout dev
git pull origin dev
git checkout feature/sua-branch
git merge dev  # Vai criar um merge commit

# Opção 2: Rebase (histórico mais limpo, mas pode dar mais conflitos)
git checkout dev  
git pull origin dev
git checkout feature/sua-branch
git rebase dev  # Aplica suas mudanças em cima da dev atualizada

# Se der muitos conflitos no rebase:
git rebase --abort  # Desiste do rebase
# Use merge mesmo: git merge dev
```

### 🙄 "Commitei um arquivo gigante por engano!"

```bash
# Se ainda não fez push:
git reset --soft HEAD~1  # Desfaz commit
git reset arquivo-gigante.zip  # Remove arquivo do staging
rm arquivo-gigante.zip   # Delete o arquivo
# Adicione ao .gitignore:
echo "*.zip" >> .gitignore
git add .
git commit -m "feat: implementar feature (sem arquivos grandes)"

# Se já fez push:
# É mais complicado, pode precisar de git filter-branch
# Melhor pedir ajuda para o senior da equipe
```

### 😅 "Preciso alterar a mensagem do último commit!"

```bash
# Se ainda NÃO fez push:
git commit --amend -m "Nova mensagem correta"

# Se JÁ fez push:
git commit --amend -m "Nova mensagem"
git push origin sua-branch --force-with-lease  # CUIDADO! Só se ninguém mais mexeu

# Para alterar commit mais antigo:
git rebase -i HEAD~3  # Vai abrir editor
# Mude "pick" para "reword" no commit que quer alterar
# Salve e siga as instruções
```

### 🤕 "Deletei um arquivo importante por engano!"

```bash
# Se ainda não commitou:
git checkout -- arquivo-deletado.js  # Restaura arquivo

# Se já commitou mas não fez push:
git reset --hard HEAD~1  # Volta ao commit anterior (perde outras mudanças)
# OU
git checkout HEAD~1 -- arquivo-deletado.js  # Restaura só esse arquivo

# Se já fez push:
git checkout HEAD~1 -- arquivo-deletado.js  # Pega arquivo do commit anterior
git add arquivo-deletado.js
git commit -m "fix: restaurar arquivo deletado por engano"

# Se não sabe em qual commit o arquivo existia:
git log --follow -- arquivo-deletado.js  # Mostra histórico do arquivo
git checkout abc123 -- arquivo-deletado.js  # Restaura de commit específico
```

### 🤬 "Fiz push na main por engano!"

**Situação crítica:** Você fez push direto na main e a empresa tem regra de não fazer isso.

```bash
# 1. PARE TUDO! Não faça mais nada!

# 2. Se NINGUÉM mais puxou ainda:
git log --oneline -5  # Veja seu commit
git reset --hard HEAD~1  # Remove seu commit
git push origin main --force-with-lease  # Remove do servidor (PERIGOSO!)

# 3. Se alguém JÁ puxou suas mudanças:
# Você vai precisar fazer um revert:
git revert HEAD  # Cria commit que desfaz suas mudanças
git push origin main

# 4. Avise a equipe imediatamente!
# Mande mensagem no Slack/Discord explicando o que aconteceu
```

### 😰 "Perdi tudo! Meu código sumiu!"

```bash
# Calma! Git guarda quase tudo. Use o reflog:
git reflog  # Mostra TODAS as ações que você fez

# Vai aparecer algo como:
# abc123 HEAD@{0}: reset: moving to HEAD~1
# def456 HEAD@{1}: commit: feat: minha feature
# ghi789 HEAD@{2}: checkout: moving from dev to feature/login

# Para recuperar:
git checkout def456  # Vai para o commit perdido
git checkout -b recuperacao  # Cria branch para salvar
# Seu código está de volta!

# Para recuperar arquivo específico:
git checkout def456 -- arquivo-perdido.js
```

## ⚡ Comandos de Emergência (Cole na Parede)

### 🔧 Kit de Primeiros Socorros

```bash
# Ver o que está acontecendo
git status
git log --oneline -10
git reflog  # Histórico de TUDO que você fez

# Desfazer coisas (do menos para o mais destrutivo)
git checkout .          # Desfaz mudanças não commitadas
git reset --soft HEAD~1 # Desfaz último commit, mantém mudanças
git reset --mixed HEAD~1 # Desfaz commit, mudanças vão para working directory
git reset --hard HEAD~1  # APAGA último commit (cuidado!)

# Voltar arquivo específico
git checkout -- arquivo.js         # Desfaz mudanças não commitadas
git checkout HEAD~1 -- arquivo.js  # Pega arquivo do commit anterior

# Salvar trabalho temporariamente
git stash                    # Guarda mudanças
git stash pop               # Recupera mudanças
git stash list              # Ver lista de stashes
git stash apply stash@{0}   # Aplicar stash específico

# Sincronização forçada (CUIDADO!)
git fetch origin
git reset --hard origin/main  # Força branch igual ao servidor
git push --force-with-lease origin branch-name  # Força push (só se tem certeza!)

# Investigação
git blame arquivo.js         # Quem modificou cada linha
git log --grep="texto"       # Buscar nos commits
git diff branch1..branch2    # Diferença entre branches
git show commit-hash         # Ver detalhes de um commit
```

### 📞 Quando Pedir Ajuda

**Peça ajuda quando:**
- Apareceu algo com `--force` que você não entende
- Múltiplas pessoas estão afetadas
- Você fez algo na branch `main` ou `master`
- Apareceu mensagem de erro que você nunca viu
- Você tem medo de "quebrar" algo

**Como pedir ajuda:**
```markdown
# No Slack/Discord da equipe:
🆘 Preciso de ajuda com Git!

**O que eu estava tentando fazer:**
Fazer merge da minha branch feature/login na dev

**O que eu fiz:**
git checkout dev
git merge feature/login

**O que aconteceu:**
Apareceu um monte de conflitos e uma mensagem que não entendi:
[cole a mensagem de erro aqui]

**Situação atual:**
Estou na branch dev com merge em andamento
git status mostra: [cole o output do git status]

Não mexi em mais nada depois do erro!
```

---

# 🎓 PARTE 4: CONFIGURAÇÃO E BOAS PRÁTICAS

## ⚙️ Configuração Inicial (Faça UMA vez)

### 🛠️ Configurar Git no seu computador:

```bash
# 1. Configurações obrigatórias
git config --global user.name "Seu Nome Completo"
git config --global user.email "seu.email@empresa.com"

# 2. Configurações que vão te salvar
git config --global init.defaultBranch main
git config --global pull.rebase false  # Use merge por padrão (mais seguro)
git config --global push.default current
git config --global color.ui auto

# 3. Editor padrão (VS Code)
git config --global core.editor "code --wait"

# 4. Aliases que vão acelerar seu trabalho
git config --global alias.st "status"
git config --global alias.co "checkout" 
git config --global alias.br "branch"
git config --global alias.cm "commit -m"
git config --global alias.ps "push"
git config --global alias.pl "pull"
git config --global alias.graph "log --oneline --graph --decorate --all"

# 5. Verificar se deu certo
git config --list --global
```

### 📁 Arquivo .gitignore Essencial

**Crie um `.gitignore` na raiz do projeto:**

```gitignore
# 📦 Dependências (NUNCA comite isso!)
node_modules/
vendor/
*.lock

# 🏗️ Arquivos de build
dist/
build/
public/build/
*.min.js
*.min.css

# 🔐 Ambientes e secrets (MUITO IMPORTANTE!)
.env
.env.local
.env.production
.env.staging
config/secrets.json
secrets/

# 📝 Logs
*.log
logs/
npm-debug.log*

# 💾 Cache
.cache/
.tmp/
.sass-cache/

# 🔧 IDEs e editores
.vscode/settings.json
.idea/
*.swp
*.swo
*~

# 💻 Sistema operacional
.DS_Store
Thumbs.db
desktop.ini

# 🧪 Testes
coverage/
.nyc_output/

# 📱 Mobile
*.apk
*.ipa
```

### 🔒 Proteger Branches Importantes

**No GitHub/GitLab, configure:**

1. **Vá em Settings → Branches**
2. **Proteja a branch `main`:**
   - ✅ Require pull request reviews before merging
   - ✅ Require status checks to pass before merging  
   - ✅ Restrict pushes that create files larger than 100MB
   - ✅ Do not allow bypassing the above settings

3. **Proteja a branch `dev`:**
   - ✅ Require pull request reviews before merging
   - ✅ Allow auto-merge

## 📋 Checklist para Novos Projetos

### ✅ Configuração do Repositório:

```bash
# 1. Clone o projeto
git clone https://github.com/empresa/projeto.git
cd projeto

# 2. Verifique as branches
git branch -a

# 3. Configure upstream se for fork
git remote add upstream https://github.com/original/projeto.git

# 4. Configure sua branch de trabalho
git checkout dev
git pull origin dev
```

### ✅ Antes do Primeiro Commit:

- [ ] `.gitignore` configurado
- [ ] Branches protegidas
- [ ] Configuração do Git local ok
- [ ] README.md atualizado
- [ ] Licença definida
- [ ] Template de PR criado

## 🎯 Workflow Recomendado para Equipes

### 📊 Estrutura de Branches (Git Flow Simplificado):

```
main      ● ── ● ── ● ── ●     ← Produção (sempre estável)
            ↘    ↙    ↘    ↙
dev         ● ── ● ── ● ── ●   ← Desenvolvimento/staging
              ↘ ↙  ↘ ↙
features      ● ●    ● ●       ← Suas funcionalidades
```

**Regras de ouro:**
1. **main** = Produção (só releases)
2. **dev** = Staging (testes integrados)  
3. **feature/** = Desenvolvimento (seu trabalho)
4. **hotfix/** = Correções urgentes

### 🔄 Processo Completo (Do Zero ao Deploy):

```bash
# 1. Nova funcionalidade (segunda-feira)
git checkout dev
git pull origin dev
git checkout -b feature/sistema-pagamento

# 2. Desenvolvimento (segunda a quinta)
# ... trabalhar no código ...
git add .
git commit -m "feat: implementar validação cartão"
git push origin feature/sistema-pagamento

# 3. Atualizar com mudanças da equipe (diariamente)
git checkout dev
git pull origin dev
git checkout feature/sistema-pagamento
git merge dev

# 4. Finalizar feature (quinta-feira)
git checkout dev
git pull origin dev
git checkout feature/sistema-pagamento
git rebase dev  # Deixa histórico limpo
git push origin feature/sistema-pagamento --force-with-lease

# 5. Abrir Pull Request (quinta-feira)
# Via interface web do GitHub/GitLab

# 6. Code Review (sexta-feira)
# Reviewers analisam e aprovam

# 7. Merge para dev (sexta-feira)
# Via interface web

# 8. Deploy para staging (automático)
# CI/CD faz deploy da branch dev

# 9. Testes em staging (sexta-feira)
# QA testa funcionalidades

# 10. Release para produção (segunda-feira seguinte)
# Merge de dev para main
# Deploy automático para produção
```

## 🚀 Automação Básica

### 🤖 GitHub Actions para CI/CD:

**`.github/workflows/ci.yml`:**
```yaml
name: CI/CD
on:
  push:
    branches: [ main, dev ]
  pull_request:
    branches: [ main, dev ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'npm'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Run tests
        run: npm test
      
      - name: Run linter
        run: npm run lint
      
      - name: Build project
        run: npm run build
```

### 🪝 Git Hooks Úteis:

**`.git/hooks/pre-commit`:**
```bash
#!/bin/sh
# Executa antes de cada commit

echo "🔍 Executando verificações..."

# Rodar testes
npm test
if [ $? -ne 0 ]; then
    echo "❌ Testes falharam! Commit cancelado."
    exit 1
fi

# Rodar linter
npm run lint
if [ $? -ne 0 ]; then
    echo "❌ Linting falhou! Corrija os erros."
    exit 1
fi

echo "✅ Tudo certo! Commit realizado."
```

**`.git/hooks/commit-msg`:**
```bash
#!/bin/sh
# Valida mensagem do commit

commit_regex='^(feat|fix|docs|style|refactor|test|chore)(\(.+\))?: .{1,50}'

if ! grep -qE "$commit_regex" "$1"; then
    echo "❌ Mensagem de commit inválida!"
    echo "Use: tipo(escopo): descrição"
    echo "Exemplo: feat: adicionar login OAuth"
    exit 1
fi
```

## 📊 Métricas para Acompanhar

### 🎯 KPIs de um Time Saudável:

**📈 Indicadores Positivos:**
- **Tempo médio de PR**: < 24 horas
- **Taxa de aprovação no 1º review**: > 80%
- **Commits por PR**: 3-8 commits
- **Conflitos de merge**: < 1 por semana por pessoa
- **Hotfixes**: < 1 por mês
- **Build quebrado**: < 2% do tempo

**🚨 Sinais de Alerta:**
- PRs ficam abertos > 3 dias
- Muitos conflitos de merge
- Commits gigantes (>500 linhas)
- Mensagens vagas: "fix", "update"
- Push direto na main
- Builds quebrados frequentes

### 📱 Ferramentas para Monitorar:

**GitHub/GitLab Insights:**
```bash
# Ver estatísticas do repositório
# GitHub: Insights → Pulse/Contributors/Code frequency
# GitLab: Repository → Analytics → Repository analytics
```

**Comandos para análise local:**
```bash
# Ver contribuições por pessoa
git shortlog -sn --since="1 month ago"

# Ver frequência de commits
git log --since="1 month ago" --pretty=format:"%ad" --date=short | sort | uniq -c

# Ver arquivos mais modificados
git log --since="1 month ago" --name-only --pretty=format: | sort | uniq -c | sort -nr

# Ver tamanho médio dos commits
git log --since="1 month ago" --shortstat --pretty=format: | awk '/files? changed/ {files+=$1; inserted+=$4; deleted+=$6} END {print "Média:", files/NR, "arquivos,", inserted/NR, "inserções,", deleted/NR, "deleções por commit"}'
```

---

# 🎓 PARTE 5: RECURSOS E PRÓXIMOS PASSOS

## 🚨 Problemas Comuns e Soluções

## 📚 Recursos para Continuar Aprendendo

### 🎮 Cursos Interativos (RECOMENDADOS!):

1. **[Learn Git Branching](https://learngitbranching.js.org/)**
   - Jogo interativo para aprender Git
   - Visual e didático
   - Grátis e em português

2. **[GitHub Skills](https://skills.github.com/)**
   - Cursos oficiais do GitHub
   - Repositórios práticos
   - Certificado gratuito

3. **[Atlassian Git Tutorials](https://www.atlassian.com/git/tutorials)**
   - Documentação completa e clara
   - Exemplos práticos
   - Comparações visuais

### 📖 Documentação Oficial:

- **[Git Documentation](https://git-scm.com/doc)** - Documentação oficial (inglês)
- **[GitHub Docs](https://docs.github.com/)** - Guias do GitHub
- **[GitLab Docs](https://docs.gitlab.com/)** - Documentação GitLab

### 🛠️ Ferramentas Úteis:

**Para Iniciantes:**
- **GitHub Desktop** - Interface gráfica oficial
- **Sourcetree** - Visual e intuitivo (Atlassian)
- **GitKraken** - Interface moderna e recursos avançados

**Para VS Code:**
- **GitLens** - Superpowers para Git
- **Git Graph** - Visualização do histórico
- **Git History** - Histórico de arquivos

**Linha de Comando:**
```bash
# Instalar utilitários úteis
brew install tig          # Navegador visual de commits (Mac)
sudo apt install tig      # Ubuntu/Debian
choco install tig         # Windows (Chocolatey)

# Aliases avançados para .bashrc ou .zshrc
alias glog="git log --oneline --graph --decorate --all"
alias gst="git status -sb"
alias gco="git checkout"
alias gpl="git pull --rebase"
alias gps="git push"
```

### 📱 Apps Mobile:

- **Working Copy** (iOS) - Git client completo
- **Git Journal** (Android) - Visualizar commits
- **Pocket Git** (Android) - Cliente Git básico

## 🎯 Próximos Passos na Sua Jornada

### 🥉 Nível Básico (Você está aqui!):
- [x] Entender repositório, branch, commit
- [x] Fazer pull, push, merge básico
- [x] Criar e usar Pull Requests
- [x] Resolver conflitos simples
- [x] Seguir convenções de commit

### 🥈 Nível Intermediário:
- [ ] **Git rebase interativo** para limpar histórico
- [ ] **Git bisect** para encontrar bugs
- [ ] **Git submodules** para projetos dependentes
- [ ] **Git hooks** para automatizar verificações
- [ ] **Cherry-pick** commits específicos
- [ ] **Configurar aliases** personalizados

### 🥇 Nível Avançado:
- [ ] **Git flow** completo com releases
- [ ] **Monorepos** e estratégias de branching
- [ ] **CI/CD** pipelines avançados
- [ ] **Git LFS** para arquivos grandes
- [ ] **GPG signing** para commits assinados
- [ ] **Custom git commands** e scripts

### 🏆 Roadmap de 3 Meses:

**Semana 1-4: Consolidar Básico**
- Usar daily este guia
- Praticar com projetos pessoais
- Fazer pelo menos 1 PR por semana

**Semana 5-8: Intermediário**
- Aprender rebase interativo
- Configurar hooks personalizados
- Contribuir para projetos open source

**Semana 9-12: Avançado**
- Implementar Git flow completo
- Configurar CI/CD
- Mentorar outros devs

## 🤝 Comunidade e Contribuições

### 💬 Onde Tirar Dúvidas:

**Discord/Slack da Empresa:**
- Sempre pergunte! Ninguém nasce sabendo
- Compartilhe erros e soluções
- Ajude colegas com problemas similares

**Comunidades Brasileiras:**
- **[Dev.to](https://dev.to/t/git)** - Artigos e discussões
- **[GitHub Discussions](https://github.com/features/discussions)** - Fóruns oficiais
- **[Stack Overflow PT](https://pt.stackoverflow.com/questions/tagged/git)** - Perguntas específicas

### 🚀 Como Contribuir com Este Guia:

1. **Encontrou um erro?**
   ```bash
   git checkout -b fix/corrigir-secao-x
   # Faça a correção
   git commit -m "docs: corrigir exemplo de merge"
   # Abra PR seguindo este guia!
   ```

2. **Tem uma sugestão?**
   - Abra uma Issue descrevendo a melhoria
   - Explique o problema que resolve
   - Dê exemplos práticos

3. **Quer adicionar conteúdo?**
   - Fork o repositório
   - Adicione seção seguindo o padrão
   - Inclua exemplos práticos
   - Teste com desenvolvedores júnior

### 📈 Roadmap do Projeto:

**Próximas versões:**
- [ ] Seção específica para diferentes IDEs
- [ ] Vídeos explicativos dos conceitos
- [ ] Exercícios práticos interativos
- [ ] Traduções para outras linguagens
- [ ] Exemplos específicos por stack (React, Node, Python, etc.)

## 🎉 Conclusão: Você Está Pronto!

### ✅ O que você aprendeu:

1. **Conceitos fundamentais** - repo, branch, commit, merge, rebase
2. **Nomenclaturas corretas** - main, dev, feature, hotfix
3. **Boas práticas** - commits semânticos, branches organizadas
4. **Rotinas diárias** - como trabalhar em equipe sem conflitos
5. **Resolução de problemas** - como sair de situações complicadas
6. **Pull Requests** - como pedir, revisar e aprovar mudanças

### 🎯 Principais Lembretes:

> **Regra de Ouro:** Sempre `git pull` antes de começar a trabalhar

> **Nunca faça:** `git push --force` sem entender o que está fazendo

> **Sempre faça:** Self-review antes de abrir PR

> **Em caso de dúvida:** Pergunte! É melhor perguntar do que quebrar

### 💪 Próximos Passos:

1. **Pratique** daily seguindo as rotinas deste guia
2. **Bookmarque** este repositório para consultas rápidas
3. **Compartilhe** com outros devs júnior
4. **Contribua** com melhorias e correções
5. **Evolua** para conceitos mais avançados gradualmente

### 🌟 Mensagem Final:

**Git é uma ferramenta, não um bicho de sete cabeças!** 

Com este guia e prática regular, você vai:
- Trabalhar com confiança em qualquer equipe
- Resolver problemas sem pânico
- Ser visto como alguém organizado e profissional
- Ajudar outros devs que estão começando

**Lembre-se:** Todo desenvolvedor sênior já passou pelos mesmos problemas que você. A diferença é que eles erraram, aprenderam e agora dominam.

**Agora é sua vez! 🚀**

---

## 📄 Licença

Este projeto está sob a licença MIT. Sinta-se livre para usar, modificar e distribuir em projetos pessoais e comerciais.

## 🙏 Agradecimentos

Este guia foi criado com base em:
- **Experiências reais** de desenvolvedores júnior
- **Problemas comuns** relatados em fóruns e comunidades
- **Boas práticas** adotadas por empresas de tecnologia
- **Feedback** de centenas de devs que usaram versões anteriores
- **Documentação oficial** do Git e GitHub/GitLab

**Contribuidores:**
- Criado com ❤️ para a comunidade de desenvolvimento
- Mantido pela comunidade open source
- Testado por desenvolvedores júnior reais

---

## 🔗 Links Úteis

### 📌 Referência Rápida:
- [Conventional Commits](https://www.conventionalcommits.org/pt-br/) - Padrão de commits semânticos
- [Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf) - Comandos essenciais (PDF)
- [GitHub Flow](https://guides.github.com/introduction/flow/) - Workflow simplificado

### 🆘 Ajuda Emergencial:
- [Oh Shit, Git!](https://ohshitgit.com/) - Soluções para problemas comuns (inglês)
- [Git Explorer](https://gitexplorer.com/) - Encontre comandos por situação
- [Learn Git Branching](https://learngitbranching.js.org/) - Visualizador interativo

---

## ⭐ Apoie Este Projeto

Se este guia te ajudou:

1. **Dê uma ⭐ no repositório** - Ajuda outros devs a encontrar
2. **Compartilhe** com sua equipe e amigos desenvolvedores  
3. **Contribua** com melhorias e correções
4. **Use** nas suas empresas e projetos
5. **Dê feedback** sobre o que funcionou ou pode melhorar

**Objetivo:** Que todo dev júnior brasileiro tenha acesso a este conhecimento!

---

*⭐ Se este guia foi útil, considere dar uma estrela no repositório e compartilhar com sua equipe!*

**#GitParaJuniors #DesenvolvimentoJunior #BrasilDev #OpenSource**
