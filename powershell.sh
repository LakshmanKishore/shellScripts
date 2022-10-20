$time = Get-Date
$EmojiIcon = [System.Convert]::toInt32("1F525",16)

Write-Host "Hello Lakshman!"
Write-Host "It is: $($time.ToLongDateString())" `n

function Prompt {
Write-Host -NoNewLine ([System.Char]::ConvertFromUtf32($EmojiIcon))
Write-Host " $((Get-Location).Path)" 
Write-Host -NoNewLine "-->" -foregroundColor Green

Return " "
}

function conda-activate { 
param([string]$EnvName)
& conda activate $EnvName
}
New-Alias -Name ca -Value conda-activate

function conda-deactivate { & conda deactivate }
New-Alias -Name cdec -Value conda-deactivate

function Open-JupyterLab { & jupyter lab }
New-Alias -Name jl -Value Open-JupyterLab

function Get-GitStatus { & git status $args }
New-Alias -Name gs -Value Get-GitStatus

function GitAddAll { & git add . $args }
New-Alias -Name gaa -Value GitAddAll

function GitAdd { & git add $args }
New-Alias -Name ga -Value GitAdd

function GitCommit { & git commit -m $args}
New-Alias -Name gcmm -Value GitCommit

function GitPush { & git push -u origin main }
New-Alias -Name gpom -Value GitPush

function GitLog { & git log }
New-Alias -Name glo -Value GitLog


function VenvActivate { & .\$args\Scripts\activate }
New-Alias -Name act -Value VenvActivate

function VenvDeactivate { & deactivate }
New-Alias -Name dec -Value VenvDeactivate

function OpenExplorer { & explorer . }
New-Alias -Name ed -Value OpenExplorer
