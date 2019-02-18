# Story line: create a program that will download the CVE.csv file stored at 192.168.1.32/cve.csv. Create a menu to allow the user to search either by CVE name or by text in the CVE description.

function mainMenu{

    # Clear the screen
    clear

    # Print options
    write-host "1. Search the CVEs by name."
    write-host "2. Search the CVEs by a keyword in their description"
    write-host "3. Exit"

    # Take user input
    $userChoice = read-host -Prompt "Please select one of the above options"

    switch($userChoice){
        1 {
        # Set the CVE Found flag to false to begin
        $found = "false"
        
        $cveSearchName = Read-Host -Prompt "Enter in the CVE name you would like to search for"

        # Loop through all items in the CVE database.
        foreach ($cveEntry in $CVE_File) {
           
           # Check to see if the entry's name matches the search name.
           if($cveEntry.Name -eq $cveSearchName){
                
                # Let the user know an item was found
                write-host "CVE Found"

                # set CVE Found flag to true
                $found = "true"

                # Print the results for the CVE.
                $entryName = $cveEntry.Name
                $entryDesc = $cveEntry.Description
                $entryStatus = $cveEntry.Status

                Write-Host "CVE NAME: $entryName"
                Write-Host "CVE DESCK: $entryDesc"
                Write-Host "CVE STAT: $entryStatus"
           
           } # End nested if

       
        } # End for each loop

    # Print if nothing is found
    if ($found -eq "true"){
        # Do nothing.
    } else { 
        write-host "nothing found" 
    }



    # Give the user time to read the output.
    allDone

    # Return to main menu
    mainMenu
        } # End switch 1
        
        2 {
# Set the CVE Found flag to false to begin
        $found = "false"
        
        $cveSearchDesc = Read-Host -Prompt "Enter in the word in the CVE descriptions you would like to search for"

        # Loop through all items in the CVE database.
        foreach ($cveEntry in $CVE_File) {
            
            if($cveEntry.Description -ilike "*$cveSearchDesc*"){
                # Print that the CVE was found.
                write-host "Found."

                # Print the results for the CVE.
                $entryName = $cveEntry.Name
                $entryDesc = $cveEntry.Description
                $entryStatus = $cveEntry.Status

                Write-Host "CVE NAME: $entryName"
                Write-Host "CVE DESCK: $entryDesc"
                Write-Host "CVE STAT: $entryStatus"

                $found = "true"
            }

        } # End of choice 2 foreach

         # Print if nothing is found
        if ($found -eq "true"){
            # Do nothing.
        } else { 
            write-host "nothing found" 
        }

        # Give the user time to read output
        allDone

        # Return to main menu
        mainMenu
        } #End switch 2

        3 { break } # End switch 3

        default {
        # If invalid input entered warn user and reload menu.
        write-host -BackgroundColor red -ForegroundColor White "Invalid input"
        sleep 2
        mainMenu
        } # End default

    } #end switch

} # End of function.


function allDone {

    # Allow the user time to read the output before continuing.
    read-host -Prompt "Press enter when you are ready to continue"

}

# Ask the user where they can save the CVE file
$path = read-host -Prompt "Enter in the file path where the CVE file may be stored."

# Download the file
Invoke-WebRequest -URI http://192.168.1.32/cve.csv -OutFile $path\"cve.csv"

$CVE_File = import-csv $path\"cve.csv"

# Call the main menu
mainMenu