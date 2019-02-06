# Story Line: Create a script that will grab the following info and export the results to individual CSV files.

# First allow users to select the output path they would like to use.
$path = Read-Host -Prompt "Enter in the file path you want to save all CSVs to: "

# Run and get a list of processes running with name, id, and path
# Notify User
Write-Host "Capturing Running Processes"

# Capture Processes
$getProcesses = Get-WmiObject -Class Win32_Process | select Name, ProcessId, __PATH

# Save to File
Write-Host "Saving to File"
$getProcesses | Export-Csv -NoTypeInformation -Path $path\"processes.csv"



# Run and get a list of services running with name, id, and path
# Notify User
Write-Host "Capturing All Services"

# Capture Services
$getServices = Get-WmiObject -Class Win32_Service | Select Name, ProcessId, PathName

# Save to file
Write-Host "Saving to file"
$getServices | Export-Csv -NoTypeInformation -Path $path\"services.csv"



# Run and get a list of all running serives with name, id, and path
# Notify User
Write-Host "Capturing Running Services Services"

# Capture Running Services
$getServices = Get-WmiObject -Class Win32_Service | Where-Object{$_.state -eq "Running"} | Select Name, ProcessId, PathName

# Save to file
Write-Host "Saving to file"
$getServices | Export-Csv -NoTypeInformation -Path $path\"services.csv"



# Run and get a list of all users with their Username, SID, and the Domain.
# Notify User
Write-Host "Capturing All User Accounts"

# Capture Users
$getUsers = Get-WmiObject -Class Win32_UserAccount | Select Name, SID, Domain

# Save to File
Write-Host "Saving to File"
$getUsers | Export-Csv -NoTypeInformation -Path $path\"users.csv"



# Run and get a list of all installed software.
# Notify User
Write-Host "Capturing All Installed Software"

# Capture Software
$getProducts = Get-WmiObject -Class Win32_Product | Select Name, Version, Vendor, Caption

# Save to File
Write-Host "Saving to File"
$getProducts | Export-Csv -NoTypeInformation -Path $path\"software.csv"



# Run and get a list of all active TCP connections.
# Notify User
Write-Host "Capturing All TCP Connections"

# Capture Software
$getConnections = Get-NetTCPConnection | Select LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess

# Save to File
Write-Host "Saving to File"
$getConnections | Export-Csv -NoTypeInformation -Path $path\"TCPConnections.csv"