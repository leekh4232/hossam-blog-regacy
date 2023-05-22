@echo off
cls

echo $ git pull origin main
echo ----------------------------------------
git pull origin main

echo.

echo $ git add --all
git add --all

echo.

echo $ git commit -m "update %DATE% %TIME%"
echo ----------------------------------------
git commit -m "update %DATE% %TIME%"

echo.

echo $ git push origin main
echo ----------------------------------------
git push origin main
