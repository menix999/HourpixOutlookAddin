@echo off
setlocal

rem Definiowanie ścieżki rejestru dla zaufanych witryn
set "registryKey=HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\github.io\menix999"

rem Sprawdzenie, czy ścieżka rejestru istnieje
reg query "%registryKey%" >nul 2>&1
if %errorlevel% neq 0 (
    rem Utworzenie klucza rejestru, jeśli nie istnieje
    reg add "%registryKey%" /f
)

rem Dodanie witryny do zaufanych (wartość 2 oznacza zaufaną witrynę)
reg add "%registryKey%" /v "*" /t REG_DWORD /d 2 /f

echo Strona https://menix999.github.io została dodana do zaufanych witryn.
pause

endlocal
exit /b
