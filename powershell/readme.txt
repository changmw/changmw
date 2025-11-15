Windows Powershell scripts

Useful Powershell Commands

Get help on Powershell commands

Get-Help -Name Get-Help
Get-Help Get-Help -Full
Get-Help Get-Process -Examples
Get-Help -Name Set-ExecutionPolicy -Detailed

Clear Powershell screen:

Clear-Host

List and clear command history:

Get-History
[Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory()
Clear-History
Clear-History -ID 12, 20
Remove-Item "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\*"
(Get-PSReadlineOption).HistorySavePath
cat (Get-PSReadlineOption).HistorySavePath
Remove-Item (Get-PSReadlineOption).HistorySavePath

Show a message:

Write-Host "Hello World!"
Write-Output "Hello World!"
Write-Debug "Hello World!"
Throw 'Hello World!'

Browse a folder using File Explorer:

Invoke-Item c:\windows
ii c:\windows

Flush disk write cache before ejecitng a USB flash drive (drive D):

Write-Volumecache d

Set a variable:

$message = 'there is an error with your file'
$message -match 'error'
$message.contains('error')
$message -replace 'file','folder'
$FileNames = Get-ChildItem -Path '.\' -Directory
$FileNames = Get-ChildItem -Path '.\somefolder\' -Name 'F*' -File
$Cred = (Get-Credential)

Execute a command:

$command = '"C:\Program Files\Some Product\SomeExe.exe" "C:\some other path\file.ext"'
Invoke-Expression "& $command"
iex "& $command"

Run a command as Administrator or another user:

Start-Process -FilePath "powershell.exe" -Verb RunAs
Start-Process -FilePath "powershell.exe" -Verb RunAsUser
Start-Process powershell "-File myscript.ps1" -Credential (Get-Credential)

List all files and folders recursively:

Get-ChildItem -Path $UserInput -Recurse
Get-ChildItem -Path $logFolder | Select-String -Pattern 'regex'

Calculate checksum of file(s):

Get-FileHash -Algorithm MD5 .\Win2016_OS.iso
Certutil -hashfile Example.txt MD5

Get-ChildItem -Path C:\py* -Recurse -Filter *.exe | Get-FileHash
(Get-FileHash '.\path\to\foo.zip').Hash -eq (Get-Content .\expected-hash.sha256)
( Get-FileHash -Algorithm SHA256 C:\Path\To\File.extension ).Hash -eq 'expected_checksum'

Locate the path to an executable command:

(Get-Command notepad).Path (gcm notepad).Path
where.exe notepad
#
Get-Alias where
Remove-Item alias:\where -Force
where notepad
Set-Alias where Get-Command
#
Set-Alias which where.exe
which notepad

Display a message using GUI:

[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
[System.Windows.Forms.MessageBox]::Show('Automatic logoff after 1 hour of inactivity','WARNING')
# In one-line
powershell -WindowStyle hidden -Command "& {[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('Automatic logoff after 1 hour of inactivity','WARNING')}"

List and flush DNS cache:

Get-DnsClientCache
Clear-DnsClientCache

Execute Powershell commands using command-line:

powershell -nop -c "& {sleep seconds}"
powershell -nop -c "& {sleep -m Milliseconds}"

List network shares:

netsh advfirewall firewall set rule group="Windows Management Instrumentation (WMI)" new enable=yes

New-CimSession -ComputerName $computername -Credential $creds
Get-SmbShare -CimSession $(get-cimsession -id 1)

Get-WMIObject -Query "SELECT * FROM Win32_Share" | FT
Get-WMIObject -ComputerName "your-pc" -Query "SELECT * FROM Win32_Share" | FL

Enter-PSSession -ComputerName NomDuPC
Get-SmbShare
get-WmiObject -class Win32_Share
Get-SmbShare -Name share | select *

References:

The 10 Basic PowerShell Commands You Need to Know
https://adamtheautomator.com/basic-powershell-commands/

Table of Basic PowerShell Commands - Scripting Blog
https://devblogs.microsoft.com/scripting/table-of-basic-powershell-commands/

Windows PowerShell Commands Cheat Sheet (PDF), Tips & Lists
https://www.comparitech.com/net-admin/powershell-cheat-sheet/

Powershell scripts, scripting, modules, repositories, cmdlets, how-to articles and tutorials
https://stefanos.cloud/kbcategories/powershell/ 

