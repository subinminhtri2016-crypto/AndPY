@echo off
setlocal
set GRADLE_VERSION=8.9
set GRADLE_HOME=%USERPROFILE%\.andpy-tools\gradle-%GRADLE_VERSION%
if exist "%GRADLE_HOME%\bin\gradle.bat" goto run_gradle
where gradle >nul 2>nul
if %ERRORLEVEL%==0 goto use_system_gradle
echo [AndPY] Chua tim thay Gradle. Dang tai Gradle %GRADLE_VERSION%...
set ZIP_FILE=%TEMP%\andpy-gradle-%GRADLE_VERSION%.zip
if not exist "%USERPROFILE%\.andpy-tools" mkdir "%USERPROFILE%\.andpy-tools"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri 'https://services.gradle.org/distributions/gradle-%GRADLE_VERSION%-bin.zip' -OutFile '%ZIP_FILE%'; Expand-Archive -LiteralPath '%ZIP_FILE%' -DestinationPath '%USERPROFILE%\.andpy-tools' -Force"
if not exist "%GRADLE_HOME%\bin\gradle.bat" (
  echo Khong tai duoc Gradle. Hay cai Gradle hoac mo project bang Android Studio.
  exit /b 1
)
:run_gradle
call "%GRADLE_HOME%\bin\gradle.bat" %*
exit /b %ERRORLEVEL%
:use_system_gradle
gradle %*
exit /b %ERRORLEVEL%
