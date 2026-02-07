# Make tab completion looks like unix
# Check if PSREDLINE is installed
if (-not (Get-PSResource -Name PSReadLine)){
    # Install the PSResource if it's not installed
    Write-Host "Instaling  PSReadLine resource..."
    Install-PSResource -Name PSReadLine
}

Import-Module PSReadLine -Force

Set-PSReadLineKeyHandler -Key Ctrl+p -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key Ctrl+n -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Shift+Tab -Function AcceptSuggestion 
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t'
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'

# Check if Terminal-Icons module is installed
if (-not (Get-Module -Name Terminal-Icons -ListAvailable)) {
     # Install the module if it's not installed
     Write-Host "Installing Terminal-Icons module..."
     Install-Module -Name Terminal-Icons -Scope CurrentUser -Force
}
# Import the module
Import-Module -Name Terminal-Icons



$fzf_functions = Join-Path -Path $PSScriptRoot -ChildPath "FzFCustomFunctions.ps1"
. $fzf_functions
$exports = Join-Path -Path $PSScriptRoot -ChildPath "exports.ps1"
. $exports
$aliases = Join-Path -Path $PSScriptRoot -ChildPath "aliases.ps1"
. $aliases
$completions = Join-Path -Path $PSScriptRoot -ChildPath "completions.ps1"
. $completions

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })
