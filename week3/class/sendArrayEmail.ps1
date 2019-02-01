# Story Line; Learn to use arrays and send an email to each person.

# Create the body of the email
$msg = "Hey there."

# create an array of email addresses
$emailAddresses = @('tupac@alypse.com', 'biggie@smalls.com', 'presley@king.com')

# Loop through the array
foreach ($email in $emailAddresses) {

    if ($email -eq "tupac@alypse.com"){
        write-host "I'm Alive"
        
        #write-host "Sending an email to $email"
        
        #break - Break out of the loop if case is strue
        #continue - Skip the rest of the code in the loop.
    }
    write-host "Sending an email to $email"
    # Send the users an email containing the $msg.
    #Send-MailMessage -from "flavorflava@fatgoldchain.gov" -to $email -Subject "Hey There." -Body $msg -SmtpServer 192.168.1.32
}