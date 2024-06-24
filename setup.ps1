# ------------------------------------------------------------------------------
# Script PowerShell para verificar e instalar Node.js, verificar e limpar depend�ncias corrompidas, e rodar servidor local com npm
# Autor: Jean Carlos Lopes Lellis
# Data: 24 de Junho de 2024
# Descri��o: Este script automatiza a verifica��o e instala��o do Node.js, valida��o e instala��o das depend�ncias do projeto, e inicializa��o de um servidor local.
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Isen��o de Responsabilidade
# ------------------------------------------------------------------------------
# ESTE SCRIPT � FORNECIDO "NO ESTADO EM QUE SE ENCONTRA" E "CONFORME DISPON�VEL",
# SEM GARANTIAS DE QUALQUER TIPO, EXPRESSAS OU IMPL�CITAS, INCLUINDO, MAS N�O
# LIMITADO �S GARANTIAS DE COMERCIALIZA��O, ADEQUA��O A UM PROP�SITO ESPEC�FICO E
# N�O VIOLA��O. VOC� USA ESTE SCRIPT POR SUA CONTA E RISCO. EM NENHUMA
# CIRCUNST�NCIA O AUTOR SER� RESPONS�VEL POR QUAISQUER DANOS DECORRENTES DO USO
# DESTE SCRIPT.
# ------------------------------------------------------------------------------

# Fun��o para verificar se o Node.js est� instalado
function Check-NodeJS {
    try {
        node --version
        return $true
    } catch {
        return $false
    }
}

# Fun��o para instalar o Node.js
function Install-NodeJS {
    Write-Host "Node.js n�o est� instalado."
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
        Write-Host "Instala��o do Node.js foi cancelada. O script ser� encerrado."
        exit
    }
}

# Fun��o para verificar se as depend�ncias do projeto est�o instaladas
function Check-Dependencies {
    $nodeModulesPath = Join-Path -Path $projectRelativePath -ChildPath "node_modules"
    return Test-Path $nodeModulesPath
}

# Fun��o para verificar corrup��o nas depend�ncias
function Check-DependencyIntegrity {
    try {
        npm ls --json | Out-Null
        return $true
    } catch {
        return $false
    }
}

# Verifica se o Node.js est� instalado
if (-not (Check-NodeJS)) {
    Install-NodeJS
}

# Continua com a execu��o se o Node.js estiver instalado
if (Check-NodeJS) {
    Write-Host "Node.js est� instalado. Continuando com a execu��o..."

    # Define o caminho relativo do projeto
    $projectRelativePath = ".\"
    Set-Location -Path $projectRelativePath

    # Verifica se as depend�ncias est�o instaladas
    $dependenciesInstalled = Check-Dependencies
    $integrity = Check-DependencyIntegrity

    if ($dependenciesInstalled -and $integrity) {
        Write-Host "Depend�ncias j� est�o instaladas e est�o �ntegras."
    } else {
        if ($dependenciesInstalled) {
            Write-Host "Depend�ncias est�o corrompidas ou incompletas. Limpando e reinstalando..."
            npm ci
        } else {
            Write-Host "Depend�ncias n�o est�o instaladas. Instalando as depend�ncias do projeto..."
            npm install
        }
    }

    # Inicia o servidor local
    Write-Host "Iniciando o servidor local..."
    npm start
}
