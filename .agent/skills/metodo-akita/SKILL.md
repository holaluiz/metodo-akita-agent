---
name: metodo-akita
description: >
  Guia o usuário na construção de sistemas de software com o Método Akita:
  arquitetura-primeiro, TDD obrigatório, pair programming com IA como copiloto,
  e governança rígida sobre cada decisão. Ativa quando o usuário pede para
  "criar um sistema", "iniciar um projeto" ou mencionar "Método Akita".
---

# 🧠 Skill: Método Akita — Engenharia Disciplinada com IA

## Princípio Fundamental

Você é o **Engenheiro Sênior / Piloto**. A IA é o **Copiloto**. O copiloto escreve código; o piloto governa a arquitetura, lê cada mudança e decide o que aceitar. **Jamais aceite código sem ler e testar.**

---

## Quando Esta Skill é Ativada

Esta skill deve ser usada quando o usuário:
- Pede para "criar/iniciar um novo sistema/projeto"
- Menciona "Método Akita" ou "Anti-Vibe Coding"
- Quer seguir um processo disciplinado de desenvolvimento com IA
- Precisa estruturar arquitetura antes de codificar

---

## Protocolo de Execução

### FASE 0 — Checklist de Onboarding (SEMPRE execute primeiro)

Antes de qualquer código, pergunte e documente no `cloud.md`:

1. **Qual é o problema de negócio?** (1-3 frases)
2. **Qual a stack escolhida?** (linguagem, framework, banco, infra)
3. **Quais são as entidades do domínio?** (ex: User, Order, Product)
4. **Quais são as regras de negócio críticas?** (ex: "Um usuário não pode ter dois pedidos ativos")
5. **Qual é a estrutura de pastas proposta?**
6. **Quais variáveis de ambiente serão necessárias?**
7. **Qual será o ambiente de isolamento?** (Docker recomendado — AI Jail)

> ⚠️ Se `cloud.md` já existe no projeto, **leia-o PRIMEIRO** antes de qualquer outra ação.

---

### FASE 1 — AI Jail (Dia 1)

**Objetivo**: Ambiente isolado e seguro antes de qualquer código.

Crie (ou verifique) a estrutura de isolamento:

```bash
# Verificar se Docker está disponível
docker --version

# Estrutura mínima do AI Jail
mkdir -p .docker
```

Crie o arquivo `.docker/Dockerfile.dev`:
```dockerfile
FROM node:20-alpine  # ou a imagem adequada para a stack

WORKDIR /app

# Instale apenas o necessário
RUN apk add --no-cache git curl

# Copie apenas o necessário para instalar dependências
COPY package*.json ./
RUN npm ci

# O código é montado como volume, não copiado
```

Crie o `docker-compose.dev.yml`:
```yaml
services:
  app:
    build:
      context: .
      dockerfile: .docker/Dockerfile.dev
    volumes:
      - .:/app
      - /app/node_modules
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=development
```

**Regras do AI Jail:**
- ❌ Nunca rode o agente de IA diretamente na máquina host
- ✅ Sempre revise cada comando antes de executar
- ✅ Nunca dê permissão "faça o que quiser" — revise arquivo por arquivo

---

### FASE 2 — Fundação: Escrever o `cloud.md` (Dia 2)

**Este é o documento mais importante do projeto.** Sem ele, a IA cria "Big Ball of Mud".

Use o template em `templates/cloud.md` deste projeto. O `cloud.md` deve conter **no mínimo**:

```
- Nome do projeto e objetivo
- Stack completa (versões exatas)
- Variáveis de ambiente (sem valores sensíveis)
- Estrutura de pastas comentada
- Entidades do domínio e seus relacionamentos
- Regras de negócio (em linguagem natural)
- Padrões de código obrigatórios
- O que a IA NUNCA deve fazer neste projeto
```

> 🔁 **Regra de Desapego**: Se a IA errar, não corrija na mão. Explique o erro e atualize o `cloud.md` para que o erro não se repita.

---

### FASE 3 — TDD: Testes Primeiro (Dia 3)

**Nenhum código de produção existe antes de um teste.**

1. Para cada feature, crie um arquivo de teste PRIMEIRO
2. O teste deve falhar (RED)
3. Só então escreva o mínimo de código para passar (GREEN)
4. Refatore mantendo os testes verdes (REFACTOR)

Estrutura de teste por tipo:
```
tests/
  unit/        → lógica de negócio pura (sem I/O)
  integration/ → banco de dados, APIs externas (use mocks/stubs)
  e2e/         → fluxos completos do usuário
```

Ao pedir para a IA escrever testes, sempre especifique:
- **O que** está sendo testado (a behaviour, não a implementação)
- **Qual resultado esperado** (dado X, quando Y, então Z)
- **Quais mocks** são necessários

---

### FASE 4 — Mão na Massa: Código que Passa nos Testes (Dia 4)

**Regra de ouro**: A IA escreve código; você governa.

Para cada implementação:
1. Forneça o `cloud.md` como contexto
2. Forneça o teste que deve passar
3. Peça apenas a implementação mínima necessária
4. Leia o código gerado linha por linha antes de aceitar
5. Rode os testes — se passar, aceite; se falhar, não corrija manualmente

Prompt padrão para a IA:
```
Contexto: [cole o cloud.md ou a seção relevante]

Teste que deve passar:
[cole o teste]

Implemente apenas o código mínimo necessário para este teste passar.
Siga estritamente os padrões definidos no cloud.md.
Não crie arquivos adicionais além do solicitado.
```

---

### FASE 5 — Otimização (Dia 5)

Somente após todos os testes passando:

1. **Refatoração**: Elimine duplicação, melhore nomes, extraia funções
2. **Performance**: Identifique N+1 queries, loops desnecessários
3. **Jobs/Workers**: Mova operações pesadas para background
4. **Limpeza**: Remova código morto, console.logs, TODOs

> ⚠️ Cada refatoração deve manter **100% dos testes passando**.

---

### FASE 6 — Interface (Dia 6)

A saída do sistema pode ser:
- **Web App** (Next.js, Vite, etc.)
- **API REST/GraphQL** (documentada com OpenAPI/Swagger)
- **Bot** (Discord, Telegram, WhatsApp)
- **CLI** (linha de comando)

Defina no `cloud.md` ANTES de codificar:
- Quais rotas/telas existem
- Qual o contrato de dados (req/res)
- Quais estados de erro são possíveis

---

### FASE 7 — Deploy & CI/CD (Dia 7)

Pipeline mínima obrigatória:
```yaml
# .github/workflows/ci.yml (ou equivalente)
steps:
  - lint        # ESLint/Prettier ou equivalente
  - type-check  # TypeScript ou mypy
  - test        # npm test / pytest
  - security    # npm audit / pip-audit
  - build       # build de produção
  - deploy      # apenas se tudo acima passar
```

---

## Regras de Governança (SEMPRE lembrar ao usuário)

| ✅ Faça | ❌ Não Faça |
|---------|------------|
| Leia cada arquivo gerado | Aceite cegamente o output da IA |
| Teste antes de commitar | Commite sem testes passando |
| Atualize o cloud.md quando a IA errar | Corrija bugs manualmente sem documentar |
| Use Docker/containers para a IA | Rode agentes direto na máquina host |
| Um PR = uma feature | PRs gigantes com múltiplas features |

---

## Como Reportar Progresso ao Usuário

Ao usar esta skill, sempre informe em qual Fase/Dia o projeto está.
Use este formato:

```
📍 Método Akita — Status do Projeto
Fase atual: [Fase X — Nome]
cloud.md: [✅ Completo | ⚠️ Pendente | ❌ Não existe]
Testes: [X passando / Y falhando / Z pendentes]
Próximo passo: [ação específica]
```
