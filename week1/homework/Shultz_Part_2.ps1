# EventLog Script but with both CSV and Email output possible.
# Modified off the base

# Prompt the user for which log to search
$search_log = Read-Host -Prompt "Which Event log do you want to search?"

# Keyword to search
$search_keyword = Read-Host -Prompt "What keyword do you want to search for in the $log_type log."

$the_cmd = Get-EventLog $search_log -Before 01/24/2019 | where {$_.Message -ilike "*$search_keyword*"}

# Prompt the user what to do with the result
$to_save = Read-Host -Prompt "Do you want to save the results? [Y|N]"

# Process the results
if ($to_save -eq "Y" -or $to_save -eq "y") {

    # Prompt the user whether they want to save to CSV or to email.
    # If to CSV follow part 1 flow. If by email use new code.
    $output_option = Read-Host -Prompt "Enter 1 to save the .csv locally, or 2 to send it via email"

    if ($output_option -eq 1) {
        # Prompt the user to enter the directory.
        $output_dir = Read-Host -Prompt "Please enter the full file path of the directory you would like to save the results to. Include the drive label"

        # Prompt the user to enter the filename.
        $filename = Read-Host -Prompt "Please enter the filename you would like to us including the .csv extension [ex. output.csv]"

        # Print the full file path to the screen so the user knows where the file is saved
        Write-Host -ForegroundColor White -BackgroundColor Red "Your file is saved at $output_dir\$filename"

        # Save the stored results in $the_cmd to a CSV
        $the_cmd | Export-Csv -NoTypeInformation -Path "$output_dir\$filename" 
    
    }

    else {
        # If they select any other option send the contents via email.
        # Save the value of the root directory to a variable
        $attachment = "C:\temp\output.csv"

        # Export the CSV to specified path.
        $the_cmd | Export-Csv -Force -NoTypeInformation -Path $attachment

        # Prompt user for Subject Line
        $subject = Read-Host -Prompt "Enter in the subject line of the email. Hit enter to send no subject"

        # Prompt user for Body Line
        $body = Read-Host -Prompt "Enter in the body of the email. Hit enter to send no body"

        # Send the email
        Send-MailMessage -From "john.shultz@mymail.champlain.edu" -To "mini@miniBuntu" -Subject $subject -Body $body -SmtpServer 192.168.1.32 -Attachments $attachment
        
        # Wipe the local copy after running.
        Remove-Item $attachment


    }


} 
else {
    # If they select N or some other option print the results to screen
    $the_cmd
}