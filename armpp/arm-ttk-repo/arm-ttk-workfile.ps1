
# Repo: https://timw.info/ttk

Import-Module arm-ttk\arm-ttk.psd1 # assuming you're in the same directory as .\arm-ttk.psd1


Import-Module ./arm-ttk-repo/arm-ttk/arm-ttk.psd1

$TestResults = Test-AzTemplate -TemplatePath ''

$TestFailures = $TestResults | Where-Object { -not $_.Passed }

$FailureTargetObjects = $TestFailures |
    Select-Object -ExpandProperty Errors |
    Select-Object -ExpandProperty TargetObject
