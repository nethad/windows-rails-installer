# windows-rails-installer
A Windows PowerShell Rails Installer

## Installation

This is a single file PowerShell installation script. With the one-liner below everyting needed to setup and run a Rails application is installed:

* Ruby (RubyInstaller)
* NodeJS
* Yarn
* Git

Check out the script that here: https://github.com/nethad/windows-rails-installer/blob/master/install.ps1

Simply open the PowerShell (**not** ISE) as an administrator (right-click). It's possible to run without that, all the installers will ask you for permission first then and it's not fully automatic that way.

```powershell
Invoke-WebRequest `
  -Uri "https://raw.githubusercontent.com/nethad/windows-rails-installer/master/install.ps1" `
  -OutFile rails-install.ps1; `
  .\rails-install.ps1
```
