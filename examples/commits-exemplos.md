# 📝 Exemplos de Commits Bem Estruturados

Este arquivo contém exemplos práticos de como escrever boas mensagens de commit seguindo as convenções recomendadas.

## 🎯 Formato Básico

```
tipo: descrição clara em até 50 caracteres

Explicação opcional do que foi feito e por quê.
Pode ter múltiplas linhas se necessário.

Closes #123
```

## ✨ Exemplos de Features

### Feature Simples
```
feat: adicionar botão de logout no header

Implementa funcionalidade de logout que limpa a sessão
do usuário e redireciona para a página de login.

Closes #45
```

### Feature Complexa
```
feat: implementar sistema de notificações em tempo real

Adiciona sistema completo de notificações usando WebSockets:
- Notificações push em tempo real
- Histórico de notificações no banco
- Interface para marcar como lida
- Configurações de preferência do usuário

Tecnologias utilizadas:
- Socket.io para WebSockets
- Redis para cache de sessões
- Nova tabela 'notifications' no banco

Closes #123
Related to #124, #125
```

## 🐛 Exemplos de Correções

### Bug Simples
```
fix: corrigir validação de email no formulário de cadastro

O regex estava rejeitando emails válidos com subdomínios.
Atualizado para aceitar emails como user@mail.empresa.com.br

Fixes #67
```

### Bug Crítico
```
fix: corrigir vazamento de memória no upload de arquivos

Streams não estavam sendo fechados adequadamente após upload,
causando acúmulo de memória em uploads grandes (>10MB).

Mudanças:
- Adiciona fechamento explícito de streams
- Implementa timeout de 5 minutos para uploads
- Adiciona logging para monitoramento

Testado com arquivos de até 100MB.

Fixes #89
Priority: Critical
```

## 🔧 Exemplos de Refatoração

### Refatoração Simples
```
refactor: extrair validação de CPF para função utilitária

Move lógica de validação de CPF duplicada em 3 arquivos
para uma função reutilizável em utils/validators.js

Sem mudanças na API pública.
```

### Refatoração de Performance
```
refactor: otimizar queries de busca de produtos

Melhora performance das consultas de produtos através de:
- Substituição de N+1 queries por joins
- Adição de índices compostos (categoria, status)
- Cache de 5 minutos para consultas frequentes
- Paginação otimizada com cursor

Performance melhorou de 2.5s para 300ms nos testes.
Sem breaking changes na API.

Related to #156
```

## 📚 Exemplos de Documentação

### Documentação Simples
```
docs: atualizar README com instruções de instalação

Adiciona seção sobre dependências do sistema e
passos detalhados para configuração local.
```

### Documentação de API
```
docs: adicionar documentação da API de usuários

Documenta todos os endpoints de usuários:
- GET /api/users - listar usuários
- POST /api/users - criar usuário
- PUT /api/users/:id - atualizar usuário
- DELETE /api/users/:id - remover usuário

Inclui exemplos de request/response e códigos de erro.

Closes #78
```

## 🧪 Exemplos de Testes

### Testes Unitários
```
test: adicionar testes para validação de senha

Adiciona testes unitários para função validatePassword:
- Senha muito curta (< 8 caracteres)
- Senha sem números
- Senha sem caracteres especiais
- Senha válida

Cobertura aumentou de 85% para 92%.
```

### Testes de Integração
```
test: adicionar testes de integração para API de login

Testa fluxo completo de autenticação:
- Login com credenciais válidas
- Login com credenciais inválidas
- Expiração de token
- Refresh token

Usa banco de dados de teste isolado.
```

## 🎨 Exemplos de Estilo/Formatação

```
style: aplicar formatação Prettier em todos os arquivos JS

Padroniza formatação do código seguindo configuração
do .prettierrc definida pela equipe.

Sem mudanças funcionais.
```

## 🔧 Exemplos de Configuração/Build

### Configuração
```
chore: atualizar configuração do ESLint

Adiciona regras para:
- Proibir console.log em produção
- Forçar uso de const/let ao invés de var
- Limitar complexidade ciclomática a 10

Corrige 23 warnings existentes.
```

### Dependências
```
chore: atualizar dependências de segurança

Atualiza pacotes com vulnerabilidades conhecidas:
- lodash: 4.17.15 → 4.17.21
- axios: 0.21.0 → 0.21.4
- express: 4.17.1 → 4.18.2

Todas as vulnerabilidades críticas resolvidas.
```

## 🚨 Exemplos de Hotfix

```
hotfix: corrigir falha crítica no processamento de pagamentos

Erro de timeout estava causando falha em 15% dos pagamentos
durante picos de tráfego. Aumentado timeout de 30s para 60s
e adicionado retry automático.

Aplicado diretamente em produção.
Monitoramento ativo por 24h.

Fixes #CRITICAL-001
```

## ❌ Exemplos de Commits Ruins

### Muito Vago
```
❌ fix: correção
❌ update: mudanças
❌ feat: nova funcionalidade
```

### Muito Longo
```
❌ feat: implementar sistema completo de autenticação com OAuth 2.0, JWT tokens, refresh tokens, validação de email, recuperação de senha, integração com Google e Facebook, middleware de autorização e testes completos
```

### Sem Contexto
```
❌ fix: bug
❌ refactor: código
❌ test: testes
```

### Misturando Tipos
```
❌ feat: adicionar login e corrigir bug do header e atualizar documentação
```

## 📋 Checklist para Bons Commits

- [ ] **Tipo claro**: feat, fix, docs, style, refactor, test, chore
- [ ] **Descrição concisa**: máximo 50 caracteres
- [ ] **Imperativo**: "adicionar" não "adicionado"
- [ ] **Contexto suficiente**: explica o "o quê" e "por quê"
- [ ] **Referências**: menciona issues relacionadas
- [ ] **Mudanças atômicas**: uma responsabilidade por commit
- [ ] **Testes passando**: código funcional após o commit

## 🎯 Dicas Extras

1. **Use o imperativo**: Pense "Se aplicado, este commit irá..."
2. **Seja específico**: "corrigir validação de email" é melhor que "corrigir bug"
3. **Explique o porquê**: O código mostra o "como", o commit deve explicar o "porquê"
4. **Referencie issues**: Sempre que possível, conecte com issues/tickets
5. **Mantenha consistência**: Use sempre o mesmo padrão na equipe

