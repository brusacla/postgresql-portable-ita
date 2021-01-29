REM Metti questo batch nella cartella decompressa dei file binari di PostgreSQL
REM che dovrà contenere la cartella bin e tutto il resto ed esguilo da li.

REM Lo script imposta le variabili di PostgreSQL
@SET PATH="%~dp0\bin";%PATH%
@SET PGDATA=%~dp0\data
@SET PGDATABASE=postgres
@SET PGUSER=postgres
@SET PGPORT=5439
@SET PGLOCALEDIR=%~dp0\share\locale

ECHO.
IF EXIST data (
ECHO Questa istanza è già inizializzata.
ECHO.
) ELSE (
ECHO Prima esecuzione, attendere l'inizializzazione.
"%~dp0\bin\initdb" -U postgres -A trust
ECHO.
)
"%~dp0\bin\pg_ctl" -D "%~dp0/data" -l logfile start
ECHO.
ECHO Server di postgres attivo sulla porta %PGPORT%
ECHO.
REM pause
set /p DUMMY=Premi ENTER per terminare il servizio ...
"%~dp0\bin\pg_ctl" -D "%~dp0/data" stop
