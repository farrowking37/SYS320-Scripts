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
    write-host "[R]eturn to main menu"
    write-host "[E]xit"

    # Prompt the user
    $sysAdminTask = read-host -Prompt "Please select one of the options above."

   
    #Process the user's input
    if ($sysAdminTask -eq "R") {
        mainMenu
    
    } elseif ($sysAdminTask -eq 1) {
        get-process | out-host
    
    } elseif ($sysAdminTask -eq 2) {
        get-service | out-host
   
    } elseif ($sysAdminTask -eq 3) {
        get-service |where {$_.Status -eq "Running"} | out-host
   
    } elseif ($sysAdminTask -eq "E"){
        break

    } else {
    
        write-host -backgroundcolor red -foregroundcolor white "Invalid option"
        sleep 4

        # Call the system admin menu so the user can start again.
        sysAdmin
    
    }


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
    write-host "[R]eturn"
    write-host "[E]xit"    

    # Take user input
    $secAdminTask = read-host -Prompt "Please select one of the above options"

    # Process user input
    if ($secAdminTask -eq 1){

        Get-WmiObject -Class Win32_UserAccount | Select Name, SID, Domain | out-host

    } elseif ($secAdminTask -eq 2){

        Get-WmiObject -Class Win32_Service | Select Name, PathName | out-host
         
    } elseif ($secAdminTask -eq 3){

        Get-WmiObject -Class Win32_Process | select Name, ProcessId, __PATH | out-host

    } elseif ($secAdminTask -eq "R"){

        mainMenu

    } elseif ($secAdminTask -eq "E"){

        break

    } else{

        write-host -backgroundcolor red -foregroundcolor white "Invalid option"
        sleep 4

        # Call the system admin menu so the user can start again.
        secAdmin

    }

    # Allow user to read results
    allDone

    # Return to start of menu
    secAdmin


} # end of secAdmin


# call the mainMenu function
mainMenu
