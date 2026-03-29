---
description: Iniciar um novo projeto usando o Método Akita (Anti-Vibe Coding)
---

# /akita-new-project

Use este workflow ao iniciar qualquer projeto novo com o Método Akita.

## Pré-requisitos
- Responda o checklist da FASE 0 do SKILL.md antes de começar
- Tenha Docker instalado (para o AI Jail)

---

## Passo 1 — Criar estrutura de pastas do monorepo

```bash
mkdir -p src tests/unit tests/integration tests/e2e .docker docs
touch cloud.md .env.example .gitignore README.md
```

## Passo 2 — Inicializar o cloud.md com o template

Copie o conteúdo de `templates/cloud.md` para o `cloud.md` do projeto e preencha TODOS os campos.

```bash
copy "d:\CODIGOS\Metodo Akita\templates\cloud.md" ".\cloud.md"
```

## Passo 3 — Configurar AI Jail (Docker)

```bash
# Copie os arquivos de Docker do template
copy "d:\CODIGOS\Metodo Akita\templates\.docker\Dockerfile.dev" ".\.docker\Dockerfile.dev"
copy "d:\CODIGOS\Metodo Akita\templates\docker-compose.dev.yml" ".\docker-compose.dev.yml"
```

Edite os arquivos para adequar à stack do projeto.

## Passo 4 — Inicializar Git e dependências

```bash
git init
git add .
git commit -m "chore: estrutura inicial do projeto (Método Akita)"
```

## Passo 5 — Configurar CI/CD base

Crie o arquivo `.github/workflows/ci.yml` com as etapas de lint, testes e segurança.

## Passo 6 — Primeira sessão TDD

Siga o workflow `/akita-tdd-cycle` para implementar a primeira feature.

---

## Checklist de Conclusão

- [ ] `cloud.md` completamente preenchido (mín. 50 linhas)
- [ ] Estrutura de pastas criada
- [ ] Docker configurado e testado
- [ ] Git inicializado com commit inicial
- [ ] CI/CD base configurado
- [ ] Nenhuma linha de código de produção escrita ainda
