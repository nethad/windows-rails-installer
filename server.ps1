ipconfig
ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => Dir.pwd).start'
"Now visit whatever IP you see above that is reachable in the local network"
"e.g.: http://10.0.23.42:8000/howto.html.rhtml"