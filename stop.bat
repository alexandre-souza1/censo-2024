@echo off
cd /d %~dp0

echo Parando sistema...

docker compose down

echo Sistema encerrado.
pause
