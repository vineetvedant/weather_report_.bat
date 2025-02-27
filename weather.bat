@echo off
title Weather Information System
color 0A
mode con: cols=80 lines=30
setlocal enabledelayedexpansion

:: Main Menu for Country Selection
:main
cls
echo ========================================
echo        Weather Information System
echo ========================================
echo.
echo Select a Country:
echo 1. United States
echo 2. India
echo 3. United Kingdom
echo 4. Canada
echo 5. Australia
echo 6. Japan
echo 7. Germany
echo 8. France
echo 9. Italy
echo 10. Brazil
echo 11. South Africa
echo 12. China
echo 13. Russia
echo 14. South Korea
echo 15. Saudi Arabia
echo.
set /p country=Enter the number of the country: 

:: Country and City Mapping
if "%country%"=="1" set "countryName=United States" & set "cities=New York,Los Angeles,Chicago,Houston,Phoenix"
if "%country%"=="2" set "countryName=India" & set "cities=New Delhi,Mumbai,Bangalore,Hyderabad,Chennai"
if "%country%"=="3" set "countryName=United Kingdom" & set "cities=London,Birmingham,Manchester,Glasgow,Liverpool"
if "%country%"=="4" set "countryName=Canada" & set "cities=Toronto,Vancouver,Calgary,Ottawa,Edmonton"
if "%country%"=="5" set "countryName=Australia" & set "cities=Sydney,Melbourne,Brisbane,Perth,Adelaide"
if "%country%"=="6" set "countryName=Japan" & set "cities=Tokyo,Osaka,Nagoya,Sapporo,Fukuoka"
if "%country%"=="7" set "countryName=Germany" & set "cities=Berlin,Hamburg,Munich,Cologne,Frankfurt"
if "%country%"=="8" set "countryName=France" & set "cities=Paris,Marseille,Lyon,Toulouse,Nice"
if "%country%"=="9" set "countryName=Italy" & set "cities=Rome,Milan,Naples,Turin,Palermo"
if "%country%"=="10" set "countryName=Brazil" & set "cities=Sao Paulo,Rio de Janeiro,Brasilia,Salvador,Fortaleza"
if "%country%"=="11" set "countryName=South Africa" & set "cities=Johannesburg,Cape Town,Pretoria,Durban,Bloemfontein"
if "%country%"=="12" set "countryName=China" & set "cities=Beijing,Shanghai,Guangzhou,Shenzhen,Chengdu"
if "%country%"=="13" set "countryName=Russia" & set "cities=Moscow,St Petersburg,Novosibirsk,Yekaterinburg,Kazan"
if "%country%"=="14" set "countryName=South Korea" & set "cities=Seoul,Busan,Incheon,Daegu,Daejeon"
if "%country%"=="15" set "countryName=Saudi Arabia" & set "cities=Riyadh,Jeddah,Mecca,Medina,Dammam"

if not defined cities (
    echo Invalid selection. Please try again.
    pause
    goto main
)

:: City Selection with Dynamic Indexing
:select_city
cls
echo Selected Country: %countryName%
echo.
echo Select a City:
set /a count=1
for %%c in (%cities%) do (
    echo !count!. %%c
    set "city[!count!]=%%c"
    set /a count+=1
)
echo.
set /p city=Enter the number of the city: 

:: Map city number to name
set "cityName=!city[%city%]!"

if "%cityName%"=="" (
    echo Invalid selection. Please try again.
    pause
    goto select_city
)

:: Fetch Weather Data from wttr.in
cls
echo Fetching weather data for %cityName%, %countryName%...
echo.
curl -s wttr.in/%cityName%?0

:: Display watermark and link
echo.
echo ----------------------------------------
echo          ~vedant_singh
echo ----------------------------------------
echo LinkedIn: https://www.linkedin.com/in/vedant-singh-2550b2202/
echo.
pause
goto main
