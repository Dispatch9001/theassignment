@ECHO OFF
setlocal
title The Assignment for Windows
if exist %APPDATA%\theassignment (
  cd %APPDATA%\theassignment
) else (
  mkdir %APPDATA%\theassignment
  cd %APPDATA%\theassignment
  echo Welcome to The Assignment for Windows! 
  echo Git For Windows is about to be installed to the "theassignment" folder in your Roaming AppData directory. Everything is completely portable, so you can safely remove that directory to completely uninstall The Assignment
  powershell -C "$progressPreference = 'silentlyContinue'; iwr https://github.com/git-for-windows/git/releases/download/v2.41.0.windows.1/PortableGit-2.41.0-64-bit.7z.exe -OutFile %temp%\git-installer.exe"
  %temp%\git-installer.exe -o "git\" -y
)
echo ## DOWNLOADING THE ASSIGNMENT ##
git\mingw64\bin\curl.exe -LO https://github.com/Dispatch9001/theassignment/releases/download/v1.0.3/theassignment.sh 
git\bin\bash.exe -c "port=1 ./theassignment.sh"  
endlocal