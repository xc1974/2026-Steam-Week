@echo off
TITLE ML-Agents Automatic Installer
CLS

ECHO ========================================================
ECHO       UNITY ML-AGENTS AUTOMATIC INSTALLER (WINDOWS)
ECHO ========================================================
ECHO.
ECHO This script will:
ECHO 1. Check for Python
ECHO 2. Create a virtual environment named 'ml-agents-env'
ECHO 3. Install PyTorch and ML-Agents
ECHO.
ECHO NOTE: Make sure you have Python 3.10 installed and added to PATH.
ECHO.
PAUSE

REM --- Check if Python is accessible ---
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO.
    ECHO [ERROR] Python was not found in your PATH. 
    ECHO Please install Python 3.10 and check "Add Python to PATH" in the installer.
    PAUSE
    EXIT /B
)

ECHO.
ECHO [1/4] Creating Virtual Environment...
python -m venv ml-agents-env

ECHO.
ECHO [2/4] Activating Environment...
CALL ml-agents-env\Scripts\activate.bat

ECHO.
ECHO [3/4] Upgrading PIP...
python -m pip install --upgrade pip

ECHO.
ECHO [4/4] Installing PyTorch (CPU) and ML-Agents...
REM Installing CPU version of PyTorch to save space and compatibility
pip install torch torchvision torchaudio
pip install mlagents

ECHO.
ECHO ========================================================
ECHO                 INSTALLATION COMPLETE
ECHO ========================================================
ECHO.
ECHO To start training in the future:
ECHO 1. Open Command Prompt in this folder.
ECHO 2. Type: ml-agents-env\Scripts\activate
ECHO 3. Navigate to your Unity project and run mlagents-learn
ECHO.
PAUSE
