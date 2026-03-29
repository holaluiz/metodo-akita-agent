<div align="center">

# 🧠 Método Akita — Agente Antigravity

**Anti-Vibe Coding para engenheiros sérios.**

Um agente para o [Antigravity](https://antigravity.dev) que guia você na construção de sistemas com disciplina real: arquitetura primeiro, TDD obrigatório e IA como copiloto — nunca como piloto.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Antigravity Agent](https://img.shields.io/badge/Antigravity-Agent-6C47FF?style=flat)](https://antigravity.dev)
[![Anti-Vibe Coding](https://img.shields.io/badge/Anti--Vibe-Coding-FF4444?style=flat)](https://github.com/akitaonrails/akitaonrails)

</div>

---

## O que é o Método Akita?

O Método Akita é uma abordagem de engenharia disciplinada para usar IA no desenvolvimento de software. O objetivo não é gerar código rapidamente — é **governar** o código gerado com rigor.

> "Você não vibra com o código. Você o governa."

### Os 5 Pilares

| Pilar | Descrição |
|-------|-----------|
| **1. Disciplina > Intuição** | Regras e arquitetura pré-definida antes de qualquer código |
| **2. Esqueleto antes dos Órgãos** | Você define a arquitetura (`cloud.md`); a IA preenche a lógica |
| **3. Pair Programming** | Você é o Piloto (decisões), a IA é o Copiloto (código bruto) |
| **4. TDD obrigatório** | Nenhum código de produção existe sem um teste que o justifique |
| **5. AI Jail** | Agentes de IA rodam em containers Docker isolados, nunca soltos |

---

## 🚀 Instalação

### Pré-requisito

Este agente requer o **Antigravity** instalado e configurado.

### Opção 1 — Script automático (recomendado)

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/holaluiz/metodo-akita-agent/main/install.ps1 | iex
```

**Mac/Linux (bash):**
```bash
curl -sSL https://raw.githubusercontent.com/holaluiz/metodo-akita-agent/main/install.sh | bash
```

### Opção 2 — Instalação manual

1. Clone este repositório:
```bash
git clone https://github.com/holaluiz/metodo-akita-agent.git
```

2. Execute o script de instalação apontando para o diretório do seu projeto:
```bash
# Windows
.\install.ps1 -TargetPath "C:\Caminho\para\seu\projeto"

# Mac/Linux
./install.sh /caminho/para/seu/projeto
```

3. Ou copie os arquivos manualmente:
```bash
# Copie a skill
cp -r .agent/skills/metodo-akita  /seu-projeto/.agent/skills/

# Copie os workflows
cp .agent/workflows/akita-*.md  /seu-projeto/.agent/workflows/

# Copie os templates (opcional, mas recomendado)
cp -r templates/  /seu-projeto/akita-templates/
```

---

## 📂 Estrutura do Agente

```
metodo-akita-agent/
├── .agent/
│   ├── skills/
│   │   └── metodo-akita/
│   │       └── SKILL.md          ← Skill principal do agente
│   └── workflows/
│       ├── akita-new-project.md  ← Iniciar projetos do zero
│       ├── akita-tdd-cycle.md    ← Ciclo TDD por feature
│       └── akita-review.md       ← Revisar código da IA
└── templates/
    ├── cloud.md                  ← Template do "cérebro do projeto"
    ├── docker-compose.dev.yml    ← AI Jail boilerplate
    └── .docker/
        └── Dockerfile.dev        ← Container de desenvolvimento
```

---

## 🛠️ Como Usar

Após instalar, os seguintes comandos estarão disponíveis no Antigravity:

### `/akita-new-project`
Inicia um novo projeto seguindo o Método Akita completo.
```
/akita-new-project
```
O agente vai:
1. Fazer o checklist de onboarding (stack, domínio, regras de negócio)
2. Criar a estrutura de pastas
3. Preencher o `cloud.md` com você
4. Configurar o AI Jail (Docker)
5. Preparar o ambiente de testes

### `/akita-tdd-cycle`
Implementa uma feature com o ciclo Red → Green → Refactor.
```
/akita-tdd-cycle
```
Sempre que quiser adicionar uma nova feature ao projeto, use este workflow. Ele garante que você escreva o teste antes do código.

### `/akita-review`
Checklist de revisão antes de aceitar qualquer código gerado por IA.
```
/akita-review
```
Use SEMPRE antes de aceitar um bloco de código da IA. Garante conformidade com o `cloud.md` e boas práticas.

---

## 📅 O Desafio Anti-Vibe Coding (7 Dias)

| Dia | Fase | O que fazer |
|-----|------|------------|
| 1 | **AI Jail** | Configurar ambiente isolado (Docker) e governança |
| 2 | **Fundação** | Planejar arquitetura e escrever o `cloud.md` completo |
| 3 | **TDD** | Escrever cobertura de testes para as features |
| 4 | **Mão na Massa** | Gerar código que faça os testes passarem |
| 5 | **Otimização** | Refatoração, performance e limpeza |
| 6 | **Interface** | Web, Bot, App ou API |
| 7 | **Deploy & CI/CD** | Pipeline com lint, segurança e deploy |

---

## 📄 O `cloud.md` — O Cérebro do Projeto

O arquivo `cloud.md` é o documento mais crítico de qualquer projeto que usa o Método Akita. Ele contém:

- Stack tecnológica com versões exatas
- Variáveis de ambiente necessárias
- Estrutura de pastas comentada
- Entidades do domínio e seus relacionamentos
- Regras de negócio (em linguagem natural)
- Padrões de código obrigatórios
- O que a IA **nunca** deve fazer no projeto
- Histórico de erros da IA (memória do projeto)

Use o template em `templates/cloud.md` como ponto de partida.

> **Regra de Desapego**: Se a IA errar, não corrija na mão. Explique o erro e atualize o `cloud.md`. Isso "treina" o contexto do projeto.

---

## 🛡️ AI Jail — Segurança em Primeiro Lugar

Nunca rode agentes de IA soltos na sua máquina. Use Docker:

```bash
# Suba o ambiente isolado
docker compose -f docker-compose.dev.yml up -d

# Work inside the container
docker compose -f docker-compose.dev.yml exec app bash
```

O template em `templates/docker-compose.dev.yml` inclui: app, PostgreSQL e Redis prontos para desenvolvimento.

---

## 🤝 Contribuindo

1. Faça um fork do repositório
2. Crie uma branch: `git checkout -b feature/minha-melhoria`
3. Siga o Método Akita para implementar (claro! 😄)
4. Abra um Pull Request com a descrição do que mudou e **por quê**

Consulte [CONTRIBUTING.md](./CONTRIBUTING.md) para mais detalhes.

---

## 📜 Licença

MIT — use à vontade, com ou sem atribuição.

---

<div align="center">

**Construído com disciplina. Governado com rigor. Sem vibe coding.**

</div>
