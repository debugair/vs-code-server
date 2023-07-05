$ip_address = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Wi-Fi).IPAddress
"$($ip_address) hostsystem" | Out-File -FilePath "./codeserver/hosts"
$project = "python-environment"
docker compose -p $project up -d