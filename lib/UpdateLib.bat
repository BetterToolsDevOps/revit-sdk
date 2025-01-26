@echo off
:: Replace files in TargetFolder with files from SourceFolder

:: Set the source and target folder paths
set "SourceFolder=C:\Program Files\Autodesk\Revit %~1"
set "TargetFolder=%~1"

:: Verify that the source folder exists
if not exist "%SourceFolder%" (
    echo Source folder does not exist: %SourceFolder%
    pause
    exit /b
)

:: Verify that the target folder exists
if not exist "%TargetFolder%" (
    echo Target folder does not exist: %TargetFolder%
    pause
    exit /b
)

echo Replacing files...
for %%F in ("%SourceFolder%\*") do (
    if exist "%TargetFolder%\%%~nF%%~xF" (
        echo Replacing %%~nF%%~xF in the target folder
        copy /Y "%%F" "%TargetFolder%\"
    )
)

echo Files replaced successfully!
pause
