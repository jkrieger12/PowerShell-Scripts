﻿Get-WmiObject -Class win32_userprofile -ComputerName $ComputerName | where {(!$_.special) -and ($_.converttodatetime($_.lastusetime) -lt (Get-Date).AddDays(-30))} | Remove-WmiObject