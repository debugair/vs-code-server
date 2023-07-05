$ip_address = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Wi-Fi).IPAddress
$ip_address = $ip_address.TrimStart('#') # Remove any leading '#' characters
$hostname="hostsystem"
#$line = "$($ip_address) $($hostname)"
#$line = $line.TrimStart('#') # Remove any leading '#' characters
#$line = $line.Trim() # Remove any leading or trailing whitespace
#$line += "`n" # Add a Unix-style line ending
#$line | Out-File -FilePath "./codeserver/hosts" -Encoding utf8

Remove-Item -Path ".env" -Force
$line = "HOST_IP=$($ip_address)"
$line | Out-File -FilePath ".env" -Encoding utf8
$line = "HOST_NAME=$($hostname)"
$line | Out-File -FilePath ".env" -Append -Encoding utf8

$project = "python-environment"
docker compose -p $project up -d