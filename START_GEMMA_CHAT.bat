@echo off
title Gemma 4 Local AI Launcher
color 0b

echo ========================================================
echo        GEMMA 4 LOCAL OFFLINE AI WORKSPACE
echo ========================================================
echo Checking Ollama server...

:: Enable CORS for browser UI
set OLLAMA_ORIGINS=*

:: Check if Ollama is running on port 11434
curl -s http://127.0.0.1:11434/ >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Starting Ollama background server...
    start "" /b "%LOCALAPPDATA%\Programs\Ollama\ollama.exe" serve
    timeout /t 3 >nul
)

echo.
echo Launching Gemma 4 Chat Workspace in Browser...
start "" "%~dp0index.html"

echo.
echo ========================================================
echo  Gemma 4 is ready! Enjoy talking to your local AI!
echo ========================================================
exit
