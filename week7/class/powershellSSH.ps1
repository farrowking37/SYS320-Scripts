# You may have to run install-module Posh-SSH in order for this script to run.

# Start an SSH Session
New-SSHsession -Credential (Get-Credential john.shultz) -ComputerName '192.168.1.34'

# Run commands on remote host and display output to screen
(Invoke-SSHCommand -Index 0 "ps -ef").output

# Send file to remote host
Set-SCPFile -ComputerName '192.168.1.34' -LocalFile "ips-bad-iptables.bash" -RemotePath "/home/john.shultz"

# Check to be sure file uploaded
(Invoke-SSHCommand -Index 0 "ls -l ips-bad-iptables.bash").output