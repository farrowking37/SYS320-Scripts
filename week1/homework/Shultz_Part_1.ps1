# Get Security event Logs
# Display event Logs

# Prompt the user for which log to search
$search_log = Read-Host -Prompt "Which Event log do you want to search?"

# Keyword to search
$search_keyword = Read-Host -Prompt "What keyword do you want to search for in the $log_type log."

$the_cmd = Get-EventLog $search_log -Before 01/24/2019 | where {$_.Message -ilike "*$search_keyword*"}

# Prompt the user what to do with the result
$to_save = Read-Host -Prompt "Do you want to save the results? [Y|N]"

# Process the results
if ($to_save -eq "Y" -or $to_save -eq "y") {

    # Prompt the user to enter the directory.
    $output_dir = Read-Host -Prompt "Please enter the full file path of the directory you would like to save the results to. Include the drive label"

    # Prompt the user to enter the filename.
    $filename = Read-Host -Prompt "Please enter the filename you would like to us including the .csv extension [ex. output.csv]"

    # Print the full file path to the screen so the user knows where the file is saved
    Write-Host -ForegroundColor White -BackgroundColor Red "Your file is saved at $output_dir\$filename"

    # Save the stored results in $the_cmd to a CSV
    $the_cmd | Export-Csv -NoTypeInformation -Path "$output_dir\$filename"

} else {
    # If they select N or some other option
    # Print the results ot the screen
    $the_cmd

}