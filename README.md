### README.md (English)

---

# Setup and Run Script for Node.js Projects

## Description

This PowerShell script automates the process of verifying and installing Node.js, validating and installing project dependencies, and starting a local server. It ensures that all necessary dependencies are correctly installed and intact, providing a seamless setup for your development environment.

## Features

- **Node.js Verification**:
  - Checks if Node.js is installed on the system.
  - If not installed, prompts the user to install it.

- **Dependency Verification**:
  - Checks if the project dependencies (node_modules) are installed.
  - Validates the integrity of installed dependencies.

- **Dependency Installation and Cleanup**:
  - Cleans and reinstalls dependencies if they are missing or corrupted.

- **Local Server Initialization**:
  - Starts the local server using `npm start` after ensuring all dependencies are correct.

## Project Structure

Ensure your project follows this directory structure for the script to function correctly:

```
project-root
├── setup.ps1
├── index.html
├── package.json
├── package-lock.json
└── (other project files)
```

## Prerequisites

- **Windows PowerShell**: Ensure PowerShell is installed and configured on your system.
- **Administrator Permissions**: The script must be run with administrator permissions to install Node.js.
- **Script Execution Policy**: The script execution policy must allow local script execution. Configure it using the command:
  ```powershell
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
  ```

## Usage

### Saving the Script

Place the script `setup.ps1` in the root directory of your project.

### Executing the Script

1. **Abra o PowerShell** com permissões de administrador.
2. **Navegue até a raiz do seu projeto** onde o script está localizado.
3. **Execute o script** usando o comando:
   ```powershell
   .\setup.ps1
   ```

### Script Execution Flow

1. **Node.js Verification**:
   - The script attempts to check the Node.js version.
   - If Node.js is not installed, it prompts the user for permission to install it.

2. **Node.js Installation**:
   - If the user agrees, the script downloads and installs the specified version of Node.js.

3. **Dependency Verification**:
   - The script checks if the `node_modules` folder exists.
   - If it exists, it validates the integrity of the dependencies using `npm ls`.

4. **Dependency Installation/Cleanup**:
   - If dependencies are corrupted or incomplete, the script runs `npm ci` to clean and reinstall dependencies.
   - If dependencies are not installed, the script runs `npm install`.

5. **Local Server Initialization**:
   - After ensuring all dependencies are correct, the script starts the local server using `npm start`.

## Author

Jean Carlos Lopes Lellis

## Disclaimer

THIS SCRIPT IS PROVIDED "AS IS" AND "AS AVAILABLE", WITHOUT WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT. YOU USE THIS SCRIPT AT YOUR OWN RISK. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DAMAGES RESULTING FROM THE USE OF THIS SCRIPT.

---


### README.md (Português)

---

# Script de Configuração e Execução para Projetos Node.js

## Descrição

Este script PowerShell automatiza o processo de verificação e instalação do Node.js, validação e instalação das dependências do projeto e inicialização de um servidor local. Ele garante que todas as dependências necessárias estejam corretamente instaladas e intactas, proporcionando uma configuração perfeita para o seu ambiente de desenvolvimento.

## Funcionalidades

- **Verificação do Node.js**:
  - Verifica se o Node.js está instalado no sistema.
  - Se não estiver instalado, solicita ao usuário permissão para instalá-lo.

- **Verificação das Dependências**:
  - Verifica se as dependências do projeto (node_modules) estão instaladas.
  - Valida a integridade das dependências instaladas.

- **Instalação e Limpeza de Dependências**:
  - Limpa e reinstala as dependências se elas estiverem ausentes ou corrompidas.

- **Inicialização do Servidor Local**:
  - Inicia o servidor local usando `npm start` após garantir que todas as dependências estão corretas.

## Estrutura do Projeto

Certifique-se de que seu projeto segue esta estrutura de diretórios para o script funcionar corretamente:

```
raiz-do-projeto
├── setup.ps1
├── index.html
├── package.json
├── package-lock.json
└── (outros arquivos do projeto)
```

## Pré-requisitos

- **Windows PowerShell**: Certifique-se de que o PowerShell está instalado e configurado no seu sistema.
- **Permissões de Administrador**: O script deve ser executado com permissões de administrador para instalar o Node.js.
- **Política de Execução de Scripts**: A política de execução do script deve permitir a execução de scripts locais. Configure isso usando o comando:
  ```powershell
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
  ```

## Uso

### Salvando o Script

Coloque o script `setup.ps1` no diretório raiz do seu projeto.

### Executando o Script

1. **Abra o PowerShell** com permissões de administrador.
2. **Navegue até a raiz do seu projeto** onde o script está localizado.
3. **Execute o script** usando o comando:
   ```powershell
   .\setup.ps1
   ```

### Fluxo de Execução do Script

1. **Verificação do Node.js**:
   - O script tenta verificar a versão do Node.js.
   - Se o Node.js não estiver instalado, solicita ao usuário permissão para instalá-lo.

2. **Instalação do Node.js**:
   - Se o usuário concordar, o script faz o download e instala a versão especificada do Node.js.

3. **Verificação das Dependências**:
   - O script verifica se a pasta `node_modules` existe.
   - Se existir, valida a integridade das dependências usando `npm ls`.

4. **Instalação/Limpeza de Dependências**:
   - Se as dependências estiverem corrompidas ou incompletas, o script executa `npm ci` para limpar e reinstalar as dependências.
   - Se as dependências não estiverem instaladas, o script executa `npm install`.

5. **Inicialização do Servidor Local**:
   - Após garantir que todas as dependências estão corretas, o script inicia o servidor local usando `npm start`.

## Autor

Jean Carlos Lopes Lellis

## Isenção de Responsabilidade

ESTE SCRIPT É FORNECIDO "NO ESTADO EM QUE SE ENCONTRA" E "CONFORME DISPONÍVEL", SEM GARANTIAS DE QUALQUER TIPO, EXPRESSAS OU IMPLÍCITAS, INCLUINDO, MAS NÃO LIMITADO ÀS GARANTIAS IMPLÍCITAS DE COMERCIABILIDADE, ADEQUAÇÃO A UM PROPÓSITO ESPECÍFICO E NÃO VIOLAÇÃO. VOCÊ USA ESTE SCRIPT POR SUA CONTA E RISCO. EM NENHUMA CIRCUNSTÂNCIA O AUTOR SERÁ RESPONSÁVEL POR QUAISQUER DANOS RESULTANTES DO USO DESTE SCRIPT.

---
