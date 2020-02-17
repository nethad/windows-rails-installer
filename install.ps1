function refresh-path {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") +
                ";" +
                [System.Environment]::GetEnvironmentVariable("Path","User")
}

$CurrentDir = Convert-Path .

if (!(Test-Path rubyinstaller.exe)) {
  "###########################################################################"
  "#"
  "# Could not find rubyinstaller.exe in this folder"
  "# Get the latest version of Ruby+Devkit from https://rubyinstaller.org/ and"
  "# rename the file to rubyinstaller.exe and put it into this folder."
  "#"
  "###########################################################################"
  exit
}

if (!(Test-Path nodejs.msi)) {
  "###########################################################################"
  "#"
  "# Could not find nodejs.msi in this folder."
  "# Download NodeJS LTS from https://nodejs.org/en/ and"
  "# rename the file to nodejs.msi and put it into this folder."
  "#"
  "###########################################################################"
  exit
}

if (!(Test-Path yarn.msi)) {
  "###########################################################################"
  "#"
  "# Could not find yarn.msi in this folder."
  "# Download Yarn stable from https://yarnpkg.com/ and"
  "# rename the file to yarn.msi and put it into this folder."
  "#"
  "###########################################################################"
  exit
}

if (!(Test-Path git.exe)) {
  "###########################################################################"
  "#"
  "# Could not find git.exe in this folder."
  "# Download Git from https://git-scm.com and"
  "# rename the file to git.exe and put it into this folder."
  "#"
  "###########################################################################"
  exit
}

"All files are present, continuing with installation..."

"Installing RubyInstaller..."
$p = Start-Process $CurrentDir\rubyinstaller.exe -ArgumentList "/silent" -wait -NoNewWindow -PassThru

"Installing Git..."
$p = Start-Process $CurrentDir\git.exe -ArgumentList "/silent" -wait -NoNewWindow -PassThru

"Installing NodeJS..."
$p = Start-Process msiexec.exe -Wait -ArgumentList "/I $CurrentDir\nodejs.msi /passive"

"Installing Yarn..."
$p = Start-Process msiexec.exe -Wait -ArgumentList "/I $CurrentDir\yarn.msi /passive"

# We need to reload the PowerShell to be able to use the installed programs
# We defined this function above ourselves.
refresh-path

"Profile reloaded!"

"Installing MinGW... "
ridk install 3
"Installing Bundler... "
gem install bundler --no-document
"Installing SQLite... "
gem install sqlite3 --platform=ruby --no-document
"Installing Rails... "
gem install rails --no-document
"Installing Setting up new rails app... "
rails new myapp
cd myapp
bundle install
"."
"."
"."
"#########################################"
"#                                       #"
"# ALL DONE.                             #"
"#                                       #"
"# Now enter:                            #"
"#                                       #"
"# bundle exec rails server              #"
"#                                       #"
"# and visit http://localhost:3000       #"
"#                                       #"
"# and press Ctrl+C to stop it again.    #"
"#                                       #"
"#########################################"

