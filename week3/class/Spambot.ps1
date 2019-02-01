# Story Line; Learn to user arrays and send an email to each person

cls

# Create the body of the email
$msg = "Hey there"

# Create an array of email addresses
$emailAddresses = @('tupac@alypse.com', 'biggie@alypse.com', 'presley@alypse.com')

# loop through the array
while ($true) {
    foreach ($email in $emailAddresses) {

        Write-Host "Sending an email to $email"
        Send-MailMessage -from "flavorflava@fatgoldchain.gov" -to $email -Subject "Hey There." -Body $msg -SmtpServer 192.168.1.32

    } # Foreach end
} # While end