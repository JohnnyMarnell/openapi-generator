#
# OpenAPI Petstore
# This spec is mainly for testing Petstore server and contains fake endpoints, models. Please do not use this for any other purpose. Special characters: "" \
# Version: 1.0.0
# Generated by OpenAPI Generator: https://openapi-generator.tech
#

<#
.SYNOPSIS

No summary available.

.DESCRIPTION

No description available.

.PARAMETER ClassName
No description available.
.PARAMETER Color
No description available.
.PARAMETER Breed
No description available.
.OUTPUTS

Dog<PSCustomObject>
#>

function Initialize-PSDog {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipelineByPropertyName = $true)]
        [String]
        ${ClassName},
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Color} = "red",
        [Parameter(Position = 2, ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Breed}
    )

    Process {
        'Creating PSCustomObject: PSPetstore => PSDog' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        if ($null -eq $ClassName) {
            throw "invalid value for 'ClassName', 'ClassName' cannot be null."
        }


        $PSO = [PSCustomObject]@{
            "className" = ${ClassName}
            "color" = ${Color}
            "breed" = ${Breed}
        }


        return $PSO
    }
}

<#
.SYNOPSIS

Convert from JSON to Dog<PSCustomObject>

.DESCRIPTION

Convert from JSON to Dog<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

Dog<PSCustomObject>
#>
function ConvertFrom-PSJsonToDog {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: PSPetstore => PSDog' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PSDog
        $AllProperties = ("className", "color", "breed")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        If ([string]::IsNullOrEmpty($Json) -or $Json -eq "{}") { # empty json
            throw "Error! Empty JSON cannot be serialized due to the required property 'className' missing."
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "className"))) {
            throw "Error! JSON cannot be serialized due to the required property 'className' missing."
        } else {
            $ClassName = $JsonParameters.PSobject.Properties["className"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "color"))) { #optional property not found
            $Color = $null
        } else {
            $Color = $JsonParameters.PSobject.Properties["color"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "breed"))) { #optional property not found
            $Breed = $null
        } else {
            $Breed = $JsonParameters.PSobject.Properties["breed"].value
        }

        $PSO = [PSCustomObject]@{
            "className" = ${ClassName}
            "color" = ${Color}
            "breed" = ${Breed}
        }

        return $PSO
    }

}

