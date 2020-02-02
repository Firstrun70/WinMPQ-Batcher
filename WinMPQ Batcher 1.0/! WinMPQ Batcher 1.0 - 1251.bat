@echo off
::chcp of your country
::chcp вашей страны
chcp 1251
::Path to the WinMPQ.exe, for example C:\WinMPQ v1.64\WinMPQ.exe (without quotes)
::Путь к WinMPQ.exe, например C:\WinMPQ v1.64\WinMPQ.exe (без кавычек)
set WinMPQ=C:\WinMPQ v1.64\WinMPQ.exe
::Path to the folder with maps, for example C:\maps (without quotes and without a slash at the end)
::Путь к папке с картами, например C:\maps (без кавычек и без слеша в конце)
set DirMap=C:\maps
::Path to the folder with the output of the result, for example C:\maps\unpack (without quotes and without a slash at the end)
::Путь к папке с выводом результата, например C:\maps\unpack (без кавычек и без слеша в конце)
set DirRes=C:\maps\unpack

echo WinMPQ Batcher 1.0
echo 1 - English, 2 - Russian
Set /p lang=""
if NOT %lang%==1 if NOT %lang%==2 exit
if "%lang%"=="1" echo 1 - Current Dir, 2 - Specified Folder
if "%lang%"=="2" echo 1 - Текущая папка, 2 - Заданная папка
Set /p curdir=""
if "%curdir%"=="1" (set DirMap=%CD%)
if "%curdir%"=="1" (set DirRes=%DirMap%\unpack)
if NOT %curdir%==1 if NOT %curdir%==2 exit
::File filter (w3x w3m w3n mpq)
::Фильтр файлов (w3x w3m w3n mpq)
set Filter="%DirMap%\*.w3x" "%DirMap%\*.w3m" "%DirMap%\*.w3n" "%DirMap%\*.mpq"
cls
if "%lang%"=="1" echo WinMPQ Batcher - Batch resource unpacker from w3x w3m w3n mpq
if "%lang%"=="2" echo WinMPQ Batcher - Пакетный распаковщик w3x w3m w3n mpq ресурсов
echo by Firstrun70
if "%lang%"=="1" echo v1.0 [12.25.2019]
if "%lang%"=="2" echo v1.0 [25.12.2019]
if "%lang%"=="1" echo Requires WinMPQ v1.64 + VB40032.DLL
if "%lang%"=="2" echo Требуется WinMPQ v1.64 + VB40032.DLL
if "%lang%"=="1" if "%curdir%"=="1" (echo Before starting this file, specify one folder set WinMPQ= and chcp of your country at the beginning of this file ^(via Notepad^))
if "%lang%"=="1" if "%curdir%"=="2" (echo Before starting this file, specify three folders and chcp of your country at the beginning of this file ^(via Notepad^))
if "%lang%"=="2" if "%curdir%"=="1" (echo Перед запуском этого файла укажите одну папку set WinMPQ= и chcp вашей страны в начале этого файла ^(через Блокнот^))
if "%lang%"=="2" if "%curdir%"=="2" (echo Перед запуском этого файла укажите три папки и chcp вашей страны в начале этого файла ^(через Блокнот^))
echo.
if "%lang%"=="1" echo Settings:
if "%lang%"=="2" echo Настройки:
chcp
if "%lang%"=="1" echo WinMPQ=%WinMPQ% (path to WinMPQ.exe)
if "%lang%"=="2" echo WinMPQ=%WinMPQ% (путь к WinMPQ.exe)
if "%lang%"=="1" echo DirMap=%DirMap% (folder with maps)
if "%lang%"=="2" echo DirMap=%DirMap% (папка с картами)
if "%lang%"=="1" echo DirRes=%DirRes% (folder with result)
if "%lang%"=="2" echo DirRes=%DirRes% (папка результата)
if "%lang%"=="1" call echo Filter=%%Filter:%DirMap%\=%% (file filter)
if "%lang%"=="2" call echo Filter=%%Filter:%DirMap%\=%% (фильтр файлов)
echo.
if "%lang%"=="1" echo Choose a work method:
if "%lang%"=="2" echo Выберите метод работы:
if "%lang%"=="1" echo 1 - Export to one folder. File names remain the same as maps: map.j map.w3i map.wts map.blp map.tga
if "%lang%"=="2" echo 1 - Экспорт в одну папку. Имена файлов как у карт: map.j map.w3i map.wts map.blp map.tga
if "%lang%"=="1" echo 2 - Export to different folders. Folder names remain the same as maps. File names remain original: war3map.j war3map.w3i war3map.wts war3mapMap.blp war3mapPreview.tga
if "%lang%"=="2" echo 2 - Экспорт в разные папки. Имена папок как у карт. Имена файлов оригинальные: war3map.j war3map.w3i war3map.wts war3mapMap.blp war3mapPreview.tga
if "%lang%"=="1" Set /p choice="Your choice (1 or 2, then Enter): "
if "%lang%"=="2" Set /p choice="Ваш выбор (1 или 2, потом Enter): "
goto ch

:ch
if "%choice%"=="1" (goto v1)
if "%choice%"=="2" (goto v2)
if "%choice%"=="11" (goto ver11)
if "%choice%"=="12" (goto ver12)
if "%choice%"=="21" (goto ver21)
if "%choice%"=="22" (goto ver22)
exit

:v1
:ver11
@echo off
for %%F in (%Filter%) do @( 
set "ff=%%F" & set "ffn=%%~nF" & set "ffx=%%~xF"
setlocal EnableDelayedExpansion
set ff2=!ffn!_!ffx:~1,3!
echo "!ff!" "!DirRes!\!ff2!.xxx" 
"!WinMPQ!" e "!ff!" war3map.j "!DirRes!" & rename "!DirRes!\war3map.j" "!ff2!.j"
"!WinMPQ!" e "!ff!" scripts\war3map.j "!DirRes!" & rename "!DirRes!\war3map.j" "!ff2!.j"
"!WinMPQ!" e "!ff!" war3map.w3i "!DirRes!" & rename "!DirRes!\war3map.w3i" "!ff2!.w3i"
"!WinMPQ!" e "!ff!" _Locales\ruRU.w3mod\war3map.wts "!DirRes!" & rename "!DirRes!\war3map.wts" "!ff2!-ru.wts"
"!WinMPQ!" e "!ff!" war3map.wts "!DirRes!" & rename "!DirRes!\war3map.wts" "!ff2!.wts"
"!WinMPQ!" e "!ff!" war3mapMap.blp "!DirRes!" & rename "!DirRes!\war3mapMap.blp" "!ff2!.blp"
"!WinMPQ!" e "!ff!" war3mapMap.tga "!DirRes!" & rename "!DirRes!\war3mapMap.tga" "!ff2!-Map.tga"
"!WinMPQ!" e "!ff!" war3mapPreview.tga "!DirRes!" & rename "!DirRes!\war3mapPreview.tga" "!ff2!-Preview.tga"
"!WinMPQ!" e "!ff!" war3campaign.w3f "!DirRes!" & rename "!DirRes!\war3campaign.w3f" "!ff2!.w3f"
"!WinMPQ!" e "!ff!" war3campaign.wts "!DirRes!" & rename "!DirRes!\war3campaign.wts" "!ff2!.wts"
endlocal
)
@goto end
:ver12
@cmd /v/c "for %%F in (%Filter%) do @( set "Ext=%%~xF" & call @echo^"^&^
"%WinMPQ%" e "%%F" war3map.j "%DirRes%" & call rename "%DirRes%\war3map.j" "%%~nF_%%Ext:~1%%.j" & call echo %date% %time% "%%F" "%DirRes%\%%~nF_%%Ext:~1%%.j" & call @echo^"^&^
"%WinMPQ%" e "%%F" scripts\war3map.j "%DirRes%" & call rename "%DirRes%\war3map.j" "%%~nF_%%Ext:~1%%.j" & call echo %date% %time% "%%F" "%DirRes%\%%~nF_%%Ext:~1%%.j" & call @echo^"^&^
"%WinMPQ%" e "%%F" war3map.w3i "%DirRes%" & call rename "%DirRes%\war3map.w3i" "%%~nF_%%Ext:~1%%.w3i" & call echo %date% %time% "%%F" "%DirRes%\%%~nF_%%Ext:~1%%.w3i" & call @echo^"^&^
"%WinMPQ%" e "%%F" _Locales\ruRU.w3mod\war3map.wts "%DirRes%" & call rename "%DirRes%\war3map.wts" "%%~nF_%%Ext:~1%%-ru.wts" & call echo %date% %time% "%%F" "%DirRes%\%%~nF_%%Ext:~1%%-ru.wts" & call @echo^"^&^
"%WinMPQ%" e "%%F" war3map.wts "%DirRes%" & call rename "%DirRes%\war3map.wts" "%%~nF_%%Ext:~1%%.wts" & call echo %date% %time% "%%F" "%DirRes%\%%~nF_%%Ext:~1%%.wts" & call @echo^"^&^
"%WinMPQ%" e "%%F" war3mapMap.blp "%DirRes%" & call rename "%DirRes%\war3mapMap.blp" "%%~nF_%%Ext:~1%%.blp" & call echo %date% %time% "%%F" "%DirRes%\%%~nF_%%Ext:~1%%.blp" & call @echo^"^&^
"%WinMPQ%" e "%%F" war3mapMap.tga "%DirRes%" & call rename "%DirRes%\war3mapMap.tga" "%%~nF_%%Ext:~1%%-Map.tga" & call echo %date% %time% "%%F" "%DirRes%\%%~nF_%%Ext:~1%%-Map.tga" & call @echo^"^&^
"%WinMPQ%" e "%%F" war3mapPreview.tga "%DirRes%" & call rename "%DirRes%\war3mapPreview.tga" "%%~nF_%%Ext:~1%%-Preview.tga" & call echo %date% %time% "%%F" "%DirRes%\%%~nF_%%Ext:~1%%-Preview.tga" & call @echo^"^&^
"%WinMPQ%" e "%%F" war3campaign.w3f "%DirRes%" & call rename "%DirRes%\war3campaign.w3f" "%%~nF_%%Ext:~1%%.w3f" & call echo %date% %time% "%%F" "%DirRes%\%%~nF_%%Ext:~1%%.w3f" & call @echo^"^&^
"%WinMPQ%" e "%%F" war3campaign.wts "%DirRes%" & call rename "%DirRes%\war3campaign.wts" "%%~nF_%%Ext:~1%%.wts" & call echo %date% %time% "%%F" "%DirRes%\%%~nF_%%Ext:~1%%.wts")"
@goto end

:v2
:ver21
@echo off
for %%F in (%Filter%) do @( 
set "ff=%%F" & set "ffn=%%~nF" & set "ffx=%%~xF"
setlocal EnableDelayedExpansion
set ff2=!ffn!!ffx:.=_!
echo "!ff!" "!DirRes!\!ff2!\*.xxx" 
"!WinMPQ!" e "!ff!" war3map.j "!DirRes!\!ff2!"
"!WinMPQ!" e "!ff!" scripts\war3map.j "!DirRes!\!ff2!"
"!WinMPQ!" e "!ff!" war3map.w3i "!DirRes!\!ff2!"
"!WinMPQ!" e "!ff!" _Locales\ruRU.w3mod\war3map.wts "!DirRes!\!ff2!" & rename "!DirRes!\!ff2!\war3map.wts" "war3map-ru.wts"
"!WinMPQ!" e "!ff!" war3map.wts "!DirRes!\!ff2!"
"!WinMPQ!" e "!ff!" war3mapMap.blp "!DirRes!\!ff2!"
"!WinMPQ!" e "!ff!" war3mapMap.tga "!DirRes!\!ff2!"
"!WinMPQ!" e "!ff!" war3mapPreview.tga "!DirRes!\!ff2!"
"!WinMPQ!" e "!ff!" war3campaign.w3f "!DirRes!\!ff2!"
"!WinMPQ!" e "!ff!" war3campaign.wts "!DirRes!\!ff2!"
endlocal
)
@goto end
:ver22
@cmd /v/c "for %%F in (%Filter%) do @( set "ffn=%%~nF" & set "ffx=%%~xF" & set "ff2=!ffn!!ffx:.=_!" & echo %date% %time% "%%F" "%DirRes%\!ff2!\*.xxx" & call @echo^"^&^
"%WinMPQ%" e "%%F" war3map.j "%DirRes%\!ff2!" & call @echo^"^&^
"%WinMPQ%" e "%%F" scripts\war3map.j "%DirRes%\!ff2!" & call @echo^"^&^
"%WinMPQ%" e "%%F" war3map.w3i "%DirRes%\!ff2!" & call @echo^"^&^
"%WinMPQ%" e "%%F" _Locales\ruRU.w3mod\war3map.wts "%DirRes%\!ff2!" & call rename "%DirRes%\!ff2!\war3map.wts" "war3map-ru.wts" & call @echo^"^&^
"%WinMPQ%" e "%%F" war3map.wts "%DirRes%\!ff2!" & call @echo^"^&^
"%WinMPQ%" e "%%F" war3mapMap.blp "%DirRes%\!ff2!" & call @echo^"^&^
"%WinMPQ%" e "%%F" war3mapMap.tga "%DirRes%\!ff2!" & call @echo^"^&^
"%WinMPQ%" e "%%F" war3mapPreview.tga "%DirRes%\!ff2!" & call @echo^"^&^
"%WinMPQ%" e "%%F" war3campaign.w3f "%DirRes%\!ff2!" & call @echo^"^&^
"%WinMPQ%" e "%%F" war3campaign.wts "%DirRes%\!ff2!")"
@goto end

:end
@echo off
echo.
if "%lang%"=="1" (echo war3mapMap.blp can be converted in png through the program BLP Lab in batch mode)
if "%lang%"=="2" (echo war3mapMap.blp пакетно можно конвертировать в png через программу BLP Lab)
echo.
@pause