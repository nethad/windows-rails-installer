# windows-rails-installer

A Windows PowerShell Rails Installer

## Installation

This is a single file PowerShell installation script. With the one-liner below everyting needed to setup and run a Rails application is installed:

- Ruby (RubyInstaller)
- NodeJS
- Yarn
- Git

Check out the script that here: https://raw.githubusercontent.com/nethad/windows-rails-installer/master/download_and_install_default.ps1

Simply open the PowerShell (**not** ISE) as an administrator (right-click). It's possible to run without that, all the installers will ask you for permission first then and it's not fully automatic that way.

```powershell
Invoke-WebRequest `
  -Uri "https://raw.githubusercontent.com/nethad/windows-rails-installer/master/download_and_install_default.ps1" `
  -OutFile rails-install.ps1; `
  .\rails-install.ps1
```

## For the coaches

If a lot of participants download the installers from the official source at the same time, almost any
location will not have enough bandwidth capacity. This is why we download all the installers locally
and then serve them with a webrick server. Only Ruby needs to be installed for this.

```powershell
# This is needed to let our script run
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
git clone https://github.com/nethad/windows-rails-installer.git
cd windows-rails-installer
# Download all installers to this folder as a local mirror
.\download_default.ps1
# Now serve these files and follow instructions
.\server.ps1
```
