@echo off
echo ===============================================
echo Manuscript to DOCX Converter for Book Projects
echo ===============================================
echo.
echo This batch file will:
echo 1. Run the PowerShell script to combine all chapters
echo 2. Convert the markdown file to DOCX using Pandoc
echo 3. Open the DOCX file in Microsoft Word
echo.
echo Prerequisites:
echo - Pandoc must be installed (https://pandoc.org/installing.html)
echo - Microsoft Word must be installed
echo.
echo Starting process...
echo.

echo Step 1: Creating Word reference template...
powershell -ExecutionPolicy Bypass -File .\prepare_word_template.ps1
if %ERRORLEVEL% NEQ 0 (
    echo Error creating Word template. Please make sure Microsoft Word is installed.
    pause
    exit /b 1
)
echo Word template created successfully.
echo.

echo Step 2: Running PowerShell script to combine chapters...
powershell -ExecutionPolicy Bypass -File .\combine_chapters.ps1
if %ERRORLEVEL% NEQ 0 (
    echo Error running PowerShell script. Please check the script and try again.
    pause
    exit /b 1
)
echo PowerShell script completed successfully.
echo.

echo Step 3: Checking if Pandoc is installed...
where pandoc >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Pandoc not found. Please install Pandoc from https://pandoc.org/installing.html
    echo After installing, run this batch file again.
    pause
    exit /b 1
)
echo Pandoc found. Converting markdown to DOCX...
pandoc -s ..\Complete_Manuscript.md -o ..\Complete_Manuscript.docx --from markdown --to docx --reference-doc=reference.docx
if %ERRORLEVEL% NEQ 0 (
    echo Error converting to DOCX. Please check if Complete_Manuscript.md exists.
    pause
    exit /b 1
)
echo Conversion to DOCX completed successfully.
echo.

echo Step 4: Opening DOCX file in Microsoft Word...
start "" "..\Complete_Manuscript.docx"
if %ERRORLEVEL% NEQ 0 (
    echo Error opening DOCX file. Please open it manually.
)
echo.

echo =============================================
echo PROCESS COMPLETED SUCCESSFULLY
echo =============================================
echo.
echo Next steps:
echo 1. Review the Word document for formatting issues
echo 2. Ensure chapter breaks and section formatting looks correct
echo 3. Run the spell-checker and review any flagged content
echo 4. Save the properly formatted document
echo 5. Export to other formats as needed
echo.
pause
