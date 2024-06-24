# ------------------------------------------------------------------------------
# Script PowerShell para verificar e instalar Node.js, verificar e limpar dependências corrompidas, e rodar servidor local com npm
# Autor: Jean Carlos Lopes Lellis
# Data: 24 de Junho de 2024
# Descrição: Este script automatiza a verificação e instalação do Node.js, validação e instalação das dependências do projeto, e inicialização de um servidor local.
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Isenção de Responsabilidade
# ------------------------------------------------------------------------------
# ESTE SCRIPT É FORNECIDO "NO ESTADO EM QUE SE ENCONTRA" E "CONFORME DISPONÍVEL",
# SEM GARANTIAS DE QUALQUER TIPO, EXPRESSAS OU IMPLÍCITAS, INCLUINDO, MAS NÃO
# LIMITADO ÀS GARANTIAS DE COMERCIALIZAÇÃO, ADEQUAÇÃO A UM PROPÓSITO ESPECÍFICO E
# NÃO VIOLAÇÃO. VOCÊ USA ESTE SCRIPT POR SUA CONTA E RISCO. EM NENHUMA
# CIRCUNSTÂNCIA O AUTOR SERÁ RESPONSÁVEL POR QUAISQUER DANOS DECORRENTES DO USO
# DESTE SCRIPT.
# ------------------------------------------------------------------------------

# Função para verificar se o Node.js está instalado
function Check-NodeJS {
    try {
        node --version
        return $true
    } catch {
        return $false
    }
}

# Função para instalar o Node.js
function Install-NodeJS {
    Write-Host "Node.js não está instalado."
    $install = Read-Host "Deseja instalar o Node.js agora? (s/n)"
    if ($install -eq 's') {
        # Baixar e instalar Node.js
        $nodeInstaller = "https://nodejs.org/dist/v18.16.1/node-v18.16.1-x64.msi"
        $installerPath = "$env:TEMP\node-v18.16.1-x64.msi"
        Invoke-WebRequest -Uri $nodeInstaller -OutFile $installerPath
        Start-Process msiexec.exe -ArgumentList "/i", $installerPath, "/quiet", "/norestart" -Wait
        Remove-Item $installerPath
        Write-Host "Node.js foi instalado com sucesso."
    } else {
        Write-Host "Instalação do Node.js foi cancelada. O script será encerrado."
        exit
    }
}

# Função para verificar se as dependências do projeto estão instaladas
function Check-Dependencies {
    $nodeModulesPath = Join-Path -Path $projectRelativePath -ChildPath "node_modules"
    return Test-Path $nodeModulesPath
}

# Função para verificar corrupção nas dependências
function Check-DependencyIntegrity {
    try {
        npm ls --json | Out-Null
        return $true
    } catch {
        return $false
    }
}

# Verifica se o Node.js está instalado
if (-not (Check-NodeJS)) {
    Install-NodeJS
}

# Continua com a execução se o Node.js estiver instalado
if (Check-NodeJS) {
    Write-Host "Node.js está instalado. Continuando com a execução..."

    # Define o caminho relativo do projeto
    $projectRelativePath = ".\"
    Set-Location -Path $projectRelativePath

    # Verifica se as dependências estão instaladas
    $dependenciesInstalled = Check-Dependencies
    $integrity = Check-DependencyIntegrity

    if ($dependenciesInstalled -and $integrity) {
        Write-Host "Dependências já estão instaladas e estão íntegras."
    } else {
        if ($dependenciesInstalled) {
            Write-Host "Dependências estão corrompidas ou incompletas. Limpando e reinstalando..."
            npm ci
        } else {
            Write-Host "Dependências não estão instaladas. Instalando as dependências do projeto..."
            npm install
        }
    }

    # Inicia o servidor local
    Write-Host "Iniciando o servidor local..."
    npm start
}
