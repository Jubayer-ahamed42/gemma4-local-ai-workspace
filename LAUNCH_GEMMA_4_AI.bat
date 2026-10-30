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
echo Opening Gemma 4 Web UI in Google Chrome...
start "" "%~dp0index.html"

echo.
echo Done! Enjoy talking to your local AI!
timeout /t 2 >nul
exit
