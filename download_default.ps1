$RubyInstallerVersion = "2.6.5-1"
$NodeJsVersion = "12.13.0"
$GitVersion = "2.25.0"

$RubyInstallerLink = "https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-$RubyInstallerVersion/rubyinstaller-devkit-$RubyInstallerVersion-x64.exe"
$NodeJsLink = "https://nodejs.org/dist/v$NodeJsVersion/node-v$NodeJsVersion-x64.msi"
$YarnLink = "https://yarnpkg.com/latest.msi"
$GitLink = "https://github.com/git-for-windows/git/releases/download/v$GitVersion.windows.1/Git-$GitVersion-64-bit.exe"

$CurrentDir = Convert-Path .

"Downloading RubyInstaller... this could take a while..."
(New-Object System.Net.WebClient).DownloadFile($RubyInstallerLink, "$CurrentDir\rubyinstaller.exe")
"Downloading Yarn... this could take a while..."
(New-Object System.Net.WebClient).DownloadFile($NodeJsLink, "$CurrentDir\nodejs.msi")
"Downloading NodeJS... this could take a while..."
(New-Object System.Net.WebClient).DownloadFile($YarnLink, "$CurrentDir\yarn.msi")
"Downloading Git... this could take a while..."
(New-Object System.Net.WebClient).DownloadFile($GitLink, "$CurrentDir\git.exe")
