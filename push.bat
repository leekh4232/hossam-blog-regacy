@echo off
cls

echo $ git add --all && git commit -m "update %DATE% %TIME%"
echo ----------------------------------------
git add --all && && git commit -m "update %DATE% %TIME%"

echo.

echo $ git push origin main
echo ----------------------------------------
git push origin main
