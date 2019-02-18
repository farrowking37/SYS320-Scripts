# Create menus for sys admin and sec admin task

function mainMenu{

    # Clear the screen
    clear
    

    # Create our menus
    write-host "1. System Administration Tasks."
    write-host "2. Security Administration Tasks."
    write-host "[E]xit."

    # Prompt the user for a selection
    $u_select = read-host -Prompt "Please select one of the options above"

    # Process the user response
    if ($u_select -eq 1) {
           
        # Call the sysAdmin function
        sysAdmin
    
    } elseif ($u_select -eq 2 ) {

        # Call the secAdmin function
        secAdmin

    } elseif ($u_select -eq "E") {

        # exit the program
        exit

    } else {
    
        write-host -backgroundcolor red -foregroundcolor white "Invalid value"
        sleep 4
        mainMenu
    
    }

} # End of main menu functoin


# This function will provide a prompt to the user to hit Enter when they are done reviewing the results
# and take them back to the menu they were in.
function allDone  {

    read-host -prompt "Press [Enter] when done."

}

# Process sys admin tasks.
function sysAdmin {

    # Clear the screen
    clear

    # Build our menu
    write-host "1. List all Running Processes."
    write-host "2. List all services."
    write-host "3. List only running services."
    write-host "4. Return to main menu"
    write-host "5. Exit the menu"

    # Prompt the user
    $sysAdminTask = read-host -Prompt "Please select one of the options above."


    switch ($sysAdminTask) {
        1 { Get-Process | Out-Host ; break}
        2 { Get-Service | Out-Host ; break}
        3 { Get-Service | where {$_.Status -eq "Running"} | Out-Host ; break }
        4 { mainMenu }
        5 { exit }
        default {  
            write-host -backgroundcolor red -foregroundcolor white "Invalid option"
            sleep 4

            # Call the system admin menu so the user can start again.
            sysAdmin 
        } # End default switch
    
    } # End switch statement


    # Allow the user to review the results
    allDone

    # Call the sysAdmin menu, because they are currently working in this menu.
    sysAdmin
} # End of sysadmin menu


# Process sec admin tasks.
function secAdmin {
    
    # Clear the screen
    clear
    
    # Build the menu
    write-host "1. List all users"
    write-host "2. List all services, including path"
    write-host "3. List all processes, including path"
    write-host "4. Return to main menu"
    write-host "5. Exit"    

    # Take user input
    $secAdminTask = read-host -Prompt "Please select one of the above options"

    switch($secAdminTask) {
        1 {Get-WmiObject -Class Win32_UserAccount | Select Name, SID, Domain | out-host ; break}
        2 {Get-WmiObject -Class Win32_Service | Select Name, PathName | out-host ; break}
        3 {Get-WmiObject -Class Win32_Process | select Name, ProcessId, __PATH | out-host ; break}
        4 {mainMenu} 
        5 {exit}
        default {
           write-host -backgroundcolor red -foregroundcolor white "Invalid option"
           sleep 4

           # Call the system admin menu so the user can start again.
           secAdmin
            
        } # End default

    
    } #End switch

    # Allow user to read results
    allDone

    # Return to start of menu
    secAdmin


} # end of secAdmin


# call the mainMenu function
mainMenu
