ipconfig

"."
"."
"."

$HostIp = (
    Get-NetIPConfiguration |
    Where-Object {
        $_.IPv4DefaultGateway -ne $null -and
        $_.NetAdapter.Status -ne "Disconnected"
    }
).IPv4Address.IPAddress

"###############################################################################"
""
"Now visit whatever IP you see above that is reachable in the local network"
""
"most probably: http://" + $HostIp + ":8000/howto.html.rhtml"
""
"###############################################################################"
""

ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => Dir.pwd).start'
