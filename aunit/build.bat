set LIB=static
set ARCHITECTURE=windows
set TARGET=debug
set PROJECT=main.gpr
set BASE_PATH=P:
set GPR_DIRECTORY=%BASE_PATH%\gpr
set USER=wayne
echo PROJECT=%PROJECT%
echo GPR_DIRECTORY=%PROJECT_DIRECTORY%
rem Taskkill /IM db_view.exe /F
gprbuild -p -P %PROJECT% -aP..\lib -aP"%GPR_DIRECTORY%" -j10 -d


