<#
.Synopsis
    Ensures that there is no function used for a default parameter in the resourceId function (e.g. resourceGroup().namd, subscription().subscriptionId).
.Description
    Ensures that there is no function used for a default parameter in the resourceId function (e.g. resourceGroup().namd, subscription().subscriptionId).
.Example
    Test-AzTemplate -TemplatePath .\100-marketplace-sample\ -Test ResourceId-should-not-contain-resourcegroup-function
.Example
    .\ResourceIds-should-not-contain.test.ps1 -TemplateText (Get-Content -path ..\..\..\unit-tests\ResourceIds-should-not-contain.json -Raw)
    
#>
param(
    [Parameter(Mandatory = $true)]
    [string]
    $TemplateText
)

$exprStrOrQuote = [Regex]::new('(?<!\\)[\[\"]', 'RightToLeft') # use this to go backwards from a match below and ensure we are in an expression

# Check for any functions as parameters - PowerShell handles empty differently in objects so check the JSON source (i.e. text)
# note this regex allows for any chars to preceed the function to check for nesting, but it will also flag UDFs as written (which are not common)
$items = @([Regex]::Matches($TemplateText, "resourceId\s{0,}\(\s{0,}resourceGroup\(")) +                 # resourceId(resourceGroup(
         @([Regex]::Matches($TemplateText, "resourceId\s{0,}\(\s{0,}subscription\(")) +                  # resourceId(subscription(
         @([Regex]::Matches($TemplateText, "resourceId\s{0,}\(\s{0,}(concat|format)\s{0,}\(")) +             # resourceId(concat( (or format)
         @([Regex]::Matches($TemplateText, "tenantResourceId\s{0,}\(\s{0,}(concat|format)\s{0,}\(")) +       # tenantResourceId(concat(
         @([Regex]::Matches($TemplateText, "extensionResourceId\s{0,}\(\s{0,}(concat|format)\s{0,}\(")) +    # extensionResourceId(concat(
         @([Regex]::Matches($TemplateText, "subscriptionResourceId\s{0,}\(\s{0,}subscription\(")) +      # subscriptionResourceId(subscription(
         @([Regex]::Matches($TemplateText, "subscriptionResourceId\s{0,}\(\s{0,}(concat|format)\s{0,}\(")) + # subscriptionResourceId(concat(
         @([Regex]::Matches($TemplateText, "reference\s{0,}\(\s{0,}(concat|format)\s{0,}\(")) +              # reference(concat(
         @([Regex]::Matches($TemplateText, "\s{0,}list\w{1,}\s{0,}\(\s{0,}(concat|format)\s{0,}\("))  # list*(concat( - the preceeding part of the expression ensures that we don't find a UDF named something like myListOfSomething     


$lineBreaks = [Regex]::Matches($TemplateText, "`n|$([Environment]::NewLine)")

# this just gets the line number and property name for the error message
if ($items) {
    $sortedItems = @()
    foreach ($item in $items) {
        $findExpr = $exprStrOrQuote.Match($TemplateText, $item.Index) # make sure we hit a [ before a quote
        if ($findExpr.Value -eq '[') {
            # we found the expression opening, so we need to throw the error
            $nearbyContext = [Regex]::new('"(?<PropertyName>[^"]{1,})"\s{0,}:', "RightToLeft").Match($TemplateText, $item.Index)
            if ($nearbyContext -and $nearbyContext.Success) {
                $PropertyName = $nearbyContext.Groups["PropertyName"].Value
                $lineNumber = @($lineBreaks | ? { $_.Index -lt $item.Index }).Count + 1
                $obj = New-Object -TypeName psobject -Property @{item = $item; lineNumber = $lineNumber; PropertyName = $PropertyName }
                $sortedItems += $obj
            }
        } 
    }
    #sort the error output by line number
    $sortedItems = $sortedItems | Sort-Object -Property lineNumber
    foreach ($item in $sortedItems) {
        Write-Error "Using `"$($item.item)`" is not allowed - found on line: $($item.lineNumber) for property: $($item.PropertyName)" `
            -TargetObject $item -ErrorId ResourceId.Should.Not.Contain.Function

    }
}