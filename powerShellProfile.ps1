$time = Get-Date
$EmojiIcon = [System.Convert]::toInt32("1F525",16)

Write-Host "Hello Lakshman!"
Write-Host "It is: $($time.ToLongDateString())" `n


function conda-activate { param([string]$EnvName) & conda activate $EnvName }
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

function GitDiff { & git diff }
New-Alias -Name gd -Value GitDiff

function VenvActivate { & .\$args\Scripts\activate }
New-Alias -Name act -Value VenvActivate

function VenvDeactivate { & deactivate }
New-Alias -Name dec -Value VenvDeactivate

function OpenExplorer { & explorer . }
New-Alias -Name ed -Value OpenExplorer

function Write-BranchName () {
    try {
        $branch = git rev-parse --abbrev-ref HEAD

        if ($branch -eq "HEAD") {
            # we're probably in detached HEAD state, so print the SHA
            $branch = git rev-parse --short HEAD
            Write-Host " ($branch)" -ForegroundColor "red"
        }
        else {
            # we're on an actual branch, so print it
            Write-Host " ($branch)" -ForegroundColor "blue"
        }
    } catch {
        # we'll end up here if we're in a newly initiated git repo
        Write-Host " (no branches yet)" -ForegroundColor "yellow"
    }
}

function prompt {
    $base = ([System.Char]::ConvertFromUtf32($EmojiIcon))
    $path = " $($executionContext.SessionState.Path.CurrentLocation)"
    $userPrompt = $('--> ' * ($nestedPromptLevel + 1))

    Write-Host "$base" -NoNewline

    if (git rev-parse --is-inside-work-tree) {
        Write-Host $path -NoNewline -ForegroundColor "green"
        Write-BranchName
    }
    else {
        # we're not in a repo so don't bother displaying branch name/sha
        Write-Host $path -ForegroundColor "green"
    }

    return $userPrompt
}