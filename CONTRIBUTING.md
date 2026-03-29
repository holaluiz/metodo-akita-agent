# Contribuindo com o Método Akita Agent

Obrigado por querer contribuir! Este projeto segue o próprio Método Akita para aceitar contribuições. 😄

---

## Tipos de Contribuição

### 🐛 Bugs e Melhorias de Documentação
Abra uma [Issue](../../issues/new) descrevendo:
- O que você esperava que acontecesse
- O que aconteceu de fato
- Qual Antigravity e OS você está usando

### ✨ Novas Features ou Workflows
Antes de implementar, **sempre abra uma Issue primeiro** para discutir a proposta. Issues não aprovadas não serão mergeadas.

### 📚 Novos Templates
Templates para stacks específicas (ex: FastAPI, Next.js, Go fiber) são muito bem-vindos!

---

## Processo de Pull Request

1. **Fork** o repositório
2. **Crie uma branch** descritiva:
   ```bash
   git checkout -b feat/workflow-deploy-vercel
   # ou
   git checkout -b fix/skill-fase-3-tdd
   # ou
   git checkout -b docs/template-fastapi
   ```

3. **Faça suas mudanças** seguindo as regras abaixo

4. **Commit com mensagem clara**:
   ```bash
   git commit -m "feat: adiciona workflow de deploy para Vercel"
   git commit -m "fix: corrige caminho do template no install.sh"
   git commit -m "docs: adiciona template cloud.md para stack FastAPI"
   ```

5. **Abra o Pull Request** com:
   - Descrição clara do que mudou
   - **Por que** a mudança é necessária
   - Como testar

---

## Regras de Qualidade

### Para SKILL.md e Workflows
- Linguagem em **português brasileiro**
- Cada passo deve ser **acionável e específico** (nada vago como "configure o ambiente")
- Use **exemplos reais de prompts** quando possível
- Inclua o que fazer quando algo **der errado**

### Para Templates
- Comente cada seção não-óbvia
- Não deixe valores hardcoded (use variáveis de ambiente)
- Inclua comentários `# Personalize aqui` nas seções que variam por projeto

### Para Scripts (install.ps1 / install.sh)
- Teste em ambiente limpo antes de submeter
- Inclua mensagens de erro úteis
- Não modifique arquivos fora de `.agent/` e `akita-templates/` sem confirmação explícita
- Suporte tanto instalação fresca quanto `--force`

---

## O que NÃO aceito

- PRs que "apenas melhoram o texto" sem substância técnica
- Features não discutidas em Issues previamente
- Código gerado por IA sem revisão (irônico, mas necessário 😄)
- Mudanças que violam os princípios do Método Akita

---

## Dúvidas?

Abra uma [Discussion](../../discussions) no GitHub.
