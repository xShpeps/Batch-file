@echo off
chcp 65001
setlocal enabledelayedexpansion

REM Перевірка наявності параметрів командного рядка
if "%~1"=="" (
    echo Не вказан каталог для пiдрахунку розмiру файлiв.
    echo Формат команди: %~nx0 "каталог"
    exit /b 1
)

set "total_size=0"

REM Обробка кожного переданого каталогу
for %%I in (%*) do (
    set "directory=%%~I"

    REM Перевірка існування каталогу
    if not exist "!directory!\*" (
        echo Каталог "!directory!" не знайдено.
        exit /b 1
    )

    REM Підрахунок обсягу файлів у каталозі
    for /f "tokens=*" %%A in ('dir /b /s /a-d "!directory!"') do (
        set "attributes=%%~aA"
        set "hidden=!attributes:~3,1!"
        set "readonly=!attributes:~4,1!"
        set "archive=!attributes:~5,1!"

        if "!hidden!"=="-" if "!readonly!"=="-" if "!archive!"=="-" (
            set /a total_size+=%%~zA
        )
    )
)

echo Суммарний розмiр файлiв: %total_size% байт

endlocal
exit /b 0
