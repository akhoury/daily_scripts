@echo off
cd /d %~dp0
set EMAIL=your_no-ip_email@something.com
set PASS=yourpassword

del refreshHost.js
wget --no-check-certificate https://raw.github.com/akhoury/daily_scripts/master/refreshHost.js
casperjs refreshHost.js %EMAIL% %PASS% > casper-logs.txt