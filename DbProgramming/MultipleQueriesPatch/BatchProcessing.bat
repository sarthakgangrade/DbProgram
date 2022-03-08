@echo off
@echo executing multiple scripts by batch processing
for %%D in (*.sql) do SQLCMD -S LAPTOP-T90KQF9S -d practice -E -i "%%D"
pause