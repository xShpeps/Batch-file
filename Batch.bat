@echo off
chcp 65001

cd C:\Users\Admin\Desktop\Lab 3 AK\Лабораторні\PT 22-1\Щербина К О

mkdir "batch"
cd "batch"

mkdir "Схована папка"
attrib +h "Схована папка"

mkdir "Не схована папка"

xcopy /? > "Не схована папка\copyhelp.txt"
echo F | xcopy "Не схована папка\copyhelp.txt" "Схована папка\copied_copyhelp.txt"
