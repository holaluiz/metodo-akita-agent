---
description: Ciclo TDD do Método Akita para implementar uma feature com segurança
---

# /akita-tdd-cycle

Use este workflow para implementar qualquer nova feature seguindo Red-Green-Refactor.

**Input obrigatório**: Nome da feature e sua descrição de comportamento.

---

## Passo 1 — Definir o comportamento (em linguagem natural)

Antes de qualquer código, escreva em linguagem natural:

```
Feature: [Nome da Feature]
Como: [tipo de usuário]
Quero: [ação]
Para: [benefício]

Cenários:
- Dado [contexto], quando [ação], então [resultado esperado]
- Dado [contexto de erro], quando [ação inválida], então [erro esperado]
```

## Passo 2 — Escrever o teste (RED 🔴)

Peça para a IA escrever o teste baseado nos cenários acima:

```
Prompt para IA:
"Com base no cloud.md e nos cenários abaixo, escreva os testes unitários
para a feature [Nome]. Use [framework de teste]. 
Não escreva a implementação, apenas os testes.

Cenários:
[cole os cenários]"
```

Verifique que o teste:
- [ ] Cobre o caminho feliz (happy path)
- [ ] Cobre pelo menos um caso de erro
- [ ] Não tem dependências externas desnecessárias (use mocks)
- [ ] Tem nomes descritivos (describe/it ou equivalente)

// turbo
Execute o teste para confirmar que FALHA (Red):
```bash
npm test -- --testPathPattern=[nome-do-arquivo-de-teste]
```

## Passo 3 — Implementar o mínimo (GREEN 🟢)

Prompt padrão para a IA:
```
"Este é o teste que deve passar:
[cole o arquivo de teste]

Este é o contexto do projeto (cloud.md):
[cole as seções relevantes do cloud.md]

Implemente apenas o código mínimo necessário para este teste passar.
- Não adicione lógica além do que os testes exigem
- Siga os padrões de código do cloud.md
- Não crie arquivos além dos necessários"
```

**Antes de aceitar o código:**
- [ ] Leia cada linha gerada
- [ ] Verifique se segue os padrões do `cloud.md`
- [ ] Confirme que não criou arquivos desnecessários

// turbo
Execute os testes:
```bash
npm test
```

Todos devem passar. Se falhar: **não corrija na mão** — explique o erro para a IA.

## Passo 4 — Refatorar (REFACTOR 🔵)

Only after GREEN:

1. Identifique duplicação ou código obscuro
2. Peça para a IA refatorar com o constraint: "mantenha todos os testes passando"
3. Execute os testes após cada refatoração

// turbo
```bash
npm test
```

## Passo 5 — Atualizar `cloud.md` se necessário

Se durante a implementação descobriu algo novo (regra de negócio, edge case, padrão):
- Abra o `cloud.md` e adicione a nova informação
- Commit com a mensagem: `docs: atualiza cloud.md com [o que foi aprendido]`

## Passo 6 — Commit

```bash
git add .
git commit -m "feat: [nome da feature] — testes: X passando"
```

---

## Regras Anti-Vibe deste Ciclo

| Situação | Regra |
|----------|-------|
| IA gerou código que quebrou outro teste | Não aceite — peça para ela corrigir |
| Teste está difícil de escrever | O design está errado — refatore a interface primeiro |
| Tentação de escrever código "rápido" sem teste | PARE — é exatamente aqui que o vibe coding começa |
| IA ignorou um padrão do cloud.md | Rejeite e adicione um exemplo explícito no cloud.md |
