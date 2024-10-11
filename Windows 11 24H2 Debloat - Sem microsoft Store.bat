@echo off
:: Desativar Telemetria
sc delete DiagTrack
sc delete dmwappushservice
echo "Telemetria desativada."

:: Remover aplicativos pré-instalados
powershell -Command "Get-AppxPackage -AllUsers | Remove-AppxPackage"
powershell -Command "Get-AppxProvisionedPackage -Online | Remove-AppxProvisionedPackage -Online"
echo "Aplicativos pré-instalados removidos."

:: Desativar Cortana
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
echo "Cortana desativada."

:: Desativar sugestões de aplicativos
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f
echo "Sugestões de aplicativos desativadas."

:: Desativar anúncios no Explorador de Arquivos
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSyncProviderNotifications /t REG_DWORD /d 0 /f
echo "Anúncios no Explorador de Arquivos desativados."

start https://www.youtube.com/@xerifetech?sub_confirmation=1

echo "Debloat concluído. Por favor, reinicie o computador para aplicar todas as mudanças."
pause
