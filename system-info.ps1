# system-info.ps1 - Display full system configuration

Write-Host "=== System Information ===" -ForegroundColor Cyan

# Computer name
Write-Host "Computer Name: " -NoNewline
Write-Host $env:COMPUTERNAME

# Username
Write-Host "User Name: " -NoNewline
Write-Host $env:USERNAME

# Manufacturer and Model
$sys = Get-CimInstance Win32_ComputerSystem
Write-Host "Brand: " -NoNewline
Write-Host "$($sys.Manufacturer) $($sys.Model)"

# Operating System
Write-Host "OS Version: " -NoNewline
(Get-CimInstance Win32_OperatingSystem).Caption

# System Architecture
Write-Host "System Type: " -NoNewline
$sys.SystemType

# Processor Info
$cpu = Get-CimInstance Win32_Processor
Write-Host "Processor: " -NoNewline
Write-Host $cpu.Name

# Cores
Write-Host "Cores (Physical): " -NoNewline
Write-Host $cpu.NumberOfCores

Write-Host "Threads (Logical): " -NoNewline
Write-Host $cpu.NumberOfLogicalProcessors

# CPU Speed (GHz)
Write-Host "CPU Speed: " -NoNewline
"{0:N2} GHz" -f ($cpu.MaxClockSpeed / 1000)

# RAM Info
Write-Host "Total RAM (GB): " -NoNewline
"{0:N2}" -f ($sys.TotalPhysicalMemory / 1GB)

# GPU Info
Write-Host "Graphics Card: " -NoNewline
(Get-CimInstance Win32_VideoController).Name

# Disk Info
Write-Host "=== Storage Information ===" -ForegroundColor Cyan
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
    $drive = $_
    $free = "{0:N2}" -f ($drive.FreeSpace / 1GB)
    $total = "{0:N2}" -f ($drive.Size / 1GB)
    Write-Host "$($drive.DeviceID): $free GB free / $total GB total"
}

Write-Host "Done!" -ForegroundColor Green
