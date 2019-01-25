# Get Security event Logs

# Get the security events using Get-Eventlong
#Get-EventLog -List
#Get-EventLog Security | where {$_.Message -ilike "*success*"}

# List running processes and search for specific ones.
#ps | where {$_.ProcessName -ilike "*calc*" -or $_.ProcessName -eq "notepad"}

# As Above, but with User Input
$user_input = Read-Host -Prompt "Please enter the process name to search for"

$the_cmd = ps | where {$_.ProcessName -ilike "*$user_input*"}

# Prompt the user what to do with the result
$to_save = Read-Host -Prompt "Do you want to save the results? [Y|N]"

# Process the results
if ($to_save -eq "Y" -or $to_save -eq "y") {

    # Save the stored results in $the_cmd to a CSV
    $the_cmd | Export-Csv -NoTypeInformation -Path "c:\Users\John\Desktop\ps-output.csv"

} else {
    # If they select N or some other option
    # Print the results ot the screen
    $the_cmd

}