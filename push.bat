@echo off
cls

echo $ git add --all
git add --all

echo $ git commit -m "update %DATE% %TIME%"
echo ----------------------------------------
echo $ git commit -m "update %DATE% %TIME%"

echo.

echo $ git push origin main
echo ----------------------------------------
git push origin main
