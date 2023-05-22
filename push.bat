@echo off
cls

echo $ git add --all
git add --all

echo $ git commit -m "update"
echo ----------------------------------------
git commit -m "update"

echo.

echo $ git push origin main
echo ----------------------------------------
git push origin main
