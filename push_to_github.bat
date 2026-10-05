@echo off
echo ===================================================
echo Pushing SoulSpace to https://github.com/Nritya-coder/ssproject.git
echo ===================================================

cd /d "%~dp0"
set "PATH=C:\Program Files\Git\cmd;%PATH%"

git config user.name >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    git config --global user.name "Nritya-coder"
    git config --global user.email "nritya-coder@users.noreply.github.com"
)

if not exist ".git" (
    echo Initializing Git repository...
    git init
    git branch -M main
    git remote add origin https://github.com/Nritya-coder/ssproject.git
) else (
    echo Updating remote origin...
    git remote set-url origin https://github.com/Nritya-coder/ssproject.git
)

echo Adding all files...
git add .

echo Committing files...
git commit -m "SoulSpace Spiritual Wellness Web Application - Meditation, Breathwork, and Yoga modules"

echo Pushing to GitHub main branch...
git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ===================================================
    echo Successfully pushed to GitHub!
    echo ===================================================
) else (
    echo.
    echo ===================================================
    echo Push encountered an issue.
    echo If GitHub asks for authentication, please sign in with your GitHub credentials or Personal Access Token (PAT).
    echo ===================================================
)

if "%1" neq "/nopause" pause
