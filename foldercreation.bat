@echo off
setlocal enabledelayedexpansion

cls
echo.
echo  ============================================
echo        A-Z FOLDER CREATOR  v5
echo  ============================================
echo.

:: ─────────────────────────────────────────────
:: STEP 1 — Location
:: ─────────────────────────────────────────────
echo  STEP 1 - Where to create the folders?
echo.
set /p "root=  Full path (e.g. F:\  or  D:\MyFiles): "
if "!root!"=="" (
    set "root=C:\AZ_Structure"
    echo   No input. Using default: C:\AZ_Structure
)

:: Remove trailing backslash unless it is a bare drive root like F:\
set "tail=!root:~-1!"
set "len3=!root:~3!"
if "!tail!"=="\" if not "!len3!"=="" set "root=!root:~0,-1!"

:: Check drive exists
set "drv=!root:~0,2!"
if not exist "!drv!\" (
    echo.
    echo  ERROR: Drive !drv! not found. Check the path.
    pause & exit /b 1
)
echo   OK - Location: !root!

:: ─────────────────────────────────────────────
:: STEP 2 — First-level folder count
:: ─────────────────────────────────────────────
echo.
echo  ============================================
echo  STEP 2 - How many folders on the FIRST level?
echo.
echo    1  = A only
echo    7  = A B C D E F G
echo    26 = A to Z (full alphabet)
echo.
set /p "firstCount=  Enter a number (1 to 26): "
if "!firstCount!"=="" set "firstCount=26"
set /a firstCount=!firstCount! 2>nul
if !firstCount! LSS 1  set firstCount=1
if !firstCount! GTR 26 set firstCount=26

set "ALL=ABCDEFGHIJKLMNOPQRSTUVWXYZ"
set /a _ei=firstCount-1
set "firstEnd=!ALL:~%_ei%,1!"
echo   First level: A to !firstEnd! (!firstCount! folders)

:: ─────────────────────────────────────────────
:: STEP 3 — How many levels inside each folder
:: ─────────────────────────────────────────────
echo.
echo  ============================================
echo  STEP 3 - How many levels INSIDE each folder?
echo.
echo    1 = root\A\A               (1 level inside)
echo    2 = root\A\A\A             (2 levels inside)
echo    3 = root\A\A\A\A           (3 levels inside)
echo    4 = root\A\A\A\A\A         (4 levels inside)
echo.
echo    Note: inner folders use the same A-Z count as first level
echo.
set /p "innerLevels=  Enter a number (1 to 26): "
if "!innerLevels!"=="" set "innerLevels=1"
set /a innerLevels=!innerLevels! 2>nul
if !innerLevels! LSS 1 set innerLevels=1
if !innerLevels! GTR 4 set innerLevels=4

set /a totalLevels=innerLevels+1

:: ─────────────────────────────────────────────
:: Calculate total folders and approx size
:: Each empty NTFS folder = ~4 KB metadata
:: ─────────────────────────────────────────────
set /a totalFolders=firstCount
set /a runCount=firstCount
for /L %%i in (1,1,!innerLevels!) do (
    set /a runCount*=firstCount
    set /a totalFolders+=runCount
)
set /a approxKB=totalFolders*4
set /a approxMB=(approxKB+1023)/1024

:: ─────────────────────────────────────────────
:: Summary
:: ─────────────────────────────────────────────
echo.
echo  ============================================
echo  SUMMARY
echo  ============================================
echo.
echo   Location       : !root!
echo   First level    : A to !firstEnd! (!firstCount! folders)
echo   Levels inside  : !innerLevels! level(s) inside each folder
echo   Total levels   : !totalLevels!
echo   Total folders  : ~!totalFolders!
echo   Approx size    : ~!approxMB! MB
echo.
echo  Deepest path example:
set "exPath=!root!"
for /L %%i in (1,1,!totalLevels!) do set "exPath=!exPath!\A"
echo   !exPath!
echo.
set /p "go=  Create now? (Y to confirm / N to cancel): "
if /i not "!go!"=="Y" (
    echo   Cancelled. Nothing was created.
    pause & exit /b 0
)

:: ─────────────────────────────────────────────
:: Create folders
:: ─────────────────────────────────────────────
echo.
echo  Creating folders... Do NOT close this window!
echo.
md "!root!" 2>nul

set /a done=0
set /a lastI=firstCount-1

if !totalLevels!==2 (
    for /L %%A in (0,1,!lastI!) do (
        set "LA=!ALL:~%%A,1!"
        md "!root!\!LA!" 2>nul & set /a done+=1
        for /L %%B in (0,1,!lastI!) do (
            set "LB=!ALL:~%%B,1!"
            md "!root!\!LA!\!LB!" 2>nul & set /a done+=1
        )
    )
)

if !totalLevels!==3 (
    for /L %%A in (0,1,!lastI!) do (
        set "LA=!ALL:~%%A,1!"
        md "!root!\!LA!" 2>nul & set /a done+=1
        for /L %%B in (0,1,!lastI!) do (
            set "LB=!ALL:~%%B,1!"
            md "!root!\!LA!\!LB!" 2>nul & set /a done+=1
            for /L %%C in (0,1,!lastI!) do (
                set "LC=!ALL:~%%C,1!"
                md "!root!\!LA!\!LB!\!LC!" 2>nul & set /a done+=1
            )
        )
    )
)

if !totalLevels!==4 (
    for /L %%A in (0,1,!lastI!) do (
        set "LA=!ALL:~%%A,1!"
        md "!root!\!LA!" 2>nul & set /a done+=1
        for /L %%B in (0,1,!lastI!) do (
            set "LB=!ALL:~%%B,1!"
            md "!root!\!LA!\!LB!" 2>nul & set /a done+=1
            for /L %%C in (0,1,!lastI!) do (
                set "LC=!ALL:~%%C,1!"
                md "!root!\!LA!\!LB!\!LC!" 2>nul & set /a done+=1
                for /L %%D in (0,1,!lastI!) do (
                    set "LD=!ALL:~%%D,1!"
                    md "!root!\!LA!\!LB!\!LC!\!LD!" 2>nul & set /a done+=1
                )
            )
        )
    )
)

if !totalLevels!==5 (
    for /L %%A in (0,1,!lastI!) do (
        set "LA=!ALL:~%%A,1!"
        md "!root!\!LA!" 2>nul & set /a done+=1
        for /L %%B in (0,1,!lastI!) do (
            set "LB=!ALL:~%%B,1!"
            md "!root!\!LA!\!LB!" 2>nul & set /a done+=1
            for /L %%C in (0,1,!lastI!) do (
                set "LC=!ALL:~%%C,1!"
                md "!root!\!LA!\!LB!\!LC!" 2>nul & set /a done+=1
                for /L %%D in (0,1,!lastI!) do (
                    set "LD=!ALL:~%%D,1!"
                    md "!root!\!LA!\!LB!\!LC!\!LD!" 2>nul & set /a done+=1
                    for /L %%E in (0,1,!lastI!) do (
                        set "LE=!ALL:~%%E,1!"
                        md "!root!\!LA!\!LB!\!LC!\!LD!\!LE!" 2>nul & set /a done+=1
                    )
                )
            )
        )
    )
)

set /a finalMB=(done*4+1023)/1024

echo.
echo  ============================================
echo  DONE!
echo  ============================================
echo.
echo   Folders created : !done!
echo   Approx size     : ~!finalMB! MB
echo   Location        : !root!
echo.
pause
exit /b 0