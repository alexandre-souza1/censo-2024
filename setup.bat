@echo off
cd /d %~dp0

echo ==============================
echo Iniciando configuracao inicial
echo ==============================

echo.
echo Buildando containers...
docker compose up -d --build

echo.
echo Criando banco...
docker compose run web bundle exec rails db:create

echo Rodando migracoes...
docker compose run web bundle exec rails db:migrate

echo Rodando seed...
docker compose run web bundle exec rails db:seed

echo.
echo ==============================
echo Setup finalizado com sucesso!
echo ==============================

pause
