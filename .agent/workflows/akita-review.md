---
description: Revisar código gerado pela IA antes de aceitar (Método Akita)
---

# /akita-review

Use este workflow SEMPRE que a IA gerar código ou propor alterações.
**Nunca aceite código sem passar por este checklist.**

---

## Checklist de Revisão de Código

### 1. Conformidade com `cloud.md`
- [ ] O código usa a stack definida no `cloud.md`?
- [ ] O código segue os padrões de nomenclatura definidos?
- [ ] O código usa as abstrações/interfaces já definidas no projeto?
- [ ] O código não viola nenhuma regra de negócio documentada?

### 2. Qualidade do Código
- [ ] Cada função faz uma única coisa (Single Responsibility)?
- [ ] Os nomes de variáveis/funções são descritivos?
- [ ] Não há `console.log`, `print`, ou debug statements?
- [ ] Não há credenciais ou secrets hardcoded?
- [ ] Tratamento de erros está presente onde necessário?

### 3. Segurança
- [ ] Inputs do usuário são validados/sanitizados?
- [ ] Queries SQL usam parameterização (sem concatenação direta)?
- [ ] Não há dependências desnecessárias adicionadas?
- [ ] Variáveis de ambiente são usadas para configuração sensível?

### 4. Testes
- [ ] O código novo tem pelo menos um teste cobrindo o caminho feliz?
- [ ] Casos de erro críticos têm testes?
- [ ] Os testes existentes continuam passando?

### 5. Escopo
- [ ] A IA criou apenas os arquivos solicitados?
- [ ] Não há alterações em arquivos não relacionados à feature?
- [ ] O commit/PR é atômico (uma feature por vez)?

---

## Se Algo Falhar no Checklist

**NÃO corrija manualmente.** Siga este protocolo:

1. Identifique qual regra foi violada
2. Verifique se a regra está no `cloud.md`
   - Se não estiver: **adicione primeiro ao `cloud.md`**
   - Se estiver: anote que a IA ignorou a regra
3. Explique o problema para a IA com contexto específico:
   ```
   "O código gerado viola a regra X (definida em cloud.md, seção Y).
   Especificamente, [detalhe o problema].
   Por favor, corrija apenas esta parte, mantendo o restante igual."
   ```
4. Execute o ciclo novamente a partir do ponto de falha

---

## Registro de Erros da IA

Mantenha um registro no `cloud.md` (seção "Histórico de Erros Comuns"):
```markdown
## Histórico de Erros Comuns da IA neste Projeto

| Data | Erro | Regra Violada | Correção no cloud.md |
|------|------|---------------|----------------------|
| YYYY-MM-DD | [descrição] | [seção] | [o que foi adicionado] |
```

Este registro é o "treinamento" do contexto do projeto.
