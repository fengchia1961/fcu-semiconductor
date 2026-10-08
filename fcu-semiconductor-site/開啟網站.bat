@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo 正在啟動網站，請勿關閉此視窗...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0server.ps1"
pause
