@echo off
cd /d %~dp0

echo Iniciando sistema...

start http://localhost:3000

docker compose up

pause
