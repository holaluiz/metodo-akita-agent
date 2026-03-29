# =============================================================================
# Método Akita Agent — Instalador para Windows (PowerShell)
# =============================================================================
# Uso:
#   .\install.ps1                          → instala no diretório atual
#   .\install.ps1 -TargetPath "C:\meu-projeto"  → instala em outro diretório
#   .\install.ps1 -WithTemplates           → inclui templates cloud.md e Docker
# =============================================================================

param(
    [string]$TargetPath = ".",
    [switch]$WithTemplates = $false,
    [switch]$Force = $false
)

$ErrorActionPreference = "Stop"

# Cores para output
function Write-Step   { param($msg) Write-Host "  → $msg" -ForegroundColor Cyan }
function Write-Done   { param($msg) Write-Host "  ✓ $msg" -ForegroundColor Green }
function Write-Warn   { param($msg) Write-Host "  ⚠ $msg" -ForegroundColor Yellow }
function Write-Err    { param($msg) Write-Host "  ✗ $msg" -ForegroundColor Red }

Write-Host ""
Write-Host "🧠 Método Akita Agent — Instalador" -ForegroundColor Magenta
Write-Host "=====================================" -ForegroundColor Magenta
Write-Host ""

# Resolve o caminho alvo
$target = Resolve-Path $TargetPath -ErrorAction SilentlyContinue
if (-not $target) {
    Write-Err "Diretório '$TargetPath' não encontrado."
    exit 1
}
$targetStr = $target.Path

Write-Step "Instalando em: $targetStr"
Write-Host ""

# Define caminhos de origem (onde este script está)
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# -----------------------------------------------------------------------------
# 1. Instalar a Skill
# -----------------------------------------------------------------------------
Write-Host "📦 Instalando Skill..." -ForegroundColor White

$skillSource = Join-Path $scriptDir ".agent\skills\metodo-akita"
$skillDest   = Join-Path $targetStr ".agent\skills\metodo-akita"

if (Test-Path $skillDest) {
    if ($Force) {
        Remove-Item $skillDest -Recurse -Force
        Write-Warn "Skill existente removida (--Force)."
    } else {
        Write-Warn "Skill já instalada em '$skillDest'."
        Write-Warn "Use -Force para sobrescrever."
        $skip = $true
    }
}

if (-not $skip) {
    New-Item -ItemType Directory -Path $skillDest -Force | Out-Null
    Copy-Item "$skillSource\*" $skillDest -Recurse -Force
    Write-Done "Skill instalada → .agent/skills/metodo-akita/"
}
$skip = $false

# -----------------------------------------------------------------------------
# 2. Instalar os Workflows
# -----------------------------------------------------------------------------
Write-Host ""
Write-Host "⚡ Instalando Workflows..." -ForegroundColor White

$workflowsDir = Join-Path $targetStr ".agent\workflows"
New-Item -ItemType Directory -Path $workflowsDir -Force | Out-Null

$workflows = @(
    "akita-new-project.md",
    "akita-tdd-cycle.md",
    "akita-review.md"
)

foreach ($wf in $workflows) {
    $src  = Join-Path $scriptDir ".agent\workflows\$wf"
    $dest = Join-Path $workflowsDir $wf
    
    if ((Test-Path $dest) -and -not $Force) {
        Write-Warn "Workflow '$wf' já existe. Use -Force para sobrescrever."
    } else {
        Copy-Item $src $dest -Force
        Write-Done "Workflow instalado → .agent/workflows/$wf"
    }
}

# -----------------------------------------------------------------------------
# 3. Instalar Templates (opcional)
# -----------------------------------------------------------------------------
if ($WithTemplates) {
    Write-Host ""
    Write-Host "📋 Instalando Templates..." -ForegroundColor White

    $templatesSource = Join-Path $scriptDir "templates"
    $templatesDest   = Join-Path $targetStr "akita-templates"

    if (Test-Path $templatesDest) {
        Write-Warn "Pasta 'akita-templates' já existe. Pulando."
    } else {
        New-Item -ItemType Directory -Path $templatesDest -Force | Out-Null
        Copy-Item "$templatesSource\*" $templatesDest -Recurse -Force
        Write-Done "Templates instalados → akita-templates/"
    }
}

# -----------------------------------------------------------------------------
# 4. Resumo final
# -----------------------------------------------------------------------------
Write-Host ""
Write-Host "=====================================" -ForegroundColor Magenta
Write-Host "✅ Instalação concluída!" -ForegroundColor Green
Write-Host ""
Write-Host "Próximos passos:" -ForegroundColor White
Write-Host "  1. Abra seu projeto no Antigravity"
Write-Host "  2. Use /akita-new-project para iniciar"
Write-Host "  3. Preencha o cloud.md com a arquitetura do seu projeto"
Write-Host ""
if (-not $WithTemplates) {
    Write-Host "  💡 Dica: rode com -WithTemplates para incluir o template cloud.md e Docker"
    Write-Host ""
}
