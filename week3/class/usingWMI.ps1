# Story line: Dig deeper into the Windows OS using WMI (Windows Management Instrumentation)

# List Wmi-objects
#Get-WmiObject -list

# Filter a specific WMI-Object
#Get-WmiObject -list | where {$_.Name -eq "Win32_Account"}

# Use Get-Member to list the properties for the wmi-object
#Get-WmiObject -Class Win32_account | Get-Member
#Task Select the Name, PasswordRequired, InstalledDate, AccountType for the win32_account class
#Get-WmiObject -Class Win32_account | Select Name, PasswordRequired, InstalledDate, AccountType

# Filter for WMI-object using regular expressions (regex)
#Get-WmiObject -list | where {$_.Name -ilike "win32_[j-s]*"} | sort

# Filter for the network adapter wmi-object using regex.
# Get-WmiObject -list | where {$_.Name -ilike "win32_[n]*"} | Select-String "net"
Get-WmiObject -Class Win32_NetworkAdapter