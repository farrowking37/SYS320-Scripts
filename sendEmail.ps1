# Send an email

# Create the message body
$msg = "Hey Adam, `n I'm spamming you because Duane said that I could. Sorry!"

# Create the email structure using the send-MailMessage applet
Send-MailMessage -From "totally.real.person@snopes.com" -to "agoldstein@champlain.edu" -Subject "I'm learning stuff" -body $msg -SmtpServer 192.168.1.32