#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

#Install Common Apps using chocolatey
choco install -y firefox
choco install -y vlc

# Gaming Apps
choco install -y steam
choco install -y discord
choco install -y zoom

# School Apps
choco install -y microsoft-edge
choco install -y microsoft-teams