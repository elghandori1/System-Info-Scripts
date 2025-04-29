# System-Info-Scripts
A simple cross-platform script to display detailed system configuration information, including OS, processor, RAM, GPU, and storage details for Windows (PowerShell) and Linux/macOS (Bash)

![Windows](https://img.shields.io/badge/Windows-PowerShell-blue) ![Linux](https://img.shields.io/badge/Linux-Bash-green) ![macOS](https://img.shields.io/badge/macOS-Bash-lightgrey)

## 📝 Description
This repository contains PowerShell and Bash scripts to display detailed system information for Windows and Linux/nacOS systems.

**Output includes:** <br>
✔ Operating System
✔ CPU (model, cores, speed)
✔ RAM (total memory)
✔ GPU (graphics card)
✔ Storage (disk space)

**Available scripts:**
- **Windows:** `system-info.ps1` - PowerShell script for Windows
- **Linux/macOS:** `system-info.sh` - Bash script for Linux/macOS
 
## 📥 Download & Usage
 ### 🪟 Windows :
 **Download:** <br>
```Invoke-WebRequest -Uri "https://raw.githubusercontent.com/elghandori1/System-Info-Scripts/main/system-info.ps1" -OutFile "system-info.ps1"``` <br>
<i>(or download system-info.ps1 manually from the repo)</i>

**Run the Scrip:** <br>
   1 - Open PowerShell <br>
   2 - Navigate to the folder :(e,g: cd C:\Users\YourName\Desktop\systemInfosWindows) <br>
   3 - Execute the script: ```.\system-info.ps1``` <br>
⚠ If blocked, allow script execution first: ```powershell Set-ExecutionPolicy RemoteSigned -Scope CurrentUser``` <br>

 ### 🐧 Linux / macOS : 
 
 **Download:** <br>
```wget https://raw.githubusercontent.com/elghandori1/System-Info-Scripts/main/system-info.sh```
    
**Run the Scrip:** <br>
  1 - Open a terminal <br>
  2 - Navigate to the folder where system-info.sh is saved :(e,g: cd /home/systemInfosLinux) <br>
  3 - Make the script executable :  ```chmod +x system-info.sh``` <br>
  4 - Run the script: ```./system-info.sh``` <br>
    
### 🎉 Done!
  Run the script and check your system details effortlessly. 🚀
