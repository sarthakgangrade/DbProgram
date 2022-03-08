@echo off
@echo executing my table scripts bybatch processing
SQLCMD -S LAPTOP-T90KQF9S -d practice -E -i "D:\batchprocessing.sql"
pause