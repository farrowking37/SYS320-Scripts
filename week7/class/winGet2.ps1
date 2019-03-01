<#

.SYNOPSIS

Download a file from the Internet

.PARAMETER URL

Specify the URL of a file you wish to retrieve. It is best to enclose in quotes.


.PARAMETER saveLocation

Specify the locatoin to save the retrieved file. It is best to enclose in quotes.

.EXAMPLE

.\winGet2.ps1 -URL http://192.168.1.32/cve.csv" -saveLocation "cve2.csv"

.EXAMPLE

.\winGet2.ps1 -u http://192.168.1.32/cve.csv" -s "cve2.csv"

#>


# Params to pass to commqandline
param (

    # Variables
    [alias("u")][Parameter(mandatory=$true)][string]$URL,
    [alias("s")][Parameter(mandatory=$true)][string]$saveLocation

)


# Run the command and process the commandline switches
Invoke-WebRequest -URI $URL -OutFile $saveLocation

#Task: Create a new powershell script that uses the "Get-Eventlog" and allows the user to specify
# an Event Log to view and allow the user to specify a keyword to search within the message"