@echo off
cd /d "%~dp0"
call gradlew.bat assembleDebug
if errorlevel 1 (
  echo.
  echo Build failed. Check Android SDK, JDK and internet connection.
  pause
  exit /b 1
)
echo.
echo APK created at: app\build\outputs\apk\debug\app-debug.apk
pause
