# Array of websites containing threat intell
$drop_urls = @('https://rules.emergingthreats.net/blockrules/emerging-botcc.rules','https://rules.emergingthreats.net/blockrules/compromised-ips.txt')

# Loop through the URLs for the rules list
foreach ($u in $drop_urls) {

    # Extract the filename
    $temp = $u.split("/")

   # The last element in the array plucked off is the filename
   $file_name = "./" + $temp[4]

   # Download the rules list
   #Invoke-WebRequest -Uri $u -OutFile $file_name

} # End of for each loop

# Array containing the filename
$input_paths = @('.\compromised-ips.txt', '.\emerging-botcc.rules')

# Extract the IP addresses.
# [154.35.64.107,154.35.64.18] - Example of a set of IP addresses in SNORT rules.
# \digit
# \b boundary
$regex_drop = '\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b'  # Match anything formatted like our ips (boundary, four period seperated sets of 1-3 digits, and then another boundary.)

# Append the IP addresses to the temporary IP list.
# Select String grabs every line form the file where there is info that matches our regex.
# The first ForEach-Object returns a group of objects containing all the matches
# The second ForEach-Object grabs only the values out of these objects to isolate the IPs
# Sort groups potential duplicates together
# Get-Unique -AsString only pulls the unique values and returns them as a string.
# The Out-File saves all the info to a file.
Select-String -Path $input_paths -Pattern $regex_drop -AllMatches | ForEach-Object { $_.Matches } | % { $_.Value } | sort | Get-Unique -AsString | Out-File -FilePath "ips-bad.txt"

# Get the IP addresses discovered, loop through and replace the beginning of the line with the IPTables syntax
# After the IP address, add the remaining IPTables syntax and save the results to a file.

# IPTables Syntax
#(Get-Content -Path ".\ips-bad.txt") | % { $_ -replace "^", "iptables -A INPUT -s " -replace "$", " -j DROP"} `
#| Set-Content -Path ".\ips-bad-iptables.bash"

# Cisco router format
(Get-Content -Path ".\ips-bad.txt") | % { $_ -replace "^", "access-list 1 deny host " } | Set-Content -Path ".\ips-bad-cisco.bash" 
