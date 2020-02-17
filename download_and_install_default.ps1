cd $Home
mkdir rails-install
cd rails-install

Invoke-WebRequest `
  -Uri "https://raw.githubusercontent.com/nethad/windows-rails-installer/master/download_default.ps1" `
  -OutFile download.ps1
Invoke-WebRequest `
  -Uri "https://raw.githubusercontent.com/nethad/windows-rails-installer/master/install.ps1" `
  -OutFile install.ps1 `

$CurrentDir = Convert-Path .

. $CurrentDir\download.ps1
. $CurrentDir\install.ps1