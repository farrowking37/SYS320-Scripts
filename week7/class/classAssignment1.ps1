<#

.SYNOPSIS
Display items within a given event log, and provide the option to search for a string within if desired.

.PARAMETER Log
Specify the EventLog that you want to view.

.PARAMETER searchString
Optional. Specify the the string that you wish to search for in the message body. For best results, wrap in quotes and use an astrisk on either side of the search

.EXAMPLE
.\classAssignment.ps1 -Log System -searchString "*failure*"

.EXAMPLE
.\classAssignment.ps1 -l System -s "*failure*"

.EXAMPLE
.\classAssignment.ps1 -Log System

#>


# Params to pass on the commandline
param (

    # Variables
    [alias('l')][Parameter(mandatory=$true)][string]$Log,
    [alias('s')][string]$searchString

)

# Allow for the search string to be mandatory by checking to see if the value is empty 
# and determining the command to run.
if ($searchString -eq ""){
    
    # Run the command without using the empty $searchString variable
    Get-EventLog -LogName $Log


}
else {

    # Run the command and process the commandline switches
    # Use the search string as a searching agent.
    Get-EventLog -LogName $Log -Message $searchString

}
