# 🧠 cloud.md — Cérebro do Projeto: [NOME DO PROJETO]

> **Este arquivo é o documento mais importante do projeto.**
> A IA deve ler este arquivo ANTES de qualquer ação.
> Toda decisão arquitetural deve ser registrada aqui.
> Se a IA errar, atualize este arquivo para evitar a recorrência.

---

## 1. Visão Geral

**Nome do Projeto**: [ex: api-pagamentos]
**Objetivo**: [1-3 frases descrevendo o problema que resolvemos]
**Responsável**: [seu nome / time]
**Data de início**: [YYYY-MM-DD]
**Status atual**: [Fase 1 - AI Jail | Fase 2 - Fundação | Fase 3 - TDD | ...]

---

## 2. Stack Tecnológica

> ⚠️ A IA DEVE usar exatamente estas versões. Não upgrade sem aprovação.

| Camada | Tecnologia | Versão |
|--------|-----------|--------|
| Runtime | [Node.js / Python / Go] | [ex: 20.x] |
| Framework | [ex: FastAPI / Express / Next.js] | [ex: 0.115.x] |
| Banco de dados | [ex: PostgreSQL] | [ex: 16.x] |
| ORM / Query Builder | [ex: Prisma / SQLAlchemy] | [ex: 5.x] |
| Cache | [ex: Redis] | [ex: 7.x] |
| Testes | [ex: Jest / pytest] | [ex: 29.x] |
| Lint | [ex: ESLint / Ruff] | [ex: 8.x] |
| Containerização | Docker | [ex: 25.x] |

---

## 3. Variáveis de Ambiente

> ⚠️ NUNCA commite valores reais. Use `.env.example` como referência.

```bash
# Aplicação
NODE_ENV=development
PORT=3000
APP_SECRET=

# Banco de dados
DATABASE_URL=postgresql://user:password@localhost:5432/dbname
DATABASE_POOL_SIZE=10

# Cache
REDIS_URL=redis://localhost:6379

# Autenticação
JWT_SECRET=
JWT_EXPIRES_IN=7d

# Integrações externas
# [NOME_SERVICO]_API_KEY=
# [NOME_SERVICO]_WEBHOOK_SECRET=
```

---

## 4. Estrutura de Pastas

```
projeto/
├── src/
│   ├── domain/          # Entidades e regras de negócio puras (sem I/O)
│   │   ├── entities/    # ex: User.ts, Order.ts
│   │   └── services/    # ex: OrderService.ts (lógica de negócio)
│   ├── infra/           # Adaptadores externos (banco, APIs, cache)
│   │   ├── database/    # Conexão, migrations, repositórios
│   │   ├── http/        # Controllers, rotas, middlewares
│   │   └── jobs/        # Workers e tarefas assíncronas
│   ├── shared/          # Utilitários compartilhados, types, erros
│   └── index.ts         # Entrypoint da aplicação
├── tests/
│   ├── unit/            # Testes do domain/ (sem I/O, sem mocks pesados)
│   ├── integration/     # Testes do infra/ (banco real ou mock)
│   └── e2e/             # Testes de fluxo completo
├── .docker/
│   └── Dockerfile.dev   # AI Jail - ambiente isolado
├── docs/
│   └── adr/             # Architecture Decision Records
├── cloud.md             # Este arquivo
├── docker-compose.dev.yml
├── .env.example
└── README.md
```

---

## 5. Domínio e Entidades

### 5.1 Entidades Principais

```
[Nome da Entidade]
├── id: [tipo]
├── [campo]: [tipo] — [descrição]
└── [campo]: [tipo] — [descrição]

Relacionamentos:
- [Entidade A] tem muitos [Entidade B]
- [Entidade B] pertence a [Entidade A]
```

### 5.2 Regras de Negócio Críticas

> Estas regras NUNCA podem ser violadas, independente do contexto.

1. **[Nome da Regra]**: [Descrição clara e sem ambiguidade]
   - Exemplo válido: [caso que respeita a regra]
   - Exemplo inválido: [caso que viola a regra]

2. **[Nome da Regra]**: [Descrição]

---

## 6. Padrões de Código Obrigatórios

### 6.1 Nomenclatura
- Arquivos: `kebab-case.ts` (ex: `order-service.ts`)
- Classes: `PascalCase` (ex: `OrderService`)
- Funções/variáveis: `camelCase` (ex: `createOrder`)
- Constantes: `UPPER_SNAKE_CASE` (ex: `MAX_RETRIES`)
- Banco de dados: `snake_case` (ex: `created_at`)

### 6.2 Estrutura de Funções
```typescript
// ✅ Padrão obrigatório: retorno explícito, sem side effects ocultos
async function createOrder(input: CreateOrderInput): Promise<Order> {
  // validação de input primeiro
  // lógica de negócio
  // persistência por último
}
```

### 6.3 Tratamento de Erros
```typescript
// ✅ Use erros de domínio tipados
throw new DomainError('ORDER_LIMIT_EXCEEDED', 'Usuário atingiu limite de pedidos')

// ❌ Nunca use erros genéricos sem contexto
throw new Error('algo deu errado')
```

---

## 7. O que a IA NUNCA deve fazer neste projeto

> Esta seção é crítica. Adicione novos itens sempre que a IA cometer um erro.

- ❌ Não crie migrações de banco sem aprovação explícita
- ❌ Não instale dependências sem listar e aguardar aprovação
- ❌ Não altere arquivos fora do escopo solicitado
- ❌ Não use `any` em TypeScript (ou equivalente em outras linguagens)
- ❌ Não faça chamadas HTTP externas em testes unitários
- ❌ Não commite, faça push ou deploys sem aprovação
- ❌ Não altere o `cloud.md` sem aprovação explícita

---

## 8. Arquitetura de APIs / Contratos

### Endpoints (se aplicável)

```
[MÉTODO] /[recurso]
  Request:  { [campo]: [tipo] }
  Response: { [campo]: [tipo] }
  Erros:    [código HTTP] — [descrição]
```

---

## 9. Decisões Arquiteturais (ADR)

| Data | Decisão | Motivo | Alternativas consideradas |
|------|---------|--------|--------------------------|
| [YYYY-MM-DD] | [ex: Usar PostgreSQL] | [ex: Necessidade de JSON e transações] | [ex: MongoDB, MySQL] |

---

## 10. Histórico de Erros Comuns da IA

> Preencha quando a IA violar uma regra. Serve como "memória do projeto".

| Data | Erro cometido | Regra violada | O que foi adicionado aqui |
|------|--------------|---------------|--------------------------|
| [YYYY-MM-DD] | [descrição] | [seção] | [nova regra/exemplo] |

---

## 11. Progresso por Fase (Método Akita)

| Fase | Status | Data início | Data conclusão |
|------|--------|------------|----------------|
| Fase 1: AI Jail | [ ] Pendente | — | — |
| Fase 2: Fundação (este arquivo) | [/] Em andamento | [data] | — |
| Fase 3: TDD | [ ] Pendente | — | — |
| Fase 4: Implementação | [ ] Pendente | — | — |
| Fase 5: Otimização | [ ] Pendente | — | — |
| Fase 6: Interface | [ ] Pendente | — | — |
| Fase 7: Deploy & CI/CD | [ ] Pendente | — | — |
