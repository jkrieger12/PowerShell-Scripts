#Get-ComputerDiskUsage: retreives and displays the amount of free space on a computer
function Get-ComputerDiskUsage{
  Param(
  [String]$ComputerName
  )
  
  #Test if computer is there
  if( - not (Test-Connection -ComputerName $ComputerName -Quiet -Count 1)){
    write-host "$($ComputerName) is not available" -ForegroundColor Red
    Brek
  }
  
  #Get disk information
  $CDrive = Get-WMIObject -Class win32_logicaldisk -ComputerName $ComputerName | where DeviceID -eq 'C:'
  $FreeSpace = [math]::Round(($CDrive.FreeSpace/1073741824), 2)
  $DiskUsage = 100 - [math]::Round(($CDrive.Freespace / $CDrive.Size)*100,2)
  
  Write-Host "Freespace = $($Freespace) GB"
  Write-Host "Diskusage = $($DiskUsage) %"
}
