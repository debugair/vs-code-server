$ip_address = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Wi-Fi).IPAddress
$ip_address = $ip_address.TrimStart('#') # Remove any leading '#' characters
$hostname="hostsystem"
$workspace_project="samples"

Remove-Item -Path ".env" -Force
$line = "HOST_IP=$($ip_address)"
$line | Out-File -FilePath ".env" -Encoding utf8

$line = "HOST_NAME=$($hostname)"
$line | Out-File -FilePath ".env" -Append -Encoding utf8

$line = "WORKSPACE_PROJECT=$($workspace_project)"
$line | Out-File -FilePath ".env" -Append -Encoding utf8

$project = "python-environment"
docker compose -p $project up -d