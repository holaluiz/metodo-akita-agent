#!/usr/bin/env bash
# =============================================================================
# Método Akita Agent — Instalador para Mac/Linux (bash)
# =============================================================================
# Uso:
#   ./install.sh                         → instala no diretório atual
#   ./install.sh /caminho/meu-projeto    → instala em outro diretório
#   ./install.sh --with-templates        → inclui templates cloud.md e Docker
#   ./install.sh --force                 → sobrescreve instalações existentes
# =============================================================================

set -euo pipefail

# --- Cores ---
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
MAGENTA='\033[0;35m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

step()  { echo -e "  ${CYAN}→ $1${NC}"; }
done_() { echo -e "  ${GREEN}✓ $1${NC}"; }
warn()  { echo -e "  ${YELLOW}⚠ $1${NC}"; }
err()   { echo -e "  ${RED}✗ $1${NC}"; exit 1; }

# --- Parseamento de argumentos ---
TARGET_PATH="."
WITH_TEMPLATES=false
FORCE=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --with-templates) WITH_TEMPLATES=true; shift ;;
        --force)          FORCE=true; shift ;;
        -*)               err "Opção desconhecida: $1" ;;
        *)                TARGET_PATH="$1"; shift ;;
    esac
done

# --- Header ---
echo ""
echo -e "${MAGENTA}🧠 Método Akita Agent — Instalador${NC}"
echo -e "${MAGENTA}=====================================${NC}"
echo ""

# Resolve caminhos
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ ! -d "$TARGET_PATH" ]]; then
    err "Diretório '$TARGET_PATH' não encontrado."
fi

TARGET_PATH="$(cd "$TARGET_PATH" && pwd)"
step "Instalando em: $TARGET_PATH"
echo ""

# =============================================================================
# 1. Instalar a Skill
# =============================================================================
echo -e "${WHITE}📦 Instalando Skill...${NC}"

SKILL_SRC="$SCRIPT_DIR/.agent/skills/metodo-akita"
SKILL_DEST="$TARGET_PATH/.agent/skills/metodo-akita"

if [[ -d "$SKILL_DEST" ]]; then
    if [[ "$FORCE" == "true" ]]; then
        rm -rf "$SKILL_DEST"
        warn "Skill existente removida (--force)."
    else
        warn "Skill já instalada em '$SKILL_DEST'."
        warn "Use --force para sobrescrever."
        SKIP_SKILL=true
    fi
fi

if [[ "${SKIP_SKILL:-false}" != "true" ]]; then
    mkdir -p "$SKILL_DEST"
    cp -r "$SKILL_SRC/"* "$SKILL_DEST/"
    done_ "Skill instalada → .agent/skills/metodo-akita/"
fi

# =============================================================================
# 2. Instalar os Workflows
# =============================================================================
echo ""
echo -e "${WHITE}⚡ Instalando Workflows...${NC}"

WORKFLOWS_DIR="$TARGET_PATH/.agent/workflows"
mkdir -p "$WORKFLOWS_DIR"

WORKFLOWS=("akita-new-project.md" "akita-tdd-cycle.md" "akita-review.md")

for wf in "${WORKFLOWS[@]}"; do
    SRC="$SCRIPT_DIR/.agent/workflows/$wf"
    DEST="$WORKFLOWS_DIR/$wf"

    if [[ -f "$DEST" ]] && [[ "$FORCE" != "true" ]]; then
        warn "Workflow '$wf' já existe. Use --force para sobrescrever."
    else
        cp "$SRC" "$DEST"
        done_ "Workflow instalado → .agent/workflows/$wf"
    fi
done

# =============================================================================
# 3. Instalar Templates (opcional)
# =============================================================================
if [[ "$WITH_TEMPLATES" == "true" ]]; then
    echo ""
    echo -e "${WHITE}📋 Instalando Templates...${NC}"

    TEMPLATES_SRC="$SCRIPT_DIR/templates"
    TEMPLATES_DEST="$TARGET_PATH/akita-templates"

    if [[ -d "$TEMPLATES_DEST" ]] && [[ "$FORCE" != "true" ]]; then
        warn "Pasta 'akita-templates' já existe. Use --force para sobrescrever."
    else
        mkdir -p "$TEMPLATES_DEST"
        cp -r "$TEMPLATES_SRC/"* "$TEMPLATES_DEST/"
        done_ "Templates instalados → akita-templates/"
    fi
fi

# =============================================================================
# 4. Resumo final
# =============================================================================
echo ""
echo -e "${MAGENTA}=====================================${NC}"
echo -e "${GREEN}✅ Instalação concluída!${NC}"
echo ""
echo -e "${WHITE}Próximos passos:${NC}"
echo "  1. Abra seu projeto no Antigravity"
echo "  2. Use /akita-new-project para iniciar"
echo "  3. Preencha o cloud.md com a arquitetura do seu projeto"
echo ""
if [[ "$WITH_TEMPLATES" != "true" ]]; then
    echo "  💡 Dica: rode com --with-templates para incluir o template cloud.md e Docker"
    echo ""
fi
